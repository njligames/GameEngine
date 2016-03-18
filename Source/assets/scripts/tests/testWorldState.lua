
local myWorldState = JLI.WorldState.create()

function MyWorldStateEnter()
    print('MyWorldStateEnter')
end

function MyWorldStateUpdate(timeStep)
    print('MyWorldStateUpdate ' , timeStep)
end

function MyWorldStateExit()
    print('MyWorldStateExit')
end

function MyWorldStateTouchDown(touch1, touch2, touch3, touch4, touch5)
    JLI.World.getInstance():pushState(myWorldState)
end

function MyWorldStateTouchUp(touch1, touch2, touch3, touch4, touch5)

end

function MyWorldStateTouchMove(touch1, touch2, touch3, touch4, touch5)

end






function MySceneMySceneStateEnter(scene)
end

function MySceneMySceneStateUpdate(scene, timeStep)
end

function MySceneMySceneStateExit(scene)
end