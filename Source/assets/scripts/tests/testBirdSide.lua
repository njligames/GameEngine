--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:f778fdfc8f79d36870194003e63b6499:51ab3104437a95c623f7e2d005543118:313deaa1ee2ccff5f7a7521665b5944d$
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
            -- testBirdSide_00000
            x=2,
            y=2,
            width=256,
            height=256,
	    pivotx=256,
	    pivoty=256,

        },
        {
            -- testBirdSide_00001
            x=2,
            y=260,
            width=256,
            height=256,
	    pivotx=256,
	    pivoty=256,

        },
        {
            -- testBirdSide_00002
            x=2,
            y=518,
            width=256,
            height=256,
	    pivotx=256,
	    pivoty=256,

        },
        {
            -- testBirdSide_00003
            x=260,
            y=2,
            width=256,
            height=256,
	    pivotx=256,
	    pivoty=256,

        },
        {
            -- testBirdSide_00004
            x=518,
            y=2,
            width=256,
            height=256,
	    pivotx=256,
	    pivoty=256,

        },
        {
            -- testBirdSide_00005
            x=260,
            y=260,
            width=256,
            height=256,
	    pivotx=256,
	    pivoty=256,

        },
        {
            -- testBirdSide_00006
            x=260,
            y=518,
            width=256,
            height=256,
	    pivotx=256,
	    pivoty=256,

        },
        {
            -- testBirdSide_00007
            x=518,
            y=260,
            width=256,
            height=256,
	    pivotx=256,
	    pivoty=256,

        },
        {
            -- testBirdSide_00008
            x=518,
            y=518,
            width=256,
            height=256,
	    pivotx=256,
	    pivoty=256,

        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["testBirdSide_00000"] = 1,
    ["testBirdSide_00001"] = 2,
    ["testBirdSide_00002"] = 3,
    ["testBirdSide_00003"] = 4,
    ["testBirdSide_00004"] = 5,
    ["testBirdSide_00005"] = 6,
    ["testBirdSide_00006"] = 7,
    ["testBirdSide_00007"] = 8,
    ["testBirdSide_00008"] = 9,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
