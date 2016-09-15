/*
//  luaparser.c
//
//  Pure Lua parser analysing a Lua source string for providing syntax tree information to an external client
// 
//  Derived from lparser.c (see below)
//
//  Created by Jean-Luc Jumpertz on 29/02/12.
//  Copyright (c) 2012 JL Jumpertz. All rights reserved.
//  Copyright © 1994–2012 Lua.org, PUC-Rio.
*/

/*
** $Id: lparser.c,v 2.130 2013/02/06 13:37:39 roberto Exp $
** Lua Parser
** See Copyright Notice in lua.h
*/


#include <string.h>

#define lparser_c
#define LUA_CORE

#include "lua.h"
#include "luaparser.h"

#include "lcode.h"
#include "ldebug.h"
#include "ldo.h"
#include "lfunc.h"
#include "llex.h"
#include "lmem.h"
#include "lobject.h"
#include "lopcodes.h"
#include "lparser.h"
#include "lstate.h"
#include "lstring.h"
#include "ltable.h"



/* maximum number of local variables per function (must be smaller
   than 250, due to the bytecode format) */
#define MAXVARS		200


#define hasmultret(k)		((k) == VCALL || (k) == VVARARG)

enum SYNTAX_ERROR_TYPES {
  SYNTAX_ERROR_GENERIC = LEX_ERROR_SYNTAX,
  SYNTAX_ERROR_SEMANTIC = LAST_LEX_ERROR + 1,
  SYNTAX_ERROR_EXPECTED,
};

/*
 ** Syntax analyzer support
 */

static void next_token (LexState *ls);
static int lookahead_token (LexState *ls);

static void notify_implicitlocalvar (LexState *ls, const char* varname);
static void notify_blockstart (LexState *ls, LuaSyntaxBlockType blocktype);
static void notify_blockend (LexState *ls, LuaSyntaxBlockType blocktype);
static void notify_blockcancel (LexState *ls, LuaSyntaxBlockType blocktype);
static void notify_statementtype (LexState *ls, LuaSyntaxStatementType statementtype); /* set statement type of current block */
static void notify_expressionstart (LexState *ls, LuaSyntaxExpressionType expressiontype);
static void notify_expressionend (LexState *ls);
static void notify_expressiontype (LexState *ls, LuaSyntaxExpressionType expressiontype); /* set expression type of current block */
static void notify_subexpressionend (LexState *ls, LuaSyntaxExpressionType expressiontype); /* create and ends a subexpression of the current block starting at the block location*/

static void notify_nametype (LexState *ls, LuaSyntaxTokenType nameType); /* set name type for the current token */
/*
 ** Dyndata utilities
 */

static void initdyndata (lua_State *L, Dyndata* dyd)
{
  dyd->actvar.arr = NULL; 
  dyd->actvar.size = 0;
  dyd->actvar.n = 0;
  dyd->gt.arr = NULL; 
  dyd->gt.size = 0;
  dyd->gt.n = 0;
  dyd->label.arr = NULL; 
  dyd->label.size = 0;
  dyd->label.n = 0;
}

static void freedyndata (lua_State *L, Dyndata* dyd)
{
  luaM_freearray(L, dyd->actvar.arr, dyd->actvar.size);
  luaM_freearray(L, dyd->gt.arr, dyd->gt.size);
  luaM_freearray(L, dyd->label.arr, dyd->label.size);
  initdyndata (L, dyd);
}

/*
** nodes for block list (list of active blocks)
*/
typedef struct BlockCnt {
  struct BlockCnt *previous;  /* chain */
  short firstlabel;  /* index of first label in this block */
  short firstgoto;  /* index of first pending goto in this block */
  lu_byte nactvar;  /* # active locals outside the block */
  lu_byte upval;  /* true if some variable in the block is an upvalue */
  lu_byte isloop;  /* true if `block' is a loop */
} BlockCnt;



/*
** prototypes for recursive non-terminal functions
*/
static void statement (LexState *ls);
static void expr (LexState *ls, expdesc *v);


static void anchor_token (LexState *ls) {
  /* last token from outer function must be EOS */
  lua_assert(ls->fs != NULL || ls->t.token == TK_EOS);
  if (ls->t.token == TK_NAME || ls->t.token == TK_STRING) {
    TString *ts = ls->t.seminfo.ts;
    luaX_newstring(ls, getstr(ts), ts->tsv.len);
  }
}


/* semantic error */
static l_noret semerror (LexState *ls, const char *msg) {
  ls->t.token = 0;  /* remove 'near to' from final message */
  luaX_syntaxError(ls, SYNTAX_ERROR_SEMANTIC, msg);
}


static l_noret error_expected (LexState *ls, int token) {
  luaX_syntaxError(ls, SYNTAX_ERROR_EXPECTED, 
      luaO_pushfstring(ls->L, "%s expected", luaX_token2str(ls, token)));
}


static l_noret errorlimit (FuncState *fs, int limit, const char *what) {
  lua_State *L = fs->ls->L;
  const char *msg;
  int line = fs->f->linedefined;
  const char *where = (line == 0)
                      ? "main function"
                      : luaO_pushfstring(L, "function at line %d", line);
  msg = luaO_pushfstring(L, "too many %s (limit is %d) in %s",
                             what, limit, where);
  luaX_syntaxError(fs->ls, LEX_ERROR_LIMIT, msg);
}


static void checklimit (FuncState *fs, int v, int l, const char *what) {
  if (v > l) errorlimit(fs, l, what);
}


static int testnext (LexState *ls, int c) {
  if (ls->t.token == c) {
    next_token(ls);
    return 1;
  }
  else return 0;
}


static void check (LexState *ls, int c) {
  if (ls->t.token != c)
    error_expected(ls, c);
}


static void checknext (LexState *ls, int c) {
  check(ls, c);
  next_token(ls);
}


#define check_condition(ls,c,msg)	{ if (!(c)) luaX_syntaxError(ls, SYNTAX_ERROR_GENERIC, msg); }



static void check_match (LexState *ls, int what, int who, int where) {
  if (!testnext(ls, what)) {
    if (where == ls->linenumber)
      error_expected(ls, what);
    else {
      luaX_syntaxError(ls, SYNTAX_ERROR_EXPECTED, luaO_pushfstring(ls->L,
             "%s expected (to close %s at line %d)",
              luaX_token2str(ls, what), luaX_token2str(ls, who), where));
    }
  }
}


static TString *str_checkname (LexState *ls) {
  TString *ts;
  check(ls, TK_NAME);
  ts = ls->t.seminfo.ts;
  return ts;
}


static void init_exp (expdesc *e, expkind k, int i) {
  e->f = e->t = NO_JUMP;
  e->k = k;
  e->u.info = i;
}


static void codestring (LexState *ls, expdesc *e, TString *s) {
  init_exp(e, VK, luaK_stringK(ls->fs, s));
}


static void checkname (LexState *ls, expdesc *e) {
  codestring(ls, e, str_checkname(ls));
}


static int registerlocalvar (LexState *ls, TString *varname) {
  FuncState *fs = ls->fs;
  Proto *f = fs->f;
  int oldsize = f->sizelocvars;
  luaM_growvector(ls->L, f->locvars, fs->nlocvars, f->sizelocvars,
                  LocVar, SHRT_MAX, "local variables");
  while (oldsize < f->sizelocvars) f->locvars[oldsize++].varname = NULL;
  f->locvars[fs->nlocvars].varname = varname;
  luaC_objbarrier(ls->L, f, varname);
  return fs->nlocvars++;
}


static void new_localvar (LexState *ls, TString *name) {
  FuncState *fs = ls->fs;
  Dyndata *dyd = ls->dyd;
  int reg = registerlocalvar(ls, name);
  checklimit(fs, dyd->actvar.n + 1 - fs->firstlocal,
                  MAXVARS, "local variables");
  luaM_growvector(ls->L, dyd->actvar.arr, dyd->actvar.n + 1,
                  dyd->actvar.size, Vardesc, MAX_INT, "local variables");
  dyd->actvar.arr[dyd->actvar.n++].idx = cast(short, reg);
  notify_nametype(ls, STXT_LOCALDECL);
}


static void new_localvarliteral_ (LexState *ls, const char *name, size_t sz) {
  new_localvar(ls, luaX_newstring(ls, name, sz));
}

#define new_localvarliteral(ls,v) \
	new_localvarliteral_(ls, "" v, (sizeof(v)/sizeof(char))-1)


static LocVar *getlocvar (FuncState *fs, int i) {
  int idx = fs->ls->dyd->actvar.arr[fs->firstlocal + i].idx;
  lua_assert(idx < fs->nlocvars);
  return &fs->f->locvars[idx];
}


static void adjustlocalvars (LexState *ls, int nvars) {
  FuncState *fs = ls->fs;
  fs->nactvar = cast_byte(fs->nactvar + nvars);
  for (; nvars; nvars--) {
    getlocvar(fs, fs->nactvar - nvars)->startpc = fs->pc;
  }
}


static void removevars (FuncState *fs, int tolevel) {
  fs->ls->dyd->actvar.n -= (fs->nactvar - tolevel);
  while (fs->nactvar > tolevel)
    getlocvar(fs, --fs->nactvar)->endpc = fs->pc;
}


static int searchupvalue (FuncState *fs, TString *name) {
  int i;
  Upvaldesc *up = fs->f->upvalues;
  for (i = 0; i < fs->nups; i++) {
    if (luaS_eqstr(up[i].name, name)) return i;
  }
  return -1;  /* not found */
}


static int newupvalue (FuncState *fs, TString *name, expdesc *v) {
  Proto *f = fs->f;
  int oldsize = f->sizeupvalues;
  checklimit(fs, fs->nups + 1, MAXUPVAL, "upvalues");
  luaM_growvector(fs->ls->L, f->upvalues, fs->nups, f->sizeupvalues,
                  Upvaldesc, MAXUPVAL, "upvalues");
  while (oldsize < f->sizeupvalues) f->upvalues[oldsize++].name = NULL;
  f->upvalues[fs->nups].instack = (v->k == VLOCAL);
  f->upvalues[fs->nups].idx = cast_byte(v->u.info);
  f->upvalues[fs->nups].name = name;
  luaC_objbarrier(fs->ls->L, f, name);
  return fs->nups++;
}


static int searchvar (FuncState *fs, TString *n) {
  int i;
  for (i = cast_int(fs->nactvar) - 1; i >= 0; i--) {
    if (luaS_eqstr(n, getlocvar(fs, i)->varname))
      return i;
  }
  return -1;  /* not found */
}

/*
  Mark block where variable at given level was defined
  (to emit close instructions later).
*/
static void markupval (FuncState *fs, int level) {
  BlockCnt *bl = fs->bl;
  while (bl->nactvar > level) bl = bl->previous;
  bl->upval = 1;
}


/*
  Find variable with given name 'n'. If it is an upvalue, add this
  upvalue into all intermediate functions.
*/
static int singlevaraux (FuncState *fs, TString *n, expdesc *var, int base) {
  if (fs == NULL)  /* no more levels? */
    return VVOID;  /* default is global */
  else {
    int v = searchvar(fs, n);  /* look up locals at current level */
    if (v >= 0) {  /* found? */
      init_exp(var, VLOCAL, v);  /* variable is local */
      if (!base)
        markupval(fs, v);  /* local will be used as an upval */
      return VLOCAL;
    }
    else {  /* not found as local at current level; try upvalues */
      int idx = searchupvalue(fs, n);  /* try existing upvalues */
      if (idx < 0) {  /* not found? */
        if (singlevaraux(fs->prev, n, var, 0) == VVOID) /* try upper levels */
          return VVOID;  /* not found; is a global */
        /* else was LOCAL or UPVAL */
        idx  = newupvalue(fs, n, var);  /* will be a new upvalue */
      }
      init_exp(var, VUPVAL, idx);
      return VUPVAL;
    }
  }
}


static void singlevar (LexState *ls, expdesc *var) {
  TString *varname = str_checkname(ls);
  FuncState *fs = ls->fs;
  LuaSyntaxTokenType nametype = STXT_NONE;
  if (singlevaraux(fs, varname, var, 1) == VVOID) {  /* global name? */
    expdesc key;
    singlevaraux(fs, ls->envn, var, 1);  /* get environment variable */
    lua_assert(var->k == VLOCAL || var->k == VUPVAL);
    codestring(ls, &key, varname);  /* key is variable name */
    luaK_indexed(fs, var, &key);  /* env[varname] */
    nametype = STXT_GLOBAL;
  }
  else if (var->k == VLOCAL) {
    nametype = STXT_LOCAL;
}
  else if (var->k == VUPVAL) {
    nametype = STXT_UPVALUE;
  }
  notify_nametype(ls, nametype);
  next_token(ls);
}


static void adjust_assign (LexState *ls, int nvars, int nexps, expdesc *e) {
  FuncState *fs = ls->fs;
  int extra = nvars - nexps;
  if (hasmultret(e->k)) {
    extra++;  /* includes call itself */
    if (extra < 0) extra = 0;
    luaK_setreturns(fs, e, extra);  /* last exp. provides the difference */
    if (extra > 1) luaK_reserveregs(fs, extra-1);
  }
  else {
    if (e->k != VVOID) luaK_exp2nextreg(fs, e);  /* close last expression */
    if (extra > 0) {
      int reg = fs->freereg;
      luaK_reserveregs(fs, extra);
      luaK_nil(fs, reg, extra);
    }
  }
}


static void enterlevel (LexState *ls) {
  lua_State *L = ls->L;
  ++L->nCcalls;
  checklimit(ls->fs, L->nCcalls, LUAI_MAXCCALLS, "C levels");
}


#define leavelevel(ls)	((ls)->L->nCcalls--)


static void closegoto (LexState *ls, int g, Labeldesc *label) {
  int i;
  FuncState *fs = ls->fs;
  Labellist *gl = &ls->dyd->gt;
  Labeldesc *gt = &gl->arr[g];
  lua_assert(luaS_eqstr(gt->name, label->name));
  if (gt->nactvar < label->nactvar) {
    TString *vname = getlocvar(fs, gt->nactvar)->varname;
    const char *msg = luaO_pushfstring(ls->L,
      "<goto %s> at line %d jumps into the scope of local " LUA_QS,
      getstr(gt->name), gt->line, getstr(vname));
    semerror(ls, msg);
  }
  luaK_patchlist(fs, gt->pc, label->pc);
  /* remove goto from pending list */
  for (i = g; i < gl->n - 1; i++)
    gl->arr[i] = gl->arr[i + 1];
  gl->n--;
}


/*
** try to close a goto with existing labels; this solves backward jumps
*/
static int findlabel (LexState *ls, int g) {
  int i;
  BlockCnt *bl = ls->fs->bl;
  Dyndata *dyd = ls->dyd;
  Labeldesc *gt = &dyd->gt.arr[g];
  /* check labels in current block for a match */
  for (i = bl->firstlabel; i < dyd->label.n; i++) {
    Labeldesc *lb = &dyd->label.arr[i];
    if (luaS_eqstr(lb->name, gt->name)) {  /* correct label? */
      if (gt->nactvar > lb->nactvar &&
          (bl->upval || dyd->label.n > bl->firstlabel))
        luaK_patchclose(ls->fs, gt->pc, lb->nactvar);
      closegoto(ls, g, lb);  /* close it */
      return 1;
    }
  }
  return 0;  /* label not found; cannot close goto */
}


static int newlabelentry (LexState *ls, Labellist *l, TString *name,
                          int line, int pc) {
  int n = l->n;
  luaM_growvector(ls->L, l->arr, n, l->size,
                  Labeldesc, SHRT_MAX, "labels/gotos");
  l->arr[n].name = name;
  l->arr[n].line = line;
  l->arr[n].nactvar = ls->fs->nactvar;
  l->arr[n].pc = pc;
  l->n++;
  return n;
}


/*
** check whether new label 'lb' matches any pending gotos in current
** block; solves forward jumps
*/
static void findgotos (LexState *ls, Labeldesc *lb) {
  Labellist *gl = &ls->dyd->gt;
  int i = ls->fs->bl->firstgoto;
  while (i < gl->n) {
    if (luaS_eqstr(gl->arr[i].name, lb->name))
      closegoto(ls, i, lb);
    else
      i++;
  }
}


/*
** "export" pending gotos to outer level, to check them against
** outer labels; if the block being exited has upvalues, and
** the goto exits the scope of any variable (which can be the
** upvalue), close those variables being exited.
*/
static void movegotosout (FuncState *fs, BlockCnt *bl) {
  int i = bl->firstgoto;
  Labellist *gl = &fs->ls->dyd->gt;
  /* correct pending gotos to current block and try to close it
     with visible labels */
  while (i < gl->n) {
    Labeldesc *gt = &gl->arr[i];
    if (gt->nactvar > bl->nactvar) {
      if (bl->upval)
        luaK_patchclose(fs, gt->pc, bl->nactvar);
      gt->nactvar = bl->nactvar;
    }
    if (!findlabel(fs->ls, i))
      i++;  /* move to next one */
  }
}


static void enterblock (FuncState *fs, BlockCnt *bl, lu_byte isloop) {
  bl->isloop = isloop;
  bl->nactvar = fs->nactvar;
  bl->firstlabel = fs->ls->dyd->label.n;
  bl->firstgoto = fs->ls->dyd->gt.n;
  bl->upval = 0;
  bl->previous = fs->bl;
  fs->bl = bl;
  lua_assert(fs->freereg == fs->nactvar);
}


/*
** create a label named "break" to resolve break statements
*/
static void breaklabel (LexState *ls) {
  TString *n = luaS_new(ls->L, "break");
  int l = newlabelentry(ls, &ls->dyd->label, n, 0, ls->fs->pc);
  findgotos(ls, &ls->dyd->label.arr[l]);
}

/*
** generates an error for an undefined 'goto'; choose appropriate
** message when label name is a reserved word (which can only be 'break')
*/
static l_noret undefgoto (LexState *ls, Labeldesc *gt) {
  const char *msg = isreserved(gt->name)
                    ? "<%s> at line %d not inside a loop"
                    : "no visible label " LUA_QS " for <goto> at line %d";
  msg = luaO_pushfstring(ls->L, msg, getstr(gt->name), gt->line);
  semerror(ls, msg);
}


static void leaveblock (FuncState *fs) {
  BlockCnt *bl = fs->bl;
  LexState *ls = fs->ls;
  if (bl->previous && bl->upval) {
    /* create a 'jump to here' to close upvalues */
    int j = luaK_jump(fs);
    luaK_patchclose(fs, j, bl->nactvar);
    luaK_patchtohere(fs, j);
  }
  if (bl->isloop)
    breaklabel(ls);  /* close pending breaks */
  fs->bl = bl->previous;
  removevars(fs, bl->nactvar);
  lua_assert(bl->nactvar == fs->nactvar);
  fs->freereg = fs->nactvar;  /* free registers */
  ls->dyd->label.n = bl->firstlabel;  /* remove local labels */
  if (bl->previous)  /* inner block? */
    movegotosout(fs, bl);  /* update pending gotos to outer block */
  else if (bl->firstgoto < ls->dyd->gt.n)  /* pending gotos in outer block? */
    undefgoto(ls, &ls->dyd->gt.arr[bl->firstgoto]);  /* error */
}


/*
** adds a new prototype into list of prototypes
*/
static Proto *addprototype (LexState *ls) {
  Proto *clp;
  lua_State *L = ls->L;
  FuncState *fs = ls->fs;
  Proto *f = fs->f;  /* prototype of current function */
  if (fs->np >= f->sizep) {
    int oldsize = f->sizep;
    luaM_growvector(L, f->p, fs->np, f->sizep, Proto *, MAXARG_Bx, "functions");
    while (oldsize < f->sizep) f->p[oldsize++] = NULL;
  }
  f->p[fs->np++] = clp = luaF_newproto(L);
  luaC_objbarrier(L, f, clp);
  return clp;
}


/*
** codes instruction to create new closure in parent function.
** The OP_CLOSURE instruction must use the last available register,
** so that, if it invokes the GC, the GC knows which registers
** are in use at that time.
*/
static void codeclosure (LexState *ls, expdesc *v) {
  FuncState *fs = ls->fs->prev;
  init_exp(v, VRELOCABLE, luaK_codeABx(fs, OP_CLOSURE, 0, fs->np - 1));
  luaK_exp2nextreg(fs, v);  /* fix it at the last register */
}


static void open_func (LexState *ls, FuncState *fs, BlockCnt *bl) {
  lua_State *L = ls->L;
  Proto *f;
  fs->prev = ls->fs;  /* linked list of funcstates */
  fs->ls = ls;
  ls->fs = fs;
  fs->pc = 0;
  fs->lasttarget = 0;
  fs->jpc = NO_JUMP;
  fs->freereg = 0;
  fs->nk = 0;
  fs->np = 0;
  fs->nups = 0;
  fs->nlocvars = 0;
  fs->nactvar = 0;
  fs->firstlocal = ls->dyd->actvar.n;
  fs->bl = NULL;
  f = fs->f;
  f->source = ls->source;
  f->maxstacksize = 2;  /* registers 0/1 are always valid */
  fs->h = luaH_new(L);
  /* anchor table of constants (to avoid being collected) */
  sethvalue2s(L, L->top, fs->h);
  incr_top(L);
  enterblock(fs, bl, 0);
}


static void close_func (LexState *ls) {
  lua_State *L = ls->L;
  FuncState *fs = ls->fs;
  Proto *f = fs->f;
  luaK_ret(fs, 0, 0);  /* final return */
  leaveblock(fs);
  luaM_reallocvector(L, f->code, f->sizecode, fs->pc, Instruction);
  f->sizecode = fs->pc;
  luaM_reallocvector(L, f->lineinfo, f->sizelineinfo, fs->pc, int);
  f->sizelineinfo = fs->pc;
  luaM_reallocvector(L, f->k, f->sizek, fs->nk, TValue);
  f->sizek = fs->nk;
  luaM_reallocvector(L, f->p, f->sizep, fs->np, Proto *);
  f->sizep = fs->np;
  luaM_reallocvector(L, f->locvars, f->sizelocvars, fs->nlocvars, LocVar);
  f->sizelocvars = fs->nlocvars;
  luaM_reallocvector(L, f->upvalues, f->sizeupvalues, fs->nups, Upvaldesc);
  f->sizeupvalues = fs->nups;
  lua_assert(fs->bl == NULL);
  ls->fs = fs->prev;
  /* last token read was anchored in defunct function; must re-anchor it */
  anchor_token(ls);
  L->top--;  /* pop table of constants */
  luaC_checkGC(L);
}



/*============================================================*/
/* GRAMMAR RULES */
/*============================================================*/


/*
** check whether current token is in the follow set of a block.
** 'until' closes syntactical blocks, but do not close scope,
** so it handled in separate.
*/
static int block_follow (LexState *ls, int withuntil) {
  switch (ls->t.token) {
    case TK_ELSE: case TK_ELSEIF:
    case TK_END: case TK_EOS:
      return 1;
    case TK_UNTIL: return withuntil;
    default: return 0;
  }
}


static void statlist (LexState *ls) {
  /* statlist -> { stat [`;'] } */
  int isreturn = 0;
  notify_blockstart(ls, STXB_STATEMENTSLIST);
  while (!block_follow(ls, 1) && !isreturn) {
    isreturn = (ls->t.token == TK_RETURN); /* 'return' must be last statement */
      statement(ls);
    }
  notify_blockend(ls, STXB_STATEMENTSLIST);
  }


static void fieldsel (LexState *ls, expdesc *v, int ismethod) {
  /* fieldsel -> ['.' | ':'] NAME */
  FuncState *fs = ls->fs;
  expdesc key;
  luaK_exp2anyregup(fs, v);
  next_token(ls);  /* skip the dot or colon */
  checkname(ls, &key);
  notify_nametype(ls, ismethod ? STXT_METHOD : STXT_TABLEFIELD);
  next_token(ls);
  luaK_indexed(fs, v, &key);
}


static void yindex (LexState *ls, expdesc *v) {
  /* index -> '[' expr ']' */
  next_token(ls);  /* skip the '[' */
  expr(ls, v);
  luaK_exp2val(ls->fs, v);
  checknext(ls, ']');
}


/*
** {======================================================================
** Rules for Constructors
** =======================================================================
*/


struct ConsControl {
  expdesc v;  /* last list item read */
  expdesc *t;  /* table descriptor */
  int nh;  /* total number of `record' elements */
  int na;  /* total number of array elements */
  int tostore;  /* number of array elements pending to be stored */
};


static void recfield (LexState *ls, struct ConsControl *cc) {
  /* recfield -> (NAME | `['exp1`]') = exp1 */
  FuncState *fs = ls->fs;
  int reg = ls->fs->freereg;
  expdesc key, val;
  int rkkey;
  if (ls->t.token == TK_NAME) {
    checklimit(fs, cc->nh, MAX_INT, "items in a constructor");
    notify_expressionstart(ls, STXE_FIELDDEF);
    checkname(ls, &key);
    notify_nametype(ls, STXT_TABLEFIELD);
    next_token(ls);
  }
  else { /* ls->t.token == '[' */
    notify_expressionstart(ls, STXE_INDEXEDDEF);
    yindex(ls, &key);
  }
  cc->nh++;
  checknext(ls, '=');
  rkkey = luaK_exp2RK(fs, &key);
  expr(ls, &val);
  luaK_codeABC(fs, OP_SETTABLE, cc->t->u.info, rkkey, luaK_exp2RK(fs, &val));
  fs->freereg = reg;  /* free registers */
  notify_expressionend(ls);
}


static void closelistfield (FuncState *fs, struct ConsControl *cc) {
  if (cc->v.k == VVOID) return;  /* there is no list item */
  luaK_exp2nextreg(fs, &cc->v);
  cc->v.k = VVOID;
  if (cc->tostore == LFIELDS_PER_FLUSH) {
    luaK_setlist(fs, cc->t->u.info, cc->na, cc->tostore);  /* flush */
    cc->tostore = 0;  /* no more items pending */
  }
}


static void lastlistfield (FuncState *fs, struct ConsControl *cc) {
  if (cc->tostore == 0) return;
  if (hasmultret(cc->v.k)) {
    luaK_setmultret(fs, &cc->v);
    luaK_setlist(fs, cc->t->u.info, cc->na, LUA_MULTRET);
    cc->na--;  /* do not count last expression (unknown number of elements) */
  }
  else {
    if (cc->v.k != VVOID)
      luaK_exp2nextreg(fs, &cc->v);
    luaK_setlist(fs, cc->t->u.info, cc->na, cc->tostore);
  }
}


static void listfield (LexState *ls, struct ConsControl *cc) {
  /* listfield -> exp */
  expr(ls, &cc->v);
  checklimit(ls->fs, cc->na, MAX_INT, "items in a constructor");
  cc->na++;
  cc->tostore++;
}


static void field (LexState *ls, struct ConsControl *cc) {
  /* field -> listfield | recfield */
  switch(ls->t.token) {
    case TK_NAME: {  /* may be 'listfield' or 'recfield' */
      if (lookahead_token(ls) != '=')  /* expression? */
        listfield(ls, cc);
      else
        recfield(ls, cc);
      break;
    }
    case '[': {
      recfield(ls, cc);
      break;
    }
    default: {
      listfield(ls, cc);
      break;
    }
  }
}


static void constructor (LexState *ls, expdesc *t) {
  /* constructor -> '{' [ field { sep field } [sep] ] '}'
     sep -> ',' | ';' */
  FuncState *fs = ls->fs;
  int line = ls->linenumber;
  int pc = luaK_codeABC(fs, OP_NEWTABLE, 0, 0, 0);
  struct ConsControl cc;
  cc.na = cc.nh = cc.tostore = 0;
  cc.t = t;
  init_exp(t, VRELOCABLE, pc);
  init_exp(&cc.v, VVOID, 0);  /* no value (yet) */
  luaK_exp2nextreg(ls->fs, t);  /* fix it at stack top */
  notify_expressionstart(ls, STXE_TABLE);
  checknext(ls, '{');
  notify_blockstart(ls, STXB_FIELDSLIST);
  do {
    lua_assert(cc.v.k == VVOID || cc.tostore > 0);
    if (ls->t.token == '}') break;
    closelistfield(fs, &cc);
    field(ls, &cc);
  } while (testnext(ls, ',') || testnext(ls, ';'));
  notify_blockend(ls, STXB_FIELDSLIST);
  check_match(ls, '}', '{', line);
  notify_expressionend(ls);
  lastlistfield(fs, &cc);
  SETARG_B(fs->f->code[pc], luaO_int2fb(cc.na)); /* set initial array size */
  SETARG_C(fs->f->code[pc], luaO_int2fb(cc.nh));  /* set initial table size */
}

/* }====================================================================== */



static void parlist (LexState *ls) {
  /* parlist -> [ param { `,' param } ] */
  FuncState *fs = ls->fs;
  Proto *f = fs->f;
  int nparams = 0;
  f->is_vararg = 0;
  if (ls->t.token != ')') {  /* is `parlist' not empty? */
    do {
      notify_expressionstart(ls, STXE_VARIABLE);
      switch (ls->t.token) {
        case TK_NAME: {  /* param -> NAME */
          new_localvar(ls, str_checkname(ls));
          next_token(ls);
          nparams++;
          break;
        }
        case TK_DOTS: {  /* param -> `...' */
          notify_expressiontype(ls, STXE_VARARG);
          next_token(ls);
          f->is_vararg = 1;
          break;
        }
        default: luaX_syntaxError(ls, SYNTAX_ERROR_EXPECTED, "<name> or " LUA_QL("...") " expected");
      }
      notify_expressionend(ls);
    } while (!f->is_vararg && testnext(ls, ','));
  }
  adjustlocalvars(ls, nparams);
  f->numparams = cast_byte(fs->nactvar);
  luaK_reserveregs(fs, fs->nactvar);  /* reserve register for parameters */
}


static void body (LexState *ls, expdesc *e, int ismethod, int line) {
  /* body ->  `(' parlist `)' block END */
  FuncState new_fs;
  BlockCnt bl;
  new_fs.f = addprototype(ls);
  new_fs.f->linedefined = line;
  open_func(ls, &new_fs, &bl);
  checknext(ls, '(');
  notify_blockstart(ls, STXB_DECLARATIONSLIST);
  if (ismethod) {
    notify_expressionstart(ls, STXE_VARIABLE);
    new_localvarliteral(ls, "self");  /* create 'self' parameter */
    notify_implicitlocalvar(ls, "self");
    notify_expressionend(ls);
    adjustlocalvars(ls, 1);
  }
  parlist(ls);
  notify_blockend(ls, STXB_DECLARATIONSLIST);
  checknext(ls, ')');
  statlist(ls);
  new_fs.f->lastlinedefined = ls->linenumber;
  check_match(ls, TK_END, TK_FUNCTION, line);
  codeclosure(ls, e);
  close_func(ls);
}


static int explist (LexState *ls, expdesc *v) {
  /* explist -> expr { `,' expr } */
  int n = 1;  /* at least one expression */
  notify_blockstart(ls, STXB_EXPRESSIONSLIST);
  expr(ls, v);
  while (testnext(ls, ',')) {
    luaK_exp2nextreg(ls->fs, v);
    expr(ls, v);
    n++;
  }
  notify_blockend(ls, STXB_EXPRESSIONSLIST);
  return n;
}


static void funcargs (LexState *ls, expdesc *f, int line) {
  FuncState *fs = ls->fs;
  expdesc args;
  int base, nparams;
  switch (ls->t.token) {
    case '(': {  /* funcargs -> `(' [ explist ] `)' */
      next_token(ls);
      if (ls->t.token == ')') { /* arg list is empty? */
        notify_blockstart(ls, STXB_EXPRESSIONSLIST);
        notify_blockend(ls, STXB_EXPRESSIONSLIST);
        args.k = VVOID;
      }
      else {
        explist(ls, &args);
        luaK_setmultret(fs, &args);
      }
      check_match(ls, ')', '(', line);
      break;
    }
    case '{': {  /* funcargs -> constructor */
      notify_blockstart(ls, STXB_EXPRESSIONSLIST);
      constructor(ls, &args);
      notify_blockend(ls, STXB_EXPRESSIONSLIST);
      break;
    }
    case TK_STRING: {  /* funcargs -> STRING */
      notify_blockstart(ls, STXB_EXPRESSIONSLIST);
      notify_expressionstart(ls, STXE_CONSTANT);
      codestring(ls, &args, ls->t.seminfo.ts);
      next_token(ls);  /* must use `seminfo' before `next' */
      notify_expressionend(ls);
      notify_blockend(ls, STXB_EXPRESSIONSLIST);
      break;
    }
    default: {
      luaX_syntaxError(ls, SYNTAX_ERROR_EXPECTED, "function arguments expected");
    }
  }
  lua_assert(f->k == VNONRELOC);
  base = f->u.info;  /* base register for call */
  if (hasmultret(args.k))
    nparams = LUA_MULTRET;  /* open call */
  else {
    if (args.k != VVOID)
      luaK_exp2nextreg(fs, &args);  /* close last argument */
    nparams = fs->freereg - (base+1);
  }
  init_exp(f, VCALL, luaK_codeABC(fs, OP_CALL, base, nparams+1, 2));
  luaK_fixline(fs, line);
  fs->freereg = base+1;  /* call remove function and arguments and leaves
                            (unless changed) one result */
}




/*
** {======================================================================
** Expression parsing
** =======================================================================
*/


static int primaryexp (LexState *ls, expdesc *v) {
  /* primaryexp -> NAME | '(' expr ')' */
  switch (ls->t.token) {
    case '(': {
      int line = ls->linenumber;
      next_token(ls);
      expr(ls, v);
      check_match(ls, ')', '(', line);
      luaK_dischargevars(ls->fs, v);
      return STXE_SUBEXP;
    }
    case TK_NAME: {
      singlevar(ls, v);
      return STXE_VARIABLE;
    }
    default: {
      luaX_syntaxError(ls, SYNTAX_ERROR_GENERIC, "unexpected symbol");
    }
  }
}


static void suffixedexp (LexState *ls, expdesc *v) {
  /* suffixedexp ->
       primaryexp { '.' NAME | '[' exp ']' | ':' NAME funcargs | funcargs } */
  FuncState *fs = ls->fs;
  int line = ls->linenumber;
  LuaSyntaxExpressionType exptype = STXE_NONE;
  notify_blockstart(ls, STXB_EXPRESSION);
  exptype = primaryexp(ls, v);
  for (;;) {
    switch (ls->t.token) {
      case '.': {  /* fieldsel */
        if ((exptype != STXE_VARIABLE) && (exptype != STXE_FIELDREF))
          notify_subexpressionend(ls, exptype);
        exptype = STXE_FIELDREF;
        fieldsel(ls, v, 0);
        break;
      }
      case '[': {  /* `[' exp1 `]' */
        expdesc key;
        notify_subexpressionend(ls, exptype);
        luaK_exp2anyregup(fs, v);
        yindex(ls, &key);
        luaK_indexed(fs, v, &key);
        exptype = STXE_INDEXEDREF;
        break;
      }
      case ':': {  /* `:' NAME funcargs */
        expdesc key;
        if ((exptype != STXE_VARIABLE) && (exptype != STXE_FIELDREF))
          notify_subexpressionend(ls, exptype);
        exptype = STXE_FIELDREF;
        next_token(ls);
        checkname(ls, &key);
        notify_nametype(ls, STXT_METHOD);
        next_token(ls);
        notify_subexpressionend(ls, exptype);
        luaK_self(fs, v, &key);
        funcargs(ls, v, line);
        exptype = STXE_FUNCCALL;
        break;
      }
      case '(': case TK_STRING: case '{': {  /* funcargs */
        notify_subexpressionend(ls, exptype);
        luaK_exp2nextreg(fs, v);
        funcargs(ls, v, line);
        exptype = STXE_FUNCCALL;
        break;
      }
      default: {
        notify_expressiontype(ls, exptype);
        notify_blockend(ls, STXB_EXPRESSION);
        return;
      }
    }
  }
}


static void simpleexp (LexState *ls, expdesc *v) {
  /* simpleexp -> NUMBER | STRING | NIL | TRUE | FALSE | ... |
                  constructor | FUNCTION body | suffixedexp */
  switch (ls->t.token) {
    case TK_NUMBER: {
      notify_expressiontype(ls, STXE_CONSTANT);
      init_exp(v, VKNUM, 0);
      v->u.nval = ls->t.seminfo.r;
      break;
    }
    case TK_STRING: {
      notify_expressiontype(ls, STXE_CONSTANT);
      codestring(ls, v, ls->t.seminfo.ts);
      break;
    }
    case TK_NIL: {
      notify_expressiontype(ls, STXE_CONSTANT);
      init_exp(v, VNIL, 0);
      break;
    }
    case TK_TRUE: {
      notify_expressiontype(ls, STXE_CONSTANT);
      init_exp(v, VTRUE, 0);
      break;
    }
    case TK_FALSE: {
      notify_expressiontype(ls, STXE_CONSTANT);
      init_exp(v, VFALSE, 0);
      break;
    }
    case TK_DOTS: {  /* vararg */
      FuncState *fs = ls->fs;
      check_condition(ls, fs->f->is_vararg,
                      "cannot use " LUA_QL("...") " outside a vararg function");
      notify_expressiontype(ls, STXE_VARARG);
      init_exp(v, VVARARG, luaK_codeABC(fs, OP_VARARG, 0, 1, 0));
      break;
    }
    case '{': {  /* constructor */
      constructor(ls, v);
      return;
    }
    case TK_FUNCTION: {
      notify_expressionstart(ls, STXE_FUNCTION);
      next_token(ls);
      body(ls, v, 0, ls->linenumber);
      notify_expressionend(ls);
      return;
    }
    default: {
      suffixedexp(ls, v);
      return;
    }
  }
  next_token(ls);
}


static UnOpr getunopr (int op) {
  switch (op) {
    case TK_NOT: return OPR_NOT;
    case '-': return OPR_MINUS;
    case '#': return OPR_LEN;
    default: return OPR_NOUNOPR;
  }
}


static BinOpr getbinopr (int op) {
  switch (op) {
    case '+': return OPR_ADD;
    case '-': return OPR_SUB;
    case '*': return OPR_MUL;
    case '/': return OPR_DIV;
    case '%': return OPR_MOD;
    case '^': return OPR_POW;
    case TK_CONCAT: return OPR_CONCAT;
    case TK_NE: return OPR_NE;
    case TK_EQ: return OPR_EQ;
    case '<': return OPR_LT;
    case TK_LE: return OPR_LE;
    case '>': return OPR_GT;
    case TK_GE: return OPR_GE;
    case TK_AND: return OPR_AND;
    case TK_OR: return OPR_OR;
    default: return OPR_NOBINOPR;
  }
}


static const struct {
  lu_byte left;  /* left priority for each binary operator */
  lu_byte right; /* right priority */
} priority[] = {  /* ORDER OPR */
   {6, 6}, {6, 6}, {7, 7}, {7, 7}, {7, 7},  /* `+' `-' `*' `/' `%' */
   {10, 9}, {5, 4},                 /* ^, .. (right associative) */
   {3, 3}, {3, 3}, {3, 3},          /* ==, <, <= */
   {3, 3}, {3, 3}, {3, 3},          /* ~=, >, >= */
   {2, 2}, {1, 1}                   /* and, or */
};

#define UNARY_PRIORITY	8  /* priority for unary operators */


/*
** subexpr -> (simpleexp | unop subexpr) { binop subexpr }
** where `binop' is any binary operator with a priority higher than `limit'
*/
static BinOpr subexpr (LexState *ls, expdesc *v, int limit) {
  BinOpr op;
  UnOpr uop;
  enterlevel(ls);
  uop = getunopr(ls->t.token);
  if (uop != OPR_NOUNOPR) {
    int line = ls->linenumber;
    next_token(ls);
    subexpr(ls, v, UNARY_PRIORITY);
    luaK_prefix(ls->fs, uop, v, line);
    notify_expressiontype(ls, STXE_OPERATION);
  }
  else simpleexp(ls, v);
  /* expand while operators have priorities higher than `limit' */
  op = getbinopr(ls->t.token);
  while (op != OPR_NOBINOPR && priority[op].left > limit) {
    expdesc v2;
    BinOpr nextop;
    int line = ls->linenumber;
    next_token(ls);
    luaK_infix(ls->fs, op, v);
    /* read sub-expression with higher priority */
    nextop = subexpr(ls, &v2, priority[op].right);
    luaK_posfix(ls->fs, op, v, &v2, line);
    op = nextop;
    notify_expressiontype(ls, STXE_OPERATION);
  }
  leavelevel(ls);
  return op;  /* return first untreated operator */
}


static void expr (LexState *ls, expdesc *v) {
  notify_blockstart(ls, STXB_EXPRESSION);
  subexpr(ls, v, 0);
  notify_blockend(ls, STXB_EXPRESSION);
}

/* }==================================================================== */



/*
** {======================================================================
** Rules for Statements
** =======================================================================
*/


static void block (LexState *ls) {
  /* block -> statlist */
  FuncState *fs = ls->fs;
  BlockCnt bl;
  enterblock(fs, &bl, 0);
  statlist(ls);
  leaveblock(fs);
}


/*
** structure to chain all variables in the left-hand side of an
** assignment
*/
struct LHS_assign {
  struct LHS_assign *prev;
  expdesc v;  /* variable (global, local, upvalue, or indexed) */
};


/*
** check whether, in an assignment to an upvalue/local variable, the
** upvalue/local variable is begin used in a previous assignment to a
** table. If so, save original upvalue/local value in a safe place and
** use this safe copy in the previous assignment.
*/
static void check_conflict (LexState *ls, struct LHS_assign *lh, expdesc *v) {
  FuncState *fs = ls->fs;
  int extra = fs->freereg;  /* eventual position to save local variable */
  int conflict = 0;
  for (; lh; lh = lh->prev) {  /* check all previous assignments */
    if (lh->v.k == VINDEXED) {  /* assigning to a table? */
      /* table is the upvalue/local being assigned now? */
      if (lh->v.u.ind.vt == v->k && lh->v.u.ind.t == v->u.info) {
        conflict = 1;
        lh->v.u.ind.vt = VLOCAL;
        lh->v.u.ind.t = extra;  /* previous assignment will use safe copy */
      }
      /* index is the local being assigned? (index cannot be upvalue) */
      if (v->k == VLOCAL && lh->v.u.ind.idx == v->u.info) {
        conflict = 1;
        lh->v.u.ind.idx = extra;  /* previous assignment will use safe copy */
      }
    }
  }
  if (conflict) {
    /* copy upvalue/local value to a temporary (in position 'extra') */
    OpCode op = (v->k == VLOCAL) ? OP_MOVE : OP_GETUPVAL;
    luaK_codeABC(fs, op, extra, v->u.info, 0);
    luaK_reserveregs(fs, 1);
  }
}


static void assignment (LexState *ls, struct LHS_assign *lh, int nvars) {
  expdesc e;
  check_condition(ls, vkisvar(lh->v.k), "syntax error");
  if (testnext(ls, ',')) {  /* assignment -> ',' suffixedexp assignment */
    struct LHS_assign nv;
    nv.prev = lh;
    suffixedexp(ls, &nv.v);
    if (nv.v.k != VINDEXED)
      check_conflict(ls, lh, &nv.v);
    checklimit(ls->fs, nvars + ls->L->nCcalls, LUAI_MAXCCALLS,
                    "C levels");
    assignment(ls, &nv, nvars+1);
  }
  else {  /* assignment -> `=' explist */
    int nexps;
    notify_blockend(ls, STXB_EXPRESSIONSLIST); /* end block started in exprstat */
    checknext(ls, '=');
    nexps = explist(ls, &e);
    if (nexps != nvars) {
      adjust_assign(ls, nvars, nexps, &e);
      if (nexps > nvars)
        ls->fs->freereg -= nexps - nvars;  /* remove extra values */
    }
    else {
      luaK_setoneret(ls->fs, &e);  /* close last expression */
      luaK_storevar(ls->fs, &lh->v, &e);
      return;  /* avoid default */
    }
  }
  init_exp(&e, VNONRELOC, ls->fs->freereg-1);  /* default assignment */
  luaK_storevar(ls->fs, &lh->v, &e);
}


static int cond (LexState *ls) {
  /* cond -> exp */
  expdesc v;
  expr(ls, &v);  /* read condition */
  if (v.k == VNIL) v.k = VFALSE;  /* `falses' are all equal here */
  luaK_goiftrue(ls->fs, &v);
  return v.f;
}


static void gotostat (LexState *ls, int pc) {
  int line = ls->linenumber;
  TString *label;
  int g;
  if (testnext(ls, TK_GOTO)) {
    label = str_checkname(ls);
    notify_nametype(ls, STXT_LABEL);
    next_token(ls);
  }
  else {
    next_token(ls);  /* skip break */
    label = luaS_new(ls->L, "break");
  }
  g = newlabelentry(ls, &ls->dyd->gt, label, line, pc);
  findlabel(ls, g);  /* close it if label already defined */
}


/* check for repeated labels on the same block */
static void checkrepeated (FuncState *fs, Labellist *ll, TString *label) {
  int i;
  for (i = fs->bl->firstlabel; i < ll->n; i++) {
    if (luaS_eqstr(label, ll->arr[i].name)) {
      const char *msg = luaO_pushfstring(fs->ls->L,
                          "label " LUA_QS " already defined on line %d",
                          getstr(label), ll->arr[i].line);
      semerror(fs->ls, msg);
    }
  }
}


/* skip no-op statements */
static void skipnoopstat (LexState *ls) {
  while (ls->t.token == ';' || ls->t.token == TK_DBCOLON)
    statement(ls);
}


static void labelstat (LexState *ls, TString *label, int line) {
  /* label -> '::' NAME '::' */
  FuncState *fs = ls->fs;
  Labellist *ll = &ls->dyd->label;
  int l;  /* index of new label being created */
  notify_nametype(ls, STXT_LABEL);
  checkrepeated(fs, ll, label);  /* check for repeated labels */
  next_token(ls);
  checknext(ls, TK_DBCOLON);  /* skip double colon */
  /* create new entry for this label */
  l = newlabelentry(ls, ll, label, line, fs->pc);
  skipnoopstat(ls);  /* skip other no-op statements */
  if (block_follow(ls, 0)) {  /* label is last no-op statement in the block? */
    /* assume that locals are already out of scope */
    ll->arr[l].nactvar = fs->bl->nactvar;
  }
  findgotos(ls, &ll->arr[l]);
}


static void whilestat (LexState *ls, int line) {
  /* whilestat -> WHILE cond DO block END */
  FuncState *fs = ls->fs;
  int whileinit;
  int condexit;
  BlockCnt bl;
  next_token(ls);  /* skip WHILE */
  whileinit = luaK_getlabel(fs);
  condexit = cond(ls);
  enterblock(fs, &bl, 1);
  checknext(ls, TK_DO);
  block(ls);
  luaK_jumpto(fs, whileinit);
  check_match(ls, TK_END, TK_WHILE, line);
  leaveblock(fs);
  luaK_patchtohere(fs, condexit);  /* false conditions finish the loop */
}


static void repeatstat (LexState *ls, int line) {
  /* repeatstat -> REPEAT block UNTIL cond */
  int condexit;
  FuncState *fs = ls->fs;
  int repeat_init = luaK_getlabel(fs);
  BlockCnt bl1, bl2;
  enterblock(fs, &bl1, 1);  /* loop block */
  enterblock(fs, &bl2, 0);  /* scope block */
  next_token(ls);  /* skip REPEAT */
  statlist(ls);
  check_match(ls, TK_UNTIL, TK_REPEAT, line);
  condexit = cond(ls);  /* read condition (inside scope block) */
  if (bl2.upval)  /* upvalues? */
    luaK_patchclose(fs, condexit, bl2.nactvar);
  leaveblock(fs);  /* finish scope */
  luaK_patchlist(fs, condexit, repeat_init);  /* close the loop */
  leaveblock(fs);  /* finish loop */
}


static int exp1 (LexState *ls) {
  expdesc e;
  int reg;
  expr(ls, &e);
  luaK_exp2nextreg(ls->fs, &e);
  lua_assert(e.k == VNONRELOC);
  reg = e.u.info;
  return reg;
}


static void forbody (LexState *ls, int base, int line, int nvars, int isnum) {
  /* forbody -> DO block */
  BlockCnt bl;
  FuncState *fs = ls->fs;
  int prep, endfor;
  adjustlocalvars(ls, 3);  /* control variables */
  checknext(ls, TK_DO);
  prep = isnum ? luaK_codeAsBx(fs, OP_FORPREP, base, NO_JUMP) : luaK_jump(fs);
  enterblock(fs, &bl, 0);  /* scope for declared variables */
  adjustlocalvars(ls, nvars);
  luaK_reserveregs(fs, nvars);
  block(ls);
  leaveblock(fs);  /* end of scope for declared variables */
  luaK_patchtohere(fs, prep);
  if (isnum)  /* numeric for? */
    endfor = luaK_codeAsBx(fs, OP_FORLOOP, base, NO_JUMP);
  else {  /* generic for */
    luaK_codeABC(fs, OP_TFORCALL, base, 0, nvars);
    luaK_fixline(fs, line);
    endfor = luaK_codeAsBx(fs, OP_TFORLOOP, base + 2, NO_JUMP);
  }
  luaK_patchlist(fs, endfor, prep + 1);
  luaK_fixline(fs, line);
}


static void fornum (LexState *ls, TString *varname, int line) {
  /* fornum -> NAME = exp1,exp1[,exp1] forbody */
  FuncState *fs = ls->fs;
  int base = fs->freereg;
  new_localvarliteral(ls, "(for index)");
  new_localvarliteral(ls, "(for limit)");
  new_localvarliteral(ls, "(for step)");
  notify_blockstart(ls, STXB_DECLARATIONSLIST);
  notify_expressionstart(ls, STXE_VARIABLE);
  new_localvar(ls, varname);
  next_token(ls);
  notify_expressionend(ls);
  notify_blockend(ls, STXB_DECLARATIONSLIST);
  checknext(ls, '=');
  notify_blockstart(ls, STXB_EXPRESSIONSLIST);
  exp1(ls);  /* initial value */
  checknext(ls, ',');
  exp1(ls);  /* limit */
  if (testnext(ls, ','))
    exp1(ls);  /* optional step */
  else {  /* default step = 1 */
    luaK_codek(fs, fs->freereg, luaK_numberK(fs, 1));
    luaK_reserveregs(fs, 1);
  }
  notify_blockend(ls, STXB_EXPRESSIONSLIST);
  forbody(ls, base, line, 1, 1);
}


static void forlist (LexState *ls, TString *indexname) {
  /* forlist -> NAME {,NAME} IN explist forbody */
  FuncState *fs = ls->fs;
  expdesc e;
  int nvars = 4;  /* gen, state, control, plus at least one declared var */
  int line;
  int base = fs->freereg;
  /* create control variables */
  new_localvarliteral(ls, "(for generator)");
  new_localvarliteral(ls, "(for state)");
  new_localvarliteral(ls, "(for control)");
  /* create declared variables */
  notify_blockstart(ls, STXB_DECLARATIONSLIST);
  notify_expressionstart(ls, STXE_VARIABLE);
  new_localvar(ls, indexname);
  next_token(ls);
  notify_expressionend(ls);
  while (testnext(ls, ',')) {
    notify_expressionstart(ls, STXE_VARIABLE);
    new_localvar(ls, str_checkname(ls));
    next_token(ls);
    notify_expressionend(ls);
    nvars++;
  }
  notify_blockend(ls, STXB_DECLARATIONSLIST);
  checknext(ls, TK_IN);
  line = ls->linenumber;
  adjust_assign(ls, 3, explist(ls, &e), &e);
  luaK_checkstack(fs, 3);  /* extra space to call generator */
  forbody(ls, base, line, nvars - 3, 0);
}


static void forstat (LexState *ls, int line) {
  /* forstat -> FOR (fornum | forlist) END */
  FuncState *fs = ls->fs;
  TString *varname;
  BlockCnt bl;
  enterblock(fs, &bl, 1);  /* scope for loop and control variables */
  next_token(ls);  /* skip `for' */
  varname = str_checkname(ls);  /* first variable name */
  switch (lookahead_token(ls)) {
    case '=': fornum(ls, varname, line); break;
    case ',': case TK_IN: forlist(ls, varname); break;
    default: {
      next_token(ls); /* move to the next (lookahead) token before setting the error */
      luaX_syntaxError(ls, SYNTAX_ERROR_EXPECTED, LUA_QL("=") " or " LUA_QL("in") " expected");
    }
  }
  check_match(ls, TK_END, TK_FOR, line);
  leaveblock(fs);  /* loop scope (`break' jumps to this point) */
}


static void test_then_block (LexState *ls, int *escapelist) {
  /* test_then_block -> [IF | ELSEIF] cond THEN block */
  BlockCnt bl;
  FuncState *fs = ls->fs;
  expdesc v;
  int jf;  /* instruction to skip 'then' code (if condition is false) */
  next_token(ls);  /* skip IF or ELSEIF */
  expr(ls, &v);  /* read condition */
  checknext(ls, TK_THEN);
  if (ls->t.token == TK_GOTO || ls->t.token == TK_BREAK) {
    luaK_goiffalse(ls->fs, &v);  /* will jump to label if condition is true */
    enterblock(fs, &bl, 0);  /* must enter block before 'goto' */
    gotostat(ls, v.t);  /* handle goto/break */
    skipnoopstat(ls);  /* skip other no-op statements */
    if (block_follow(ls, 0)) {  /* 'goto' is the entire block? */
      leaveblock(fs);
      return;  /* and that is it */
    }
    else  /* must skip over 'then' part if condition is false */
      jf = luaK_jump(fs);
  }
  else {  /* regular case (not goto/break) */
    luaK_goiftrue(ls->fs, &v);  /* skip over block if condition is false */
    enterblock(fs, &bl, 0);
    jf = v.f;
  }
  statlist(ls);  /* `then' part */
  leaveblock(fs);
  if (ls->t.token == TK_ELSE ||
      ls->t.token == TK_ELSEIF)  /* followed by 'else'/'elseif'? */
    luaK_concat(fs, escapelist, luaK_jump(fs));  /* must jump over it */
  luaK_patchtohere(fs, jf);
}


static void ifstat (LexState *ls, int line) {
  /* ifstat -> IF cond THEN block {ELSEIF cond THEN block} [ELSE block] END */
  FuncState *fs = ls->fs;
  int escapelist = NO_JUMP;  /* exit list for finished parts */
  test_then_block(ls, &escapelist);  /* IF cond THEN block */
  while (ls->t.token == TK_ELSEIF)
    test_then_block(ls, &escapelist);  /* ELSEIF cond THEN block */
  if (testnext(ls, TK_ELSE))
    block(ls);  /* `else' part */
  check_match(ls, TK_END, TK_IF, line);
  luaK_patchtohere(fs, escapelist);  /* patch escape list to 'if' end */
}


static void localfunc (LexState *ls) {
  expdesc b;
  FuncState *fs = ls->fs;
  notify_expressionstart(ls, STXE_FUNCTION);
  next_token(ls);  /* skip FUNCTION */
  notify_expressionstart(ls, STXE_VARIABLE);
  new_localvar(ls, str_checkname(ls));  /* new local variable */
  next_token(ls);
  notify_expressionend(ls);
  adjustlocalvars(ls, 1);  /* enter its scope */
  body(ls, &b, 0, ls->linenumber);  /* function created in next register */
  /* debug information will only see the variable after this point! */
  getlocvar(fs, b.u.info)->startpc = fs->pc;
  notify_expressionend(ls);
}


static void localstat (LexState *ls) {
  /* stat -> LOCAL NAME {`,' NAME} [`=' explist] */
  int nvars = 0;
  int nexps;
  expdesc e;
  notify_blockstart(ls, STXB_DECLARATIONSLIST);
  do {
    notify_expressionstart(ls, STXE_VARIABLE);
    new_localvar(ls, str_checkname(ls));
    next_token(ls);
    notify_expressionend(ls);
    nvars++;
  } while (testnext(ls, ','));
  notify_blockend(ls, STXB_DECLARATIONSLIST);
  if (testnext(ls, '='))
    nexps = explist(ls, &e);
  else {
    e.k = VVOID;
    nexps = 0;
  }
  adjust_assign(ls, nvars, nexps, &e);
  adjustlocalvars(ls, nvars);
}


static int funcname (LexState *ls, expdesc *v) {
  /* funcname -> NAME {fieldsel} [`:' NAME] */
  int ismethod = 0;
  notify_expressionstart(ls, STXE_VARIABLE);
  singlevar(ls, v);
  while (ls->t.token == '.') {
    fieldsel(ls, v, 0);
    notify_expressiontype(ls, STXE_FIELDREF);
  }
  if (ls->t.token == ':') {
    ismethod = 1;
    fieldsel(ls, v, 1);
    notify_nametype(ls, STXT_METHOD);
    notify_expressiontype(ls, STXE_FIELDREF);
  }
  notify_expressionend(ls);
  return ismethod;
}


static void funcstat (LexState *ls, int line) {
  /* funcstat -> FUNCTION funcname body */
  int ismethod;
  expdesc v, b;
  notify_expressionstart(ls, STXE_FUNCTION);
  next_token(ls);  /* skip FUNCTION */
  ismethod = funcname(ls, &v);
  body(ls, &b, ismethod, line);
  luaK_storevar(ls->fs, &v, &b);
  luaK_fixline(ls->fs, line);  /* definition `happens' in the first line */
  notify_expressionend(ls);
}


static void exprstat (LexState *ls) {
  /* stat -> func | assignment */
  FuncState *fs = ls->fs;
  struct LHS_assign v;
  notify_statementtype(ls, STXS_ASSIGN);
  notify_blockstart(ls, STXB_EXPRESSIONSLIST);
  suffixedexp(ls, &v.v);
  if (ls->t.token == '=' || ls->t.token == ',') { /* stat -> assignment ? */
    v.prev = NULL;
    assignment(ls, &v, 1);
  }
  else {  /* stat -> func */
    notify_blockcancel(ls, STXB_EXPRESSIONSLIST); /* cancel expressions list block */
    notify_statementtype(ls, STXS_FUNCCALL);
    check_condition(ls, v.v.k == VCALL, "syntax error");
    SETARG_C(getcode(fs, &v.v), 1);  /* call statement uses no results */
  }
}


static void retstat (LexState *ls) {
  /* stat -> RETURN [explist] [';'] */
  FuncState *fs = ls->fs;
  expdesc e;
  int first, nret;  /* registers with returned values */
  if (block_follow(ls, 1) || ls->t.token == ';')
    first = nret = 0;  /* return no values */
  else {
    nret = explist(ls, &e);  /* optional return values */
    if (hasmultret(e.k)) {
      luaK_setmultret(fs, &e);
      if (e.k == VCALL && nret == 1) {  /* tail call? */
        SET_OPCODE(getcode(fs,&e), OP_TAILCALL);
        lua_assert(GETARG_A(getcode(fs,&e)) == fs->nactvar);
      }
      first = fs->nactvar;
      nret = LUA_MULTRET;  /* return all values */
    }
    else {
      if (nret == 1)  /* only one single value? */
        first = luaK_exp2anyreg(fs, &e);
      else {
        luaK_exp2nextreg(fs, &e);  /* values must go to the `stack' */
        first = fs->nactvar;  /* return all `active' values */
        lua_assert(nret == fs->freereg - first);
      }
    }
  }
  luaK_ret(fs, first, nret);
  testnext(ls, ';');  /* skip optional semicolon */
}


static void statement (LexState *ls) {
  int line = ls->linenumber;  /* may be needed for error messages */
  notify_blockstart(ls, STXB_STATEMENT);
  enterlevel(ls);
  switch (ls->t.token) {
    case ';': {  /* stat -> ';' (empty statement) */
      notify_statementtype(ls, STXS_EMPTY);
      next_token(ls);  /* skip ';' */
      break;
    }
    case TK_IF: {  /* stat -> ifstat */
      notify_statementtype(ls, STXS_IF);
      ifstat(ls, line);
      break;
    }
    case TK_WHILE: {  /* stat -> whilestat */
      notify_statementtype(ls, STXS_WHILE);
      whilestat(ls, line);
      break;
    }
    case TK_DO: {  /* stat -> DO block END */
      notify_statementtype(ls, STXS_DO);
      next_token(ls);  /* skip DO */
      block(ls);
      check_match(ls, TK_END, TK_DO, line);
      break;
    }
    case TK_FOR: {  /* stat -> forstat */
      notify_statementtype(ls, STXS_FOR);
      forstat(ls, line);
      break;
    }
    case TK_REPEAT: {  /* stat -> repeatstat */
      notify_statementtype(ls, STXS_REPEAT);
      repeatstat(ls, line);
      break;
    }
    case TK_FUNCTION: {  /* stat -> funcstat */
      notify_statementtype(ls, STXS_FUNCDEF);
      funcstat(ls, line);
      break;
    }
    case TK_LOCAL: {  /* stat -> localstat */
      next_token(ls);  /* skip LOCAL */
      if (ls->t.token == TK_FUNCTION) { /* local function? */
        notify_statementtype(ls, STXS_LOCALFUNC);
        localfunc(ls);
      }
      else {
        notify_statementtype(ls, STXS_LOCAL);
        localstat(ls);
      }
      break;
    }
    case TK_DBCOLON: {  /* stat -> label */
      notify_statementtype(ls, STXS_LABEL);
      next_token(ls);  /* skip double colon */
      labelstat(ls, str_checkname(ls), line);
      break;
    }
    case TK_RETURN: {  /* stat -> retstat */
      notify_statementtype(ls, STXS_RETURN);
      next_token(ls);  /* skip RETURN */
      retstat(ls);
      break;
    }
    case TK_BREAK:   /* stat -> breakstat */
    case TK_GOTO: {  /* stat -> 'goto' NAME */
      notify_statementtype(ls, STXS_GOTO);
      gotostat(ls, luaK_jump(ls->fs));
      break;
    }
    default: {  /* stat -> func | assignment */
      exprstat(ls);
      break;
    }
  }
  lua_assert(ls->fs->f->maxstacksize >= ls->fs->freereg &&
             ls->fs->freereg >= ls->fs->nactvar);
  ls->fs->freereg = ls->fs->nactvar;  /* free registers */
  leavelevel(ls);
  notify_blockend(ls, STXB_STATEMENT);
}

/* }====================================================================== */

/*
** compiles the main function, which is a regular vararg function with an
** upvalue named LUA_ENV
*/
static void mainfunc (LexState *ls, FuncState *fs) {
  BlockCnt bl;
  expdesc v;
  open_func(ls, fs, &bl);
  fs->f->is_vararg = 1;  /* main function is always vararg */
  init_exp(&v, VLOCAL, 0);  /* create and... */
  newupvalue(fs, ls->envn, &v);  /* ...set environment upvalue */
  notify_expressionstart(ls, STXE_MAINFUNC);
  next_token(ls);  /* read first token */
  statlist(ls);  /* parse main body */
  notify_expressionend(ls);
  check(ls, TK_EOS);
  close_func(ls);
}

/*
 ** {======================================================================
 ** Syntax monitor handling
 ** =======================================================================
 */

#define MAXOPENBLOCKS 200

typedef struct {
  LuaSyntaxBlockType blocktype;
  union {
    LuaSyntaxStatementType  statementtype;
    LuaSyntaxExpressionType expressiontype;
  };
  int startpos;
  int subexpendpos; /* end position of the last notified sub-expression of this block */
} OpenBlock;

typedef struct MonitoredLexState {
  LexState lexstate;
  LuaSyntaxTokenType nametokentype; /* Name type of current token (STXT_NONE if the current token is not a name) */
  Token    prevtoken; /* previous token */
  struct { Token* arr; int n; int size; } pendingtokens; /* comment tokens read during a lookahead */
  struct { OpenBlock* arr; int n; int size; } openblocks;
  int hassyntaxerror;
  LuaSyntaxNotify notifyfunction;
  void* notifycontext;
} MonitoredLexState;

static void notify_blockstart (LexState *ls, LuaSyntaxBlockType blocktype)
{
  MonitoredLexState* mls = (MonitoredLexState*)ls;
  OpenBlock* newblock;
  luaM_growvector(ls->L, mls->openblocks.arr, mls->openblocks.n + 1, mls->openblocks.size, OpenBlock, MAXOPENBLOCKS, "open blocks");
  
  newblock = &mls->openblocks.arr[mls->openblocks.n];
  newblock->blocktype = blocktype;
  newblock->startpos = (ls->t.token != TK_EOS) ? ls->t.range.pos : ls->currentpos;  /* block starts at current token */
  
  switch (blocktype)
  {
    case STXB_STATEMENT:
      newblock->statementtype = STXS_NONE;
      break;
      
    case STXB_EXPRESSION: {
      newblock->expressiontype = STXE_NONE;
      newblock->subexpendpos = -1;
    }  break;
      
    default:
      break;
  }
  
  mls->openblocks.n += 1;
}

static void notify_statementtype (LexState *ls, LuaSyntaxStatementType statementtype)
{
  MonitoredLexState* mls = (MonitoredLexState*)ls;
  OpenBlock* currentblock;
  lua_assert(mls->openblocks.n > 0);

  currentblock = &mls->openblocks.arr[mls->openblocks.n - 1];
  currentblock->statementtype = statementtype;
}

static void notify_expressionstart (LexState *ls, LuaSyntaxExpressionType expressiontype)
{
  notify_blockstart(ls, STXB_EXPRESSION);
  notify_expressiontype (ls, expressiontype);
}

static void notify_expressionend (LexState *ls)
{
  notify_blockend(ls, STXB_EXPRESSION);
}

static void notify_expressiontype (LexState *ls, LuaSyntaxExpressionType expressiontype)
{
  MonitoredLexState* mls = (MonitoredLexState*)ls;
  OpenBlock* currentblock;
  lua_assert(mls->openblocks.n > 0);
  
  currentblock = &mls->openblocks.arr[mls->openblocks.n - 1];
  currentblock->expressiontype = expressiontype;
}

static void notify_subexpressionend (LexState *ls, LuaSyntaxExpressionType expressiontype)
{
  MonitoredLexState* mls = (MonitoredLexState*)ls;
  OpenBlock* currentblock;
  lua_assert(mls->openblocks.n > 0);
  
  currentblock = &mls->openblocks.arr[mls->openblocks.n - 1];
  lua_assert(currentblock->blocktype == STXB_EXPRESSION);
  
  /* Create and ends a sub-expression of the current block starting at the block's position */
  notify_blockstart(ls, STXB_EXPRESSION);
  {
    OpenBlock* subblock = &mls->openblocks.arr[mls->openblocks.n - 1];
    subblock->startpos = currentblock->startpos;
    subblock->expressiontype = (expressiontype != STXE_NONE) ? expressiontype : currentblock->expressiontype;
  }
  notify_blockend(ls, STXB_EXPRESSION);
}

static void notify_blockcancel (LexState *ls, LuaSyntaxBlockType blocktype)
{
  /* Cancel the current block (do not notify it) */
  MonitoredLexState* mls = (MonitoredLexState*)ls;
  lua_assert((mls->openblocks.n > 0) && (mls->openblocks.arr[mls->openblocks.n - 1].blocktype == blocktype));
  
  mls->openblocks.n -= 1; /* decrement openblocks stack size */
}

static void notify_blockend (LexState *ls, LuaSyntaxBlockType blocktype)
{
  MonitoredLexState* mls = (MonitoredLexState*)ls;
  OpenBlock* popedblock;
  LuaSyntaxEventData eventdata;
  LuaSyntaxBlockType popedblocktype;
  int isblockcanceled = 0;
  
  lua_assert(mls->openblocks.n > 0);
  popedblock = &mls->openblocks.arr[mls->openblocks.n - 1];
  popedblocktype = popedblock->blocktype;
  lua_assert(popedblocktype == blocktype);
  
  eventdata.syntaxlevel = mls->openblocks.n - 1;
  eventdata.blockData.blocktype = popedblocktype;
  
  switch (popedblocktype)
  {
    case STXB_STATEMENT:
      eventdata.blockData.statementtype = popedblock->statementtype;
      break;
      
    case STXB_EXPRESSION: {
      eventdata.blockData.expressiontype = popedblock->expressiontype;
      
      /* To avoid multiple notification of expression blocks with the same range, check if the poped block is a sub-expression of its parent */
      if (mls->openblocks.n > 1)
      {
        OpenBlock* parentblock = &mls->openblocks.arr[mls->openblocks.n - 2];
        if ((parentblock->blocktype == STXB_EXPRESSION) && (popedblock->startpos == parentblock->startpos))
        {
          parentblock->subexpendpos = ls->t.range.pos;
        }
      }
      /* cancel block if it has already been notified as a sub-expression (exept in case of syntax error) */
      isblockcanceled = (((popedblock->expressiontype == STXE_NONE) || ((popedblock->subexpendpos >= 0) && (ls->t.range.pos == popedblock->subexpendpos))) &&
                         ! mls->hassyntaxerror);
    }  break;
      
    default:
      break;
  }
  
  if (! isblockcanceled)
  {
    /* Notify this block */
    int blockendpos;
    if (mls->hassyntaxerror || (mls->prevtoken.range.len == 0))
    {
      /* block ends at current position */
      blockendpos = ls->currentpos;
    }
    else
    {
      /* block ends after previous token (or is empty) */
      blockendpos = mls->prevtoken.range.pos + mls->prevtoken.range.len;
      
      if (blockendpos < popedblock->startpos)
        blockendpos = popedblock->startpos;
    }
    
    mls->notifyfunction (STXEVT_BLOCK, &eventdata, popedblock->startpos, blockendpos - popedblock->startpos, mls->notifycontext);
  }

  mls->openblocks.n -= 1; /* decrement openblocks stack size */
}

static void notify_nametype (LexState *ls, LuaSyntaxTokenType nameType)
{
  MonitoredLexState* mls = (MonitoredLexState*)ls;
  mls->nametokentype = nameType;
}

static void notify_token (LexState *ls)
{
  MonitoredLexState* mls = (MonitoredLexState*)ls;
  LuaSyntaxEventData eventdata;
  Token* tk = &ls->t;
    
  eventdata.syntaxlevel = mls->openblocks.n; /* child of the current openblock */
  eventdata.tokendata.tokentype = STXT_NONE;
  
  /* ignore single characters token */
  if (tk->token < FIRST_RESERVED) 
  {
    eventdata.tokendata.tokentype = STXT_KEYCHAR;
    eventdata.tokendata.keychar = tk->token;
  }
  else
  {
    switch (tk->token)
    {
      case TK_EOS:
      {
        eventdata.tokendata.tokentype = STXT_NONE;
      } break;
        
      case TK_NUMBER:
      {
        eventdata.tokendata.tokentype = STXT_NUMBER;
        eventdata.tokendata.number = tk->seminfo.r;
      } break;
        
      case TK_STRING:
      {
        eventdata.tokendata.tokentype = STXT_STRING;
        eventdata.tokendata.string = getstr(tk->seminfo.ts);
      }  break;
        
      case TK_COMMENT:
      {
        eventdata.tokendata.tokentype = STXT_COMMENT;
        eventdata.tokendata.string = getstr(tk->seminfo.ts);
      }  break;
        
      case TK_NAME:
      {
        if (mls->nametokentype != STXT_NONE)
        {
          eventdata.tokendata.tokentype = mls->nametokentype;
        }
        else
        {
          eventdata.tokendata.tokentype = STXT_NAME;
        }
      } break;
        
      default:
      {
        eventdata.tokendata.tokentype = STXT_KEYWORD;
        eventdata.tokendata.keyword = tk->token - FIRST_RESERVED;
      }
    } /* switch */
  }
  
  if (eventdata.tokendata.tokentype != STXT_NONE) 
  {
    mls->notifyfunction (STXEVT_TOKEN, &eventdata, tk->range.pos, tk->range.len, mls->notifycontext);
  }
}

static void notify_implicitlocalvar (LexState *ls, const char* varname)
{
  MonitoredLexState* mls = (MonitoredLexState*)ls;
  LuaSyntaxEventData eventdata;
  
  eventdata.syntaxlevel = mls->openblocks.n; /* child of the current openblock */
  eventdata.tokendata.tokentype = STXT_HIDDENDECL;
  eventdata.tokendata.varname = varname;
  
  /* Notify with a zero-length range before the current tokken */
  mls->notifyfunction (STXEVT_TOKEN, &eventdata, ls->t.range.pos, 0, mls->notifycontext);
}

static void next_token (LexState *ls)
{
  /* Notify all tokens and iterate until next non-comment token */
  MonitoredLexState* mls = (MonitoredLexState*)ls;
  
  if (ls->t.token != TK_EOS) {
    ((MonitoredLexState*)ls)->prevtoken = ls->t; /* store previous token for blocks range */
  }
  
  do {
    if (ls->t.token != TK_EOS) {
      notify_token (ls); /* Notify previous token */
    }
    
    if (mls->pendingtokens.n > 0) {
      /* Notify pending comment token */
      int tkindex;
      for (tkindex = 0; tkindex < mls->pendingtokens.n ; tkindex += 1) {
        ls->t = mls->pendingtokens.arr[tkindex];
        notify_token (ls); 
      }
      mls->pendingtokens.n = 0; /* reset pending tokens count */
    }
    
    luaX_next(ls);
  } while (ls->t.token == TK_COMMENT);
  
  ((MonitoredLexState*)ls)->nametokentype = STXT_NONE;
}

static int lookahead_token (LexState *ls)
{
  /* Replacement for luaX_lookahead */
  /* When a lookahead_token is done, store comment tokens in a vector until the next significant (i.e. non-comment) token is found. */
  
  luaX_lookahead(ls);
  
  while (ls->lookahead.token == TK_COMMENT)
  {
    MonitoredLexState* mls = (MonitoredLexState*)ls;
    Token* pendingtoken;
    luaM_growvector(ls->L, mls->pendingtokens.arr, mls->pendingtokens.n + 1, mls->pendingtokens.size, Token, 100, "pending tokens");
    pendingtoken = &mls->pendingtokens.arr[mls->pendingtokens.n];
    *pendingtoken = ls->lookahead;
    mls->pendingtokens.n += 1;
    
    ls->lookahead.token = TK_EOS;  /* discharge look-ahead token before calling it again */
    luaX_lookahead(ls);
  }

  return ls->lookahead.token;
}

static void handle_syntax_error (LexState *ls, const int errortype, const char *msg, int token)
{
  MonitoredLexState* mls = (MonitoredLexState*)ls;
  LuaSyntaxEventData eventdata;
  
  /* Close unfinished token */
  if (ls->t.range.len == -1)
    ls->t.range.len = ls->currentpos - ls->t.range.pos;
  
  /* Notify syntax error */
  eventdata.syntaxlevel = mls->openblocks.n; /* error is inside the current openblock */
  eventdata.errorData.errortype = errortype;
  eventdata.errorData.errorstring = msg;
  mls->notifyfunction (STXEVT_ERROR, &eventdata, ls->t.range.pos, ls->t.range.len, mls->notifycontext);
  
  /* notify all open blocks */
  mls->hassyntaxerror = 1;
  while (mls->openblocks.n > 0) {
    notify_blockend(ls, mls->openblocks.arr[mls->openblocks.n - 1].blocktype);
  }  
}

/* }====================================================================== */

static void luarawparser (lua_State *L, ZIO *z, const char *chunkname, MonitoredLexState* mls) 
{
  LexState* lexstate = &mls->lexstate;
  FuncState funcstate;
  int firstchar;
  Closure *cl;
  
  TString *tchunkname = luaS_new(L, chunkname);
  setsvalue2s(L, L->top, tchunkname);  /* push name to protect it */
  incr_top(L);

  firstchar = zgetc(z);  /* read first character */
  luaX_setinput(L, lexstate, z, tchunkname, firstchar);
  lexstate->tokenizecomments = 1; /* we want to get comments as tokens */
  lexstate->errorhandler = handle_syntax_error;
  mls->prevtoken.range.pos = 0;  /* init  prevtoken's range */
  mls->prevtoken.range.len = 0;
  mls->hassyntaxerror = 0;
  
  cl = luaF_newLclosure(L, 1);  /* create main closure */
  /* anchor closure (to avoid being collected) */
  setclLvalue(L, L->top, cl);
  incr_top(L);
  funcstate.f = cl->l.p = luaF_newproto(L);

  mainfunc(lexstate, &funcstate);
  
  L->top--;  /* pop main closure */
  L->top--;  /* pop name */
  
  lua_assert(!funcstate.prev && funcstate.nups == 1 && !lexstate->fs);
  /* all scopes should be correctly finished */
  lua_assert(lexstate->dyd->actvar.n == 0 && lexstate->dyd->gt.n == 0 && lexstate->dyd->label.n == 0);
}

/*
 ** Invoke the raw parser
 */

typedef struct ParserProxyS {
  ZIO *z;
  const char *chunkname;  
  MonitoredLexState* mls;
}ParserProxyS;

static void rawparserproxy (lua_State *L, void *ud) 
{
  ParserProxyS* p = (ParserProxyS*) ud;
  luarawparser(L, p->z, p->chunkname, p->mls);
}

typedef struct LoadS {
    const char *s;
    size_t size;
} LoadS;

static const char *getS (lua_State *L, void *ud, size_t *size) {
    LoadS *ls = (LoadS *)ud;
    (void)L;  /* not used */
    if (ls->size == 0) return NULL;
    *size = ls->size;
    ls->size = 0;
    return ls->s;
}

int lua_parser (lua_State *L, const char *sourceString, const char *chunkname, LuaSyntaxNotify notifyfunction, void* notifycontext)
{
  ZIO z;
  LoadS ls;
  Mbuffer buff;  /* dynamic structure used by the scanner */
  Dyndata dyd;  /* dynamic structures used by the parser */
  int status;
  
  ls.s = sourceString;
  ls.size = strlen(sourceString);
  luaZ_init(L, &z, getS, &ls);
  
  initdyndata(L, &dyd);
  luaZ_initbuffer(L, &buff);

  MonitoredLexState mls;
  mls.lexstate.buff = &buff;
  mls.lexstate.dyd = &dyd;

  mls.notifyfunction = notifyfunction;
  mls.notifycontext = notifycontext;
  mls.pendingtokens.arr = NULL;
  mls.pendingtokens.n = 0;
  mls.pendingtokens.size = 0;
  mls.openblocks.arr = NULL;
  mls.openblocks.n = 0;
  mls.openblocks.size = 0;

  ParserProxyS p;
  p.z = &z;
  p.chunkname = chunkname;
  p.mls = &mls;
  
  /* Notify start of parsing */
  notifyfunction (STXEVT_START, NULL, 0, 0, notifycontext);
  
  /* Call the parser in protected mode */
  L->nny++;  /* cannot yield during parsing */
  status = luaD_pcall(L, rawparserproxy, &p, savestack(L, L->top), L->errfunc);
  L->nny--;
  
  luaZ_freebuffer(L, &buff);
  freedyndata(L, &dyd);
  
  /* Free openblocks stack */
  luaM_freearray(L, mls.openblocks.arr, mls.openblocks.size);
  
  /* Free pendings token array */
  luaM_freearray(L, mls.pendingtokens.arr, mls.pendingtokens.size);
  
  /* Notify end of parsing */
  notifyfunction (STXEVT_END, NULL, mls.lexstate.currentpos, 0, notifycontext);
  
  return status;
}
