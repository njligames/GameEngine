--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:64a97c46eee7938f9c380e8453297be7:1a75693b5582b3694476bdc0fe152502:f94c4674a58e1ee53e1cb2fa4af30ee6$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- bird_00000
            x=731,
            y=0,
            width=217,
            height=230,

            sourceX = 14,
            sourceY = 11,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- bird_00001
            x=0,
            y=670,
            width=185,
            height=238,

            sourceX = 29,
            sourceY = 11,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- bird_00002
            x=206,
            y=527,
            width=195,
            height=213,

            sourceX = 27,
            sourceY = 31,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- bird_00003
            x=0,
            y=0,
            width=250,
            height=183,

            sourceX = 4,
            sourceY = 61,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- bird_00004
            x=250,
            y=0,
            width=249,
            height=186,

            sourceX = 2,
            sourceY = 58,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- bird_00005
            x=499,
            y=0,
            width=232,
            height=190,

            sourceX = 10,
            sourceY = 63,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- bird_00006
            x=249,
            y=186,
            width=230,
            height=176,

            sourceX = 9,
            sourceY = 68,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- bird_00007
            x=0,
            y=350,
            width=218,
            height=171,

            sourceX = 21,
            sourceY = 73,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- bird_00008
            x=0,
            y=183,
            width=249,
            height=167,

            sourceX = 5,
            sourceY = 81,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- dog_00000
            x=688,
            y=389,
            width=204,
            height=166,

            sourceX = 13,
            sourceY = 59,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- dog_00001
            x=185,
            y=740,
            width=183,
            height=164,

            sourceX = 32,
            sourceY = 61,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- dog_00002
            x=368,
            y=740,
            width=193,
            height=150,

            sourceX = 20,
            sourceY = 69,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- dog_00003
            x=691,
            y=230,
            width=211,
            height=159,

            sourceX = 14,
            sourceY = 65,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- dog_00004
            x=424,
            y=523,
            width=201,
            height=161,

            sourceX = 30,
            sourceY = 65,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- dog_00005
            x=479,
            y=190,
            width=212,
            height=165,

            sourceX = 24,
            sourceY = 56,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- dog_00006
            x=0,
            y=521,
            width=206,
            height=149,

            sourceX = 34,
            sourceY = 60,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- dog_00007
            x=218,
            y=362,
            width=206,
            height=165,

            sourceX = 28,
            sourceY = 64,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- dog_00008
            x=479,
            y=355,
            width=209,
            height=168,

            sourceX = 9,
            sourceY = 59,
            sourceWidth = 256,
            sourceHeight = 256
        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["bird_00000"] = 1,
    ["bird_00001"] = 2,
    ["bird_00002"] = 3,
    ["bird_00003"] = 4,
    ["bird_00004"] = 5,
    ["bird_00005"] = 6,
    ["bird_00006"] = 7,
    ["bird_00007"] = 8,
    ["bird_00008"] = 9,
    ["dog_00000"] = 10,
    ["dog_00001"] = 11,
    ["dog_00002"] = 12,
    ["dog_00003"] = 13,
    ["dog_00004"] = 14,
    ["dog_00005"] = 15,
    ["dog_00006"] = 16,
    ["dog_00007"] = 17,
    ["dog_00008"] = 18,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
