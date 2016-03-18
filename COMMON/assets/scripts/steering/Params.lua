









local ParamInfo = {}

ParamInfo =
{
 NumAgents = 300,

	NumObstacles = 7,
	MinObstacleRadius = 10,
	MaxObstacleRadius = 30,



	
	NumCellsX = 7,
	
	NumCellsY = 7,


	
	NumSamplesForSmoothing = 10,


	
	
	SteeringForceTweaker = 200.0,

	SteeringForce = 2.0,
	MaxSpeed = 150.0,
	VehicleMass = 1.0,
	VehicleScale = 3.0,

	
	
	SeparationWeight = 100.0,
	AlignmentWeight = 1.0,
	CohesionWeight = 2.0,
	ObstacleAvoidanceWeight = 10.0,
	WallAvoidanceWeight = 10.0,
	WanderWeight = 1.0,
	SeekWeight = 1.0,
	FleeWeight = 1.0,
	ArriveWeight = 1.0,
	PursuitWeight = 1.0,
	OffsetPursuitWeight = 1.0,
	InterposeWeight = 1.0,
	HideWeight = 1.0,
	EvadeWeight = 200.0,
	FollowPathWeight = 1.0,

	
	
	ViewDistance = 50.0,

	
	MinDetectionBoxLength = 40.0,

	
	WallDetectionFeelerLength = 40.0,

	
	
	
	prWallAvoidance = 0.5,
	prObstacleAvoidance = 0.5,
	prSeparation = 0.2,
	prAlignment = 0.3,
	prCohesion = 0.6,
	prWander = 0.8,
	prSeek = 0.8,
	prFlee = 0.6,
	prEvade = 1.0,
	prHide = 0.8,
	prArrive = 0.5,


	
	WanderRad = 1.2,
	
	WanderDist = 2.0,
	
	WanderJitterPerSec = 80.0,

	
	WaypointSeekDist = 5,

	SeparationDist = 20,
	EvadDist = 5,
}

return ParamInfo
