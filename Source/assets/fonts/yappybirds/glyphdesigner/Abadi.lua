local Font = {}

Font.info = 
    {
    face              = "Abadi MT Condensed Extra Bold",
    file              = "Abadi.png",
    size              = 64,
    bold              = 1,
    italic            = 0,
    charset           = "",
    unicode           = 0,
    stretchH          = 100,
    smooth            = 1,
    aa                = 1,
    padding           = {0, 0, 0, 0},
    spacing           = 2,
    charsCount        = 95,
    kerningsCounts    = 277,
    }

Font.common =
    {
    lineHeight        = 74,
    base              = 56,
    scaleW            = 512,
    scaleH            = 512,
    pages             = 1,
    packed            = 0,
    }

Font.chars =
    {
    {id=32,x=63,y=314,width=0,height=0,xoffset=0,yoffset=56,xadvance=16,page=0,chnl=0,letter="space"},
    {id=33,x=2,y=123,width=16,height=50,xoffset=4,yoffset=32,xadvance=19,page=0,chnl=0,letter="!"},
    {id=34,x=366,y=276,width=29,height=22,xoffset=4,yoffset=18,xadvance=31,page=0,chnl=0,letter=string.char(34)},
    {id=35,x=425,y=2,width=43,height=51,xoffset=2,yoffset=32,xadvance=43,page=0,chnl=0,letter="#"},
    {id=36,x=280,y=2,width=31,height=56,xoffset=3,yoffset=33,xadvance=30,page=0,chnl=0,letter="$"},
    {id=37,x=313,y=2,width=54,height=55,xoffset=2,yoffset=32,xadvance=52,page=0,chnl=0,letter="%"},
    {id=38,x=61,y=70,width=37,height=50,xoffset=2,yoffset=32,xadvance=35,page=0,chnl=0,letter="&"},
    {id=39,x=397,y=276,width=15,height=22,xoffset=3,yoffset=18,xadvance=15,page=0,chnl=0,letter="'"},
    {id=40,x=97,y=2,width=21,height=63,xoffset=9,yoffset=39,xadvance=27,page=0,chnl=0,letter="("},
    {id=41,x=120,y=2,width=21,height=63,xoffset=3,yoffset=39,xadvance=27,page=0,chnl=0,letter=")"},
    {id=42,x=337,y=276,width=27,height=25,xoffset=4,yoffset=20,xadvance=30,page=0,chnl=0,letter="*"},
    {id=43,x=238,y=226,width=40,height=40,xoffset=4,yoffset=33,xadvance=43,page=0,chnl=0,letter="+"},
    {id=44,x=276,y=276,width=17,height=29,xoffset=4,yoffset=57,xadvance=19,page=0,chnl=0,letter=","},
    {id=45,x=456,y=276,width=22,height=15,xoffset=4,yoffset=39,xadvance=24,page=0,chnl=0,letter="-"},
    {id=46,x=2,y=314,width=15,height=15,xoffset=4,yoffset=50,xadvance=19,page=0,chnl=0,letter="."},
    {id=47,x=397,y=2,width=26,height=55,xoffset=2,yoffset=34,xadvance=24,page=0,chnl=0,letter="/"},
    {id=48,x=379,y=123,width=35,height=49,xoffset=2,yoffset=33,xadvance=33,page=0,chnl=0,letter="0"},
    {id=49,x=104,y=226,width=22,height=47,xoffset=6,yoffset=33,xadvance=33,page=0,chnl=0,letter="1"},
    {id=50,x=478,y=175,width=32,height=48,xoffset=3,yoffset=32,xadvance=33,page=0,chnl=0,letter="2"},
    {id=51,x=411,y=175,width=30,height=49,xoffset=4,yoffset=33,xadvance=33,page=0,chnl=0,letter="3"},
    {id=52,x=34,y=226,width=35,height=47,xoffset=2,yoffset=33,xadvance=33,page=0,chnl=0,letter="4"},
    {id=53,x=2,y=226,width=30,height=48,xoffset=5,yoffset=33,xadvance=33,page=0,chnl=0,letter="5"},
    {id=54,x=180,y=175,width=33,height=49,xoffset=2,yoffset=33,xadvance=33,page=0,chnl=0,letter="6"},
    {id=55,x=71,y=226,width=31,height=47,xoffset=3,yoffset=33,xadvance=33,page=0,chnl=0,letter="7"},
    {id=56,x=416,y=123,width=35,height=49,xoffset=2,yoffset=33,xadvance=33,page=0,chnl=0,letter="8"},
    {id=57,x=215,y=175,width=33,height=49,xoffset=2,yoffset=33,xadvance=33,page=0,chnl=0,letter="9"},
    {id=58,x=440,y=226,width=15,height=37,xoffset=4,yoffset=39,xadvance=19,page=0,chnl=0,letter=":"},
    {id=59,x=2,y=70,width=17,height=51,xoffset=4,yoffset=46,xadvance=19,page=0,chnl=0,letter=";"},
    {id=60,x=154,y=226,width=40,height=41,xoffset=4,yoffset=33,xadvance=43,page=0,chnl=0,letter="<"},
    {id=61,x=295,y=276,width=40,height=27,xoffset=4,yoffset=33,xadvance=43,page=0,chnl=0,letter="="},
    {id=62,x=196,y=226,width=40,height=41,xoffset=4,yoffset=33,xadvance=43,page=0,chnl=0,letter=">"},
    {id=63,x=374,y=70,width=30,height=50,xoffset=2,yoffset=32,xadvance=29,page=0,chnl=0,letter="?"},
    {id=64,x=183,y=2,width=55,height=61,xoffset=2,yoffset=37,xadvance=53,page=0,chnl=0,letter="@"},
    {id=65,x=112,y=123,width=38,height=49,xoffset=0,yoffset=32,xadvance=33,page=0,chnl=0,letter="A"},
    {id=66,x=342,y=123,width=35,height=49,xoffset=3,yoffset=32,xadvance=33,page=0,chnl=0,letter="B"},
    {id=67,x=406,y=70,width=29,height=50,xoffset=2,yoffset=32,xadvance=27,page=0,chnl=0,letter="C"},
    {id=68,x=268,y=123,width=35,height=49,xoffset=3,yoffset=32,xadvance=34,page=0,chnl=0,letter="D"},
    {id=69,x=315,y=175,width=30,height=49,xoffset=3,yoffset=32,xadvance=30,page=0,chnl=0,letter="E"},
    {id=70,x=379,y=175,width=30,height=49,xoffset=3,yoffset=32,xadvance=29,page=0,chnl=0,letter="F"},
    {id=71,x=136,y=70,width=33,height=50,xoffset=2,yoffset=32,xadvance=32,page=0,chnl=0,letter="G"},
    {id=72,x=2,y=175,width=34,height=49,xoffset=3,yoffset=32,xadvance=35,page=0,chnl=0,letter="H"},
    {id=73,x=443,y=175,width=16,height=49,xoffset=3,yoffset=32,xadvance=17,page=0,chnl=0,letter="I"},
    {id=74,x=463,y=70,width=20,height=50,xoffset=2,yoffset=32,xadvance=20,page=0,chnl=0,letter="J"},
    {id=75,x=305,y=123,width=35,height=49,xoffset=3,yoffset=32,xadvance=31,page=0,chnl=0,letter="K"},
    {id=76,x=347,y=175,width=30,height=49,xoffset=3,yoffset=32,xadvance=27,page=0,chnl=0,letter="L"},
    {id=77,x=70,y=123,width=40,height=49,xoffset=3,yoffset=32,xadvance=41,page=0,chnl=0,letter="M"},
    {id=78,x=453,y=123,width=34,height=49,xoffset=3,yoffset=32,xadvance=35,page=0,chnl=0,letter="N"},
    {id=79,x=21,y=70,width=38,height=50,xoffset=1,yoffset=32,xadvance=35,page=0,chnl=0,letter="O"},
    {id=80,x=74,y=175,width=34,height=49,xoffset=3,yoffset=32,xadvance=32,page=0,chnl=0,letter="P"},
    {id=81,x=240,y=2,width=38,height=60,xoffset=1,yoffset=36,xadvance=35,page=0,chnl=0,letter="Q"},
    {id=82,x=38,y=175,width=34,height=49,xoffset=3,yoffset=32,xadvance=32,page=0,chnl=0,letter="R"},
    {id=83,x=341,y=70,width=31,height=50,xoffset=2,yoffset=32,xadvance=29,page=0,chnl=0,letter="S"},
    {id=84,x=110,y=175,width=33,height=49,xoffset=2,yoffset=32,xadvance=31,page=0,chnl=0,letter="T"},
    {id=85,x=100,y=70,width=34,height=50,xoffset=3,yoffset=32,xadvance=33,page=0,chnl=0,letter="U"},
    {id=86,x=152,y=123,width=37,height=49,xoffset=0,yoffset=32,xadvance=33,page=0,chnl=0,letter="V"},
    {id=87,x=20,y=123,width=48,height=49,xoffset=1,yoffset=32,xadvance=43,page=0,chnl=0,letter="W"},
    {id=88,x=191,y=123,width=37,height=49,xoffset=1,yoffset=32,xadvance=33,page=0,chnl=0,letter="X"},
    {id=89,x=230,y=123,width=36,height=49,xoffset=1,yoffset=32,xadvance=32,page=0,chnl=0,letter="Y"},
    {id=90,x=145,y=175,width=33,height=49,xoffset=2,yoffset=32,xadvance=31,page=0,chnl=0,letter="Z"},
    {id=91,x=143,y=2,width=18,height=63,xoffset=9,yoffset=39,xadvance=25,page=0,chnl=0,letter="["},
    {id=92,x=369,y=2,width=26,height=55,xoffset=2,yoffset=34,xadvance=24,page=0,chnl=0,letter=string.char(92)},
    {id=93,x=163,y=2,width=18,height=63,xoffset=3,yoffset=39,xadvance=25,page=0,chnl=0,letter="]"},
    {id=94,x=238,y=276,width=36,height=30,xoffset=4,yoffset=22,xadvance=37,page=0,chnl=0,letter="^"},
    {id=95,x=19,y=314,width=42,height=9,xoffset=-0,yoffset=60,xadvance=35,page=0,chnl=0,letter="_"},
    {id=96,x=480,y=276,width=18,height=15,xoffset=3,yoffset=15,xadvance=21,page=0,chnl=0,letter="`"},
    {id=97,x=315,y=226,width=32,height=37,xoffset=2,yoffset=39,xadvance=29,page=0,chnl=0,letter="a"},
    {id=98,x=171,y=70,width=32,height=50,xoffset=3,yoffset=32,xadvance=31,page=0,chnl=0,letter="b"},
    {id=99,x=413,y=226,width=25,height=37,xoffset=2,yoffset=39,xadvance=23,page=0,chnl=0,letter="c"},
    {id=100,x=205,y=70,width=32,height=50,xoffset=2,yoffset=32,xadvance=31,page=0,chnl=0,letter="d"},
    {id=101,x=349,y=226,width=32,height=37,xoffset=2,yoffset=39,xadvance=30,page=0,chnl=0,letter="e"},
    {id=102,x=437,y=70,width=24,height=50,xoffset=1,yoffset=31,xadvance=19,page=0,chnl=0,letter="f"},
    {id=103,x=470,y=2,width=32,height=51,xoffset=2,yoffset=46,xadvance=31,page=0,chnl=0,letter="g"},
    {id=104,x=283,y=175,width=30,height=49,xoffset=3,yoffset=32,xadvance=31,page=0,chnl=0,letter="h"},
    {id=105,x=485,y=70,width=16,height=50,xoffset=3,yoffset=31,xadvance=17,page=0,chnl=0,letter="i"},
    {id=106,x=60,y=2,width=21,height=64,xoffset=-1,yoffset=39,xadvance=17,page=0,chnl=0,letter="j"},
    {id=107,x=250,y=175,width=31,height=49,xoffset=3,yoffset=32,xadvance=28,page=0,chnl=0,letter="k"},
    {id=108,x=461,y=175,width=15,height=49,xoffset=3,yoffset=32,xadvance=17,page=0,chnl=0,letter="l"},
    {id=109,x=457,y=226,width=44,height=36,xoffset=3,yoffset=38,xadvance=45,page=0,chnl=0,letter="m"},
    {id=110,x=2,y=276,width=30,height=36,xoffset=3,yoffset=38,xadvance=31,page=0,chnl=0,letter="n"},
    {id=111,x=280,y=226,width=33,height=37,xoffset=2,yoffset=39,xadvance=31,page=0,chnl=0,letter="o"},
    {id=112,x=239,y=70,width=32,height=50,xoffset=3,yoffset=45,xadvance=31,page=0,chnl=0,letter="p"},
    {id=113,x=273,y=70,width=32,height=50,xoffset=2,yoffset=45,xadvance=31,page=0,chnl=0,letter="q"},
    {id=114,x=66,y=276,width=23,height=36,xoffset=3,yoffset=38,xadvance=21,page=0,chnl=0,letter="r"},
    {id=115,x=383,y=226,width=28,height=37,xoffset=2,yoffset=39,xadvance=26,page=0,chnl=0,letter="s"},
    {id=116,x=128,y=226,width=24,height=45,xoffset=1,yoffset=35,xadvance=21,page=0,chnl=0,letter="t"},
    {id=117,x=34,y=276,width=30,height=36,xoffset=3,yoffset=39,xadvance=31,page=0,chnl=0,letter="u"},
    {id=118,x=173,y=276,width=32,height=35,xoffset=-1,yoffset=39,xadvance=25,page=0,chnl=0,letter="v"},
    {id=119,x=91,y=276,width=46,height=35,xoffset=-0,yoffset=39,xadvance=41,page=0,chnl=0,letter="w"},
    {id=120,x=139,y=276,width=32,height=35,xoffset=0,yoffset=39,xadvance=27,page=0,chnl=0,letter="x"},
    {id=121,x=307,y=70,width=32,height=50,xoffset=0,yoffset=46,xadvance=27,page=0,chnl=0,letter="y"},
    {id=122,x=207,y=276,width=29,height=35,xoffset=2,yoffset=39,xadvance=27,page=0,chnl=0,letter="z"},
    {id=123,x=2,y=2,width=27,height=66,xoffset=2,yoffset=39,xadvance=25,page=0,chnl=0,letter="{"},
    {id=124,x=83,y=2,width=12,height=64,xoffset=15,yoffset=39,xadvance=38,page=0,chnl=0,letter="|"},
    {id=125,x=31,y=2,width=27,height=66,xoffset=2,yoffset=39,xadvance=25,page=0,chnl=0,letter="}"},
    {id=126,x=414,y=276,width=40,height=17,xoffset=4,yoffset=33,xadvance=42,page=0,chnl=0,letter="~"},
    }

Font.kerning =
    {
    {first=36, second=62, amount=5},
    {first=36, second=63, amount=3},
    {first=65, second=67, amount=-1},
    {first=65, second=71, amount=-2},
    {first=65, second=79, amount=-1},
    {first=65, second=81, amount=-1},
    {first=65, second=84, amount=-4},
    {first=65, second=85, amount=-2},
    {first=65, second=86, amount=-2},
    {first=65, second=87, amount=-1},
    {first=65, second=89, amount=-4},
    {first=65, second=112, amount=1},
    {first=65, second=117, amount=-1},
    {first=65, second=118, amount=-1},
    {first=66, second=44, amount=-1},
    {first=66, second=46, amount=-1},
    {first=66, second=65, amount=-1},
    {first=66, second=85, amount=-1},
    {first=68, second=44, amount=-4},
    {first=68, second=46, amount=-4},
    {first=68, second=65, amount=-2},
    {first=68, second=86, amount=-2},
    {first=68, second=87, amount=-1},
    {first=68, second=89, amount=-3},
    {first=70, second=44, amount=-10},
    {first=70, second=46, amount=-10},
    {first=70, second=65, amount=-3},
    {first=70, second=101, amount=-1},
    {first=70, second=108, amount=1},
    {first=70, second=111, amount=-1},
    {first=70, second=114, amount=-1},
    {first=71, second=44, amount=1},
    {first=71, second=46, amount=1},
    {first=74, second=44, amount=-3},
    {first=74, second=46, amount=-3},
    {first=74, second=58, amount=-1},
    {first=74, second=59, amount=-1},
    {first=74, second=65, amount=-2},
    {first=74, second=101, amount=-1},
    {first=74, second=111, amount=-2},
    {first=74, second=117, amount=-1},
    {first=74, second=121, amount=-1},
    {first=75, second=67, amount=1},
    {first=75, second=71, amount=-1},
    {first=75, second=97, amount=2},
    {first=75, second=101, amount=1},
    {first=75, second=111, amount=1},
    {first=75, second=117, amount=1},
    {first=75, second=118, amount=2},
    {first=75, second=119, amount=2},
    {first=75, second=121, amount=2},
    {first=76, second=67, amount=1},
    {first=76, second=71, amount=-1},
    {first=76, second=84, amount=-3},
    {first=76, second=86, amount=-2},
    {first=76, second=87, amount=-1},
    {first=76, second=89, amount=-4},
    {first=76, second=121, amount=1},
    {first=79, second=44, amount=-4},
    {first=79, second=46, amount=-3},
    {first=79, second=65, amount=-3},
    {first=79, second=84, amount=-2},
    {first=79, second=86, amount=-2},
    {first=79, second=87, amount=-1},
    {first=79, second=88, amount=-3},
    {first=79, second=89, amount=-3},
    {first=80, second=44, amount=-13},
    {first=80, second=46, amount=-13},
    {first=80, second=65, amount=-4},
    {first=80, second=97, amount=-1},
    {first=80, second=101, amount=-2},
    {first=80, second=111, amount=-2},
    {first=81, second=44, amount=-3},
    {first=81, second=46, amount=-3},
    {first=81, second=65, amount=-1},
    {first=81, second=84, amount=-2},
    {first=81, second=86, amount=-1},
    {first=81, second=89, amount=-3},
    {first=82, second=71, amount=-1},
    {first=82, second=79, amount=-1},
    {first=82, second=81, amount=-1},
    {first=82, second=84, amount=-1},
    {first=82, second=85, amount=-1},
    {first=82, second=86, amount=-1},
    {first=82, second=89, amount=-2},
    {first=82, second=97, amount=1},
    {first=82, second=101, amount=-1},
    {first=82, second=111, amount=-1},
    {first=82, second=117, amount=-1},
    {first=82, second=118, amount=1},
    {first=82, second=119, amount=2},
    {first=82, second=121, amount=1},
    {first=83, second=44, amount=-2},
    {first=83, second=46, amount=-2},
    {first=84, second=44, amount=-7},
    {first=84, second=45, amount=-5},
    {first=84, second=46, amount=-7},
    {first=84, second=58, amount=-4},
    {first=84, second=59, amount=-4},
    {first=84, second=65, amount=-4},
    {first=84, second=67, amount=-2},
    {first=84, second=71, amount=-3},
    {first=84, second=79, amount=-2},
    {first=84, second=81, amount=-2},
    {first=84, second=97, amount=-3},
    {first=84, second=99, amount=-4},
    {first=84, second=101, amount=-3},
    {first=84, second=104, amount=1},
    {first=84, second=109, amount=-3},
    {first=84, second=111, amount=-3},
    {first=84, second=114, amount=-3},
    {first=84, second=115, amount=-2},
    {first=84, second=117, amount=-3},
    {first=84, second=119, amount=-1},
    {first=84, second=121, amount=-1},
    {first=84, second=122, amount=-2},
    {first=85, second=44, amount=-2},
    {first=85, second=46, amount=-2},
    {first=85, second=65, amount=-1},
    {first=86, second=44, amount=-8},
    {first=86, second=45, amount=-4},
    {first=86, second=46, amount=-8},
    {first=86, second=58, amount=-3},
    {first=86, second=59, amount=-3},
    {first=86, second=65, amount=-3},
    {first=86, second=67, amount=-1},
    {first=86, second=71, amount=-3},
    {first=86, second=79, amount=-2},
    {first=86, second=81, amount=-2},
    {first=86, second=97, amount=-2},
    {first=86, second=101, amount=-3},
    {first=86, second=105, amount=-1},
    {first=86, second=111, amount=-3},
    {first=86, second=114, amount=-2},
    {first=86, second=117, amount=-2},
    {first=86, second=121, amount=-1},
    {first=87, second=44, amount=-5},
    {first=87, second=45, amount=-3},
    {first=87, second=46, amount=-5},
    {first=87, second=58, amount=-3},
    {first=87, second=59, amount=-3},
    {first=87, second=65, amount=-1},
    {first=87, second=67, amount=-1},
    {first=87, second=71, amount=-2},
    {first=87, second=79, amount=-1},
    {first=87, second=97, amount=-1},
    {first=87, second=100, amount=-1},
    {first=87, second=101, amount=-2},
    {first=87, second=104, amount=1},
    {first=87, second=105, amount=-1},
    {first=87, second=111, amount=-2},
    {first=88, second=67, amount=-1},
    {first=88, second=71, amount=-2},
    {first=88, second=79, amount=-1},
    {first=89, second=44, amount=-9},
    {first=89, second=45, amount=-6},
    {first=89, second=46, amount=-9},
    {first=89, second=58, amount=-5},
    {first=89, second=59, amount=-5},
    {first=89, second=65, amount=-4},
    {first=89, second=67, amount=-2},
    {first=89, second=71, amount=-4},
    {first=89, second=79, amount=-3},
    {first=89, second=83, amount=-2},
    {first=89, second=97, amount=-4},
    {first=89, second=100, amount=-4},
    {first=89, second=101, amount=-4},
    {first=89, second=105, amount=-1},
    {first=89, second=111, amount=-4},
    {first=89, second=112, amount=-2},
    {first=89, second=113, amount=-3},
    {first=89, second=117, amount=-3},
    {first=89, second=118, amount=-1},
    {first=97, second=98, amount=1},
    {first=97, second=103, amount=1},
    {first=97, second=116, amount=-1},
    {first=97, second=118, amount=-1},
    {first=97, second=119, amount=-1},
    {first=98, second=44, amount=-2},
    {first=98, second=46, amount=-2},
    {first=98, second=98, amount=1},
    {first=98, second=108, amount=-1},
    {first=98, second=117, amount=-1},
    {first=98, second=118, amount=-1},
    {first=98, second=121, amount=-1},
    {first=99, second=121, amount=1},
    {first=100, second=100, amount=1},
    {first=100, second=118, amount=1},
    {first=100, second=119, amount=1},
    {first=100, second=121, amount=1},
    {first=101, second=44, amount=-1},
    {first=101, second=46, amount=-1},
    {first=101, second=98, amount=1},
    {first=101, second=103, amount=1},
    {first=101, second=118, amount=1},
    {first=101, second=119, amount=1},
    {first=101, second=120, amount=-1},
    {first=102, second=32, amount=5},
    {first=102, second=33, amount=3},
    {first=102, second=44, amount=-2},
    {first=102, second=46, amount=-2},
    {first=102, second=63, amount=4},
    {first=102, second=97, amount=1},
    {first=102, second=102, amount=2},
    {first=102, second=107, amount=1},
    {first=103, second=97, amount=1},
    {first=103, second=101, amount=-1},
    {first=103, second=111, amount=-1},
    {first=103, second=121, amount=1},
    {first=105, second=118, amount=1},
    {first=107, second=101, amount=-1},
    {first=107, second=121, amount=1},
    {first=108, second=121, amount=1},
    {first=109, second=117, amount=-1},
    {first=109, second=121, amount=1},
    {first=110, second=121, amount=-1},
    {first=111, second=44, amount=-1},
    {first=111, second=46, amount=-1},
    {first=111, second=103, amount=1},
    {first=111, second=120, amount=-1},
    {first=111, second=121, amount=-1},
    {first=112, second=44, amount=-1},
    {first=112, second=46, amount=-1},
    {first=112, second=119, amount=-1},
    {first=112, second=121, amount=-1},
    {first=112, second=122, amount=-1},
    {first=114, second=44, amount=-5},
    {first=114, second=45, amount=1},
    {first=114, second=46, amount=-5},
    {first=114, second=58, amount=2},
    {first=114, second=59, amount=2},
    {first=114, second=97, amount=1},
    {first=114, second=99, amount=1},
    {first=114, second=100, amount=1},
    {first=114, second=101, amount=1},
    {first=114, second=103, amount=1},
    {first=114, second=106, amount=2},
    {first=114, second=107, amount=1},
    {first=114, second=108, amount=1},
    {first=114, second=109, amount=1},
    {first=114, second=110, amount=1},
    {first=114, second=111, amount=1},
    {first=114, second=112, amount=1},
    {first=114, second=113, amount=1},
    {first=114, second=114, amount=2},
    {first=114, second=115, amount=2},
    {first=114, second=116, amount=3},
    {first=114, second=117, amount=1},
    {first=114, second=118, amount=3},
    {first=114, second=121, amount=2},
    {first=115, second=119, amount=-1},
    {first=118, second=44, amount=-3},
    {first=118, second=46, amount=-3},
    {first=118, second=97, amount=1},
    {first=118, second=99, amount=1},
    {first=118, second=100, amount=1},
    {first=118, second=101, amount=1},
    {first=118, second=113, amount=1},
    {first=119, second=44, amount=-3},
    {first=119, second=46, amount=-3},
    {first=119, second=97, amount=1},
    {first=119, second=99, amount=1},
    {first=119, second=100, amount=1},
    {first=119, second=104, amount=1},
    {first=119, second=113, amount=1},
    {first=120, second=99, amount=-1},
    {first=120, second=100, amount=-1},
    {first=120, second=101, amount=-1},
    {first=120, second=111, amount=-1},
    {first=121, second=44, amount=-4},
    {first=121, second=46, amount=-4},
    {first=121, second=97, amount=1},
    {first=121, second=101, amount=-1},
    {first=121, second=103, amount=1},
    {first=121, second=111, amount=-1},
    {first=122, second=99, amount=1},
    {first=122, second=100, amount=1},
    }

return Font