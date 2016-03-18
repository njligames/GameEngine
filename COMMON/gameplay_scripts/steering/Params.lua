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
    NumAgents                = 300,

	NumObstacles             = 7,
	MinObstacleRadius        = 10,
	MaxObstacleRadius        = 30,



	--number of horizontal cells used for spatial partitioning
	NumCellsX                = 7,
	--number of vertical cells used for spatial partitioning
	NumCellsY                = 7,


	--how many samples the smoother will use to average a value
	NumSamplesForSmoothing   = 10,


	--this is used to multiply the steering force AND all the multipliers
	--found in SteeringBehavior
	SteeringForceTweaker     = 200.0,

	SteeringForce            = 2.0,
	MaxSpeed                 = 150.0,
	VehicleMass              = 1.0,
	VehicleScale             = 3.0,

	--use these values to tweak the amount that each steering force
	--contributes to the total steering force
	SeparationWeight          = 100.0,
	AlignmentWeight           = 1.0,
	CohesionWeight            = 2.0,
	ObstacleAvoidanceWeight   = 10.0,
	WallAvoidanceWeight       = 10.0,
	WanderWeight              = 1.0,
	SeekWeight                = 1.0,
	FleeWeight                = 1.0,
	ArriveWeight              = 1.0,
	PursuitWeight             = 1.0,
	OffsetPursuitWeight       = 1.0,
	InterposeWeight           = 1.0,
	HideWeight                = 1.0,
	EvadeWeight               = 200.0,--0.01,
	FollowPathWeight          = 1.0,--0.05,

	--how close a neighbour must be before an agent perceives it (considers it
	--to be within its neighborhood)
	ViewDistance              = 50.0,

	--used in obstacle avoidance
	MinDetectionBoxLength     = 40.0,

	--used in wall avoidance
	WallDetectionFeelerLength = 40.0,

	--these are the probabilities that a steering behavior will be used
	--when the Prioritized Dither calculate method is used to sum
	--combined behaviors
	prWallAvoidance             = 0.5,
	prObstacleAvoidance         = 0.5,
	prSeparation                = 0.2,
	prAlignment                 = 0.3,
	prCohesion                  = 0.6,
	prWander                    = 0.8,
	prSeek                      = 0.8,
	prFlee                      = 0.6,
	prEvade                     = 1.0,
	prHide                      = 0.8,
	prArrive                    = 0.5,


	--the radius of the constraining circle for the wander behavior
	WanderRad    = 1.2,
	--distance the wander circle is projected in front of the agent
	WanderDist   = 2.0,
	--the maximum amount of displacement along the circle each frame
	WanderJitterPerSec = 80.0,

	--used in path following
	WaypointSeekDist   = 5,

	SeparationDist = 20,
	EvadDist = 5,
}

return ParamInfo
