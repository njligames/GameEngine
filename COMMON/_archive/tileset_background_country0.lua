--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:7074c7415c306dddc6a06d689bb50f6b:80c2cc27212c0fb58d9ee62e7dfb33ab:2c81e27ca2ed04347d4c1025c5eca84f$
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
            -- 1024tree00
            x=0,
            y=0,
            width=906,
            height=1024,

            sourceX = 59,
            sourceY = 0,
            sourceWidth = 1024,
            sourceHeight = 1024
        },
        {
            -- 128cloud00
            x=0,
            y=1916,
            width=128,
            height=105,

            sourceX = 0,
            sourceY = 12,
            sourceWidth = 128,
            sourceHeight = 128
        },
        {
            -- 2048hills00
            x=0,
            y=1024,
            width=2048,
            height=636,

            sourceX = 0,
            sourceY = 388,
            sourceWidth = 2048,
            sourceHeight = 1024
        },
        {
            -- 2048hills01
            x=2048,
            y=0,
            width=2048,
            height=550,

            sourceX = 0,
            sourceY = 474,
            sourceWidth = 2048,
            sourceHeight = 1024
        },
        {
            -- 2048hills02
            x=2048,
            y=550,
            width=2048,
            height=424,

            sourceX = 0,
            sourceY = 600,
            sourceWidth = 2048,
            sourceHeight = 1024
        },
        {
            -- 256cloud00
            x=460,
            y=1660,
            width=256,
            height=209,

            sourceX = 0,
            sourceY = 24,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- 256house00
            x=0,
            y=1660,
            width=233,
            height=256,

            sourceX = 12,
            sourceY = 0,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- 256tree00
            x=233,
            y=1660,
            width=227,
            height=256,

            sourceX = 15,
            sourceY = 0,
            sourceWidth = 256,
            sourceHeight = 256
        },
        {
            -- 512tree00
            x=906,
            y=0,
            width=454,
            height=512,

            sourceX = 29,
            sourceY = 0,
            sourceWidth = 512,
            sourceHeight = 512
        },
    },
    
    sheetContentWidth = 4096,
    sheetContentHeight = 2048
}

SheetInfo.frameIndex =
{

    ["1024tree00"] = 1,
    ["128cloud00"] = 2,
    ["2048hills00"] = 3,
    ["2048hills01"] = 4,
    ["2048hills02"] = 5,
    ["256cloud00"] = 6,
    ["256house00"] = 7,
    ["256tree00"] = 8,
    ["512tree00"] = 9,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
