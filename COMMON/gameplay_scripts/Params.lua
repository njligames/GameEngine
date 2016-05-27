--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:2b1f311020c071bdcbd0f79dc168406c:0dfdc75a0105a5197a0402fce265a34c:e5221e08a01648a6cecb05e53395f223$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local ParamInfo = {}

ParamInfo =
{
    World =
    {
        Gravity = bullet.btVector3(0,-60.81,0),
        LayerDistance = 15.24, --meters (50 feet), How far each layer is from eachother
        LayerMax = 60.96, --meters (200 feet), How far the 4th (farthest) layer is from the camera
        WorldOffset = bullet.btVector2(1.0, 19.7),
        WorldScale = 91.0,
        MinBrightnessForDistance = 0.8, --value from 0.0 (black) to 1.0 (the image's brightness)
    },
	Projectile = 
	{
		WaterBalloon =
		{
			Azimuth = 10, --Angle fro mthe ground up
			Magnitude = 45, --How fast the balloon goes when you tap the screen.
			DieY = -50, --Y position for when the balloon's memory gets cleaned up.
            Mass = 1, --The mass of the balloon.
            FramesPerSecond = 30.0, -- must be: 1 <= fps <= 60
            Hues = {
                0,
                10,
                20,
                30,
                40,
                50,
                60,
                70,
                80,
                90,
                100,
                110,
                120,
                130,
                140,
                150,
                160,
                170,
                180,
                -10,
                -20,
                -30,
                -40,
                -50,
                -60,
                -70,
                -80,
                -90,
                -100,
                -110,
                -120,
                -130,
                -140,
                -150,
                -160,
                -170,
                -180,
            },
            ScaleMin = 0.9,
            ScaleMax = 2.0,
            --Still have to make these variables live...
            DeathVariables = {
                FramesPerSecond = 30.0, -- must be: 1 <= fps <= 60
                ShowParticles = false,
            },
		},
	},
	Dog = 
	{
		MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
		MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),		
		DazedTime = (0.5 * 1000),
		CapturedHeight = 20,
	},
	Bird =
	{
		chubiBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = 1,
            PursueTime = (6 * 1000),
			StealSpeed = 1,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
            --David add your variables after here..
            ScalarVariableExample=0,
            ArrayVariableExample={
                Example1 = true,
                Example2 = "hello i'm  string",
                Example3 = 1.0,
                Example4 = {
                    AnotherVariable = 0
                },

            }
		},
		garuBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			PursueTime = (5 * 1000),
			StealSpeed = 2,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
		},
		momiBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			PursueTime = (4 * 1000),
			StealSpeed = 3,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
		},
		puffyBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			PursueTime = (3 * 1000),
			StealSpeed = 4,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
		},
		weboBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			PursueTime = (2 * 1000),
			StealSpeed = 5,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
		},
		zuruBird =
		{
			MaxSpeed = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			MaxForce = njli.World.getInstance():getWorldLuaVirtualMachine():getMaxNumber(),
			PursueTime = (1 * 1000),
			StealSpeed = 6,
			YapTime = {low=(10 * 1000), high=(30 * 1000)},
			DieY = -50,
		},
		
	},
}

return ParamInfo
