--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:9f8ea5a4677d45a41c6874d60780531a:81918dd1d003622284c6f079c5133eff:f7b104b5caf7d2895de2181e87a70fad$
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
            -- 128cloud00
            x=716,
            y=1775,
            width=128,
            height=105,

        },
        {
            -- 2048hills00
            x=0,
            y=886,
            width=2048,
            height=376,

        },
        {
            -- 2048hills01
            x=0,
            y=0,
            width=2048,
            height=463,

        },
        {
            -- 2048hills02
            x=0,
            y=463,
            width=2048,
            height=423,

        },
        {
            -- 256cloud00
            x=460,
            y=1775,
            width=256,
            height=209,

        },
        {
            -- 256house00
            x=227,
            y=1775,
            width=233,
            height=256,

        },
        {
            -- 256tree00
            x=0,
            y=1775,
            width=227,
            height=257,

        },
        {
            -- 512tree00
            x=0,
            y=1262,
            width=454,
            height=513,

        },
        {
            -- 512tree01
            x=454,
            y=1262,
            width=454,
            height=513,

        },
    },
    
    sheetContentWidth = 2048,
    sheetContentHeight = 2048
}

SheetInfo.frameIndex =
{

    ["128cloud00"] = 1,
    ["2048hills00"] = 2,
    ["2048hills01"] = 3,
    ["2048hills02"] = 4,
    ["256cloud00"] = 5,
    ["256house00"] = 6,
    ["256tree00"] = 7,
    ["512tree00"] = 8,
    ["512tree01"] = 9,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
