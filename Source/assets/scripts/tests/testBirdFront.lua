--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:14cde4ac81086528cadcd08c693a3bc6:09d7d20a7709bd73f90fa787c14daea9:2a0da0020b57c038153eb747c3d2b3c2$
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
            -- testBirdFront_00000
            x=2,
            y=2,
            width=256,
            height=256,

        },
        {
            -- testBirdFront_00001
            x=2,
            y=260,
            width=256,
            height=256,

        },
        {
            -- testBirdFront_00002
            x=2,
            y=518,
            width=256,
            height=256,

        },
        {
            -- testBirdFront_00003
            x=260,
            y=2,
            width=256,
            height=256,

        },
        {
            -- testBirdFront_00004
            x=518,
            y=2,
            width=256,
            height=256,

        },
        {
            -- testBirdFront_00005
            x=260,
            y=260,
            width=256,
            height=256,

        },
        {
            -- testBirdFront_00006
            x=260,
            y=518,
            width=256,
            height=256,

        },
        {
            -- testBirdFront_00007
            x=518,
            y=260,
            width=256,
            height=256,

        },
        {
            -- testBirdFront_00008
            x=518,
            y=518,
            width=256,
            height=256,

        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["testBirdFront_00000"] = 1,
    ["testBirdFront_00001"] = 2,
    ["testBirdFront_00002"] = 3,
    ["testBirdFront_00003"] = 4,
    ["testBirdFront_00004"] = 5,
    ["testBirdFront_00005"] = 6,
    ["testBirdFront_00006"] = 7,
    ["testBirdFront_00007"] = 8,
    ["testBirdFront_00008"] = 9,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
