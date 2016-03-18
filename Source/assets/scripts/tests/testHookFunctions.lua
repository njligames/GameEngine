
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
    print('MyWorldStateTouchDown ' , touch1 , ' ' , touch2 , ' ' , touch3 , ' ' , touch4 , ' ' , touch5)
end

function MyWorldStateTouchUp(touch1, touch2, touch3, touch4, touch5)
    print('MyWorldStateTouchUp ' , touch1 , ' ' , touch2 , ' ' , touch3 , ' ' , touch4 , ' ' , touch5)
end

function MyWorldStateTouchMove(touch1, touch2, touch3, touch4, touch5)
    print('MyWorldStateTouchMove ' , touch1 , ' ' , touch2 , ' ' , touch3 , ' ' , touch4 , ' ' , touch5)
end


function MySceneMySceneStateEnter(scene)
    print('MySceneMySceneStateEnter ' , scene)
end

function MySceneMySceneStateUpdate(scene, timeStep)
    print('MySceneMySceneStateUpdate ' , scene , ' ' , timeStep)
end

function MySceneMySceneStateExit(scene)
    print('MySceneMySceneStateExit ' , scene)
end