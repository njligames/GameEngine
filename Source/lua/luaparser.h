//
//  luaparser.h
//
//  Pure Lua parser analysing a Lua source string for providing syntax tree information to an external client
//
//  Created by Jean-Luc Jumpertz on 29/02/12.
//  Copyright (c) 2012 JL Jumpertz. All rights reserved.


#ifndef CIMLua_luaparser_h
#define CIMLua_luaparser_h

typedef enum {
    STXEVT_START, /* start of parsing */
    STXEVT_BLOCK,
    STXEVT_TOKEN,
    STXEVT_ERROR, /* syntax error during parsing */
    STXEVT_END /* end of parsing */
} LuaSyntaxEvent;

typedef enum {
    STXB_STATEMENTSLIST,
    STXB_STATEMENT,
    STXB_EXPRESSIONSLIST,
    STXB_EXPRESSION,
    STXB_DECLARATIONSLIST,
    STXB_FIELDSLIST,
    STXB_UNKNOWN
} LuaSyntaxBlockType;

typedef enum {
    STXS_IF,
    STXS_WHILE,
    STXS_REPEAT,
    STXS_FOR,
    STXS_DO,
    STXS_LOCAL,
    STXS_ASSIGN,
    STXS_LOCALFUNC, /* local function definition */
    STXS_FUNCDEF,   /* function definition */
    STXS_FUNCCALL,  /* function call */
    STXS_LABEL,
    STXS_GOTO,      /* goto or break statement */
    STXS_RETURN,
    STXS_EMPTY,     /* empty statement */
    STXS_NONE
} LuaSyntaxStatementType;

typedef enum {
    STXE_CONSTANT,   /* NUMBER | STRING | NIL | TRUE | FALSE */
    STXE_VARIABLE,   /* NAME */
    STXE_VARARG,     /* vararg expression (in exp list): '...' */
    STXE_FIELDREF,   /* refexp { '.' NAME } */
    STXE_INDEXEDREF, /* refexp '[' exp ']'  */
    STXE_FUNCCALL,   /* refexp '(' exp_list ')' */
    STXE_FUNCTION,   /* function definition: 'function' [ exp ] ['('] decl_list [')'] statements_list 'end' */
    STXE_MAINFUNC,   /* main function in this code chunk: statements_list */
    STXE_TABLE,      /* table constructor: '{' fields_list '}' */
    STXE_FIELDDEF,   /* table constructor field: NAME '=' exp */
    STXE_INDEXEDDEF, /* table constructor indexed field: '[' exp ']' '=' exp */
    STXE_OPERATION,  /* operations: list of tokens or expressions separated by operand keywords */
    STXE_SUBEXP,     /* '(' expr ')' */
    STXE_NONE
} LuaSyntaxExpressionType;

typedef enum {
    STXT_COMMENT,
    STXT_KEYWORD,
    STXT_KEYCHAR,
    STXT_NUMBER,
    STXT_STRING,
    STXT_NAME,      /* general name token */
    STXT_LOCALDECL, /* local variable declaration */
    STXT_HIDDENDECL, /* implicit variable declaration: typically "self" */
    STXT_LOCAL,
    STXT_GLOBAL,
    STXT_UPVALUE,
    STXT_TABLEFIELD,
    STXT_METHOD,
    STXT_LABEL,
    STXT_NONE
} LuaSyntaxTokenType;

typedef enum { /* Warning! Order in this enum shall match RESERVED enum in llex.h */
    STXK_AND, STXK_BREAK,
    STXK_DO, STXK_ELSE, STXK_ELSEIF, STXK_END, STXK_FALSE, STXK_FOR, STXK_FUNCTION,
    STXK_GOTO, STXK_IF, STXK_IN, STXK_LOCAL, STXK_NIL, STXK_NOT, STXK_OR, STXK_REPEAT,
    STXK_RETURN, STXK_THEN, STXK_TRUE, STXK_UNTIL, STXK_WHILE,
    STXK_CONCAT, STXK_DOTS, STXK_EQ, STXK_GE, STXK_LE, STXK_NE, STXK_DBCOLON,
    STXK_NONE,
} LuaSyntaxKeyword;

typedef enum { /* Warning! Order in this enum shall match LEX_ERROR enum in llex.h */
    STXERR_TOKEN,
    STXERR_LIMIT,
    STXERR_SYNTAX, /* generic syntax error */
    STXERR_SEMANTIC, /*semantic syntax error */
    STXERR_EXPECTED, /* an expected syntax entity is missing */
} LuaSyntaxErrorType;

typedef struct
{
    int syntaxlevel;
    union {
        struct {
            LuaSyntaxTokenType tokentype;
            union {
                LuaSyntaxKeyword keyword;  /* tokentype == STXT_KEYWORD */
                int              keychar;  /* tokentype == STXT_KEYCHAR */
                const char*      varname;  /* tokentype == STXT_HIDDENDECL */
                const char*      string;   /* tokentype == STXT_STRING or STXT_COMMENT */
                double           number;   /* tokentype == STXT_NUMBER */
            };
        } tokendata;
        
        struct {
            LuaSyntaxBlockType blocktype;
            union {
                LuaSyntaxStatementType  statementtype;  /* blocktype == STXB_STATEMENT */
                LuaSyntaxExpressionType expressiontype; /* blocktype == STXB_EXPRESSION */
            };
        } blockData;
        
        struct {
            int         errortype;
            const char* errorstring;
        } errorData;
        
    };
} LuaSyntaxEventData;

typedef void (*LuaSyntaxNotify)(LuaSyntaxEvent event, LuaSyntaxEventData* eventdata, int position, int length, void* context);

int lua_parser (lua_State *L, const char *sourceString, const char *chunkname, LuaSyntaxNotify notifyfunction, void* notifycontext);

#endif
