local ARRAY_SIZE = 2

function testActionCreateAndDeleteFunctions()
    local tempBuilder = JLI.ActionBuilder.create()
    print(tempBuilder:getClassName() , ' (Builder): ', tempBuilder)

    local temp = JLI.Action.create()
    print(temp:getClassName() , ' (Create): ', temp)

    local temp2 = JLI.Action.clone(temp)
    print(temp2:getClassName() , ' (Clone): ', temp2)

    local temp3 = JLI.Action.create(tempBuilder)
    print(temp3:getClassName() , ' (Create-builder): ', temp3)

    local temp4 = JLI.Action.copy(temp)
    print(temp4:getClassName() , ' (Copy): ', temp4)

    local tempArray = JLI.Action.createArray(ARRAY_SIZE)
    for i=0,(ARRAY_SIZE-1) do
        local tempArrayValue = JLI.ActionArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName() , ' (CreateArray): ', tempArrayValue)
        JLI.Action.destroy(tempArrayValue)
    end
    JLI.Action.destroyArray(tempArray)

    print(temp4:getClassName() , ' (Destroy-4): ', temp4)
    JLI.Action.destroy(temp4)

    print(temp3:getClassName() , ' (Destroy-3): ', temp3)
    JLI.Action.destroy(temp3)

    print(temp2:getClassName() , ' (Destroy-2): ', temp2)
    JLI.Action.destroy(temp2)

    print(temp:getClassName() , ' (Destroy): ', temp)
    JLI.Action.destroy(temp)

    print(tempBuilder:getClassName() , ' (Destroy-builder): ', tempBuilder)
    JLI.ActionBuilder.destroy(tempBuilder)
end

function testButtonHUDCreateAndDeleteFunctions()
    local tempBuilder = JLI.ButtonHUDBuilder.create()
    print(tempBuilder:getClassName() , ' (Builder): ', tempBuilder)

    local temp = JLI.ButtonHUD.create()
    print(temp:getClassName() , ' (Create): ', temp)

    local temp2 = JLI.ButtonHUD.clone(temp)
    print(temp2:getClassName() , ' (Clone): ', temp2)

    local temp3 = JLI.ButtonHUD.create(tempBuilder)
    print(temp3:getClassName() , ' (Create-builder): ', temp3)

    local temp4 = JLI.ButtonHUD.copy(temp)
    print(temp4:getClassName() , ' (Copy): ', temp4)

    local tempArray = JLI.ButtonHUD.createArray(ARRAY_SIZE)
    for i=0,(ARRAY_SIZE-1) do
        local tempArrayValue = JLI.ButtonHUDArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName() , ' (CreateArray): ', tempArrayValue)
        JLI.ButtonHUD.destroy(tempArrayValue)
    end
    JLI.ButtonHUD.destroyArray(tempArray)

    print(temp4:getClassName() , ' (Destroy-4): ', temp4)
    JLI.ButtonHUD.destroy(temp4)

    print(temp3:getClassName() , ' (Destroy-3): ', temp3)
    JLI.ButtonHUD.destroy(temp3)

    print(temp2:getClassName() , ' (Destroy-2): ', temp2)
    JLI.ButtonHUD.destroy(temp2)

    print(temp:getClassName() , ' (Destroy): ', temp)
    JLI.ButtonHUD.destroy(temp)

    print(tempBuilder:getClassName() , ' (Destroy-builder): ', tempBuilder)
    JLI.ButtonHUDBuilder.destroy(tempBuilder)
end

function testCameraCreateAndDeleteFunctions()
	local tempBuilder = JLI.CameraBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.Camera.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.Camera.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.Camera.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.Camera.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.Camera.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.CameraArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.Camera.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.Camera.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.Camera.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.Camera.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.Camera.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.Camera.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.CameraBuilder.destroy(tempBuilder)
end

function testCheckboxHUDCreateAndDeleteFunctions()
    local tempBuilder = JLI.CheckboxHUDBuilder.create()
    print(tempBuilder:getClassName() , ' (Builder): ', tempBuilder)

    local temp = JLI.CheckboxHUD.create()
    print(temp:getClassName() , ' (Create): ', temp)

    local temp2 = JLI.CheckboxHUD.clone(temp)
    print(temp2:getClassName() , ' (Clone): ', temp2)

    local temp3 = JLI.CheckboxHUD.create(tempBuilder)
    print(temp3:getClassName() , ' (Create-builder): ', temp3)

    local temp4 = JLI.CheckboxHUD.copy(temp)
    print(temp4:getClassName() , ' (Copy): ', temp4)

    local tempArray = JLI.CheckboxHUD.createArray(ARRAY_SIZE)
    for i=0,(ARRAY_SIZE-1) do
        local tempArrayValue = JLI.CheckboxHUDArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName() , ' (CreateArray): ', tempArrayValue)
        JLI.CheckboxHUD.destroy(tempArrayValue)
    end
    JLI.CheckboxHUD.destroyArray(tempArray)

    print(temp4:getClassName() , ' (Destroy-4): ', temp4)
    JLI.CheckboxHUD.destroy(temp4)

    print(temp3:getClassName() , ' (Destroy-3): ', temp3)
    JLI.CheckboxHUD.destroy(temp3)

    print(temp2:getClassName() , ' (Destroy-2): ', temp2)
    JLI.CheckboxHUD.destroy(temp2)

    print(temp:getClassName() , ' (Destroy): ', temp)
    JLI.CheckboxHUD.destroy(temp)

    print(tempBuilder:getClassName() , ' (Destroy-builder): ', tempBuilder)
    JLI.CheckboxHUDBuilder.destroy(tempBuilder)
end

function testClockCreateAndDeleteFunctions()
	local tempBuilder = JLI.ClockBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.Clock.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.Clock.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.Clock.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.Clock.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.Clock.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.ClockArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.Clock.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.Clock.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.Clock.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.Clock.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.Clock.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.Clock.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.ClockBuilder.destroy(tempBuilder)
end

function testCollisionResponseCreateAndDeleteFunctions()
	local tempBuilder = JLI.CollisionResponseBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.CollisionResponse.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.CollisionResponse.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.CollisionResponse.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.CollisionResponse.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.CollisionResponse.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.CollisionResponseArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.CollisionResponse.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.CollisionResponse.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.CollisionResponse.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.CollisionResponse.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.CollisionResponse.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.CollisionResponse.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.CollisionResponseBuilder.destroy(tempBuilder)
end

function testCubeCreateAndDeleteFunctions()
	local tempBuilder = JLI.CubeBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.Cube.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.Cube.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.Cube.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.Cube.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.Cube.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.CubeArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.Cube.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.Cube.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.Cube.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.Cube.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.Cube.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.Cube.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.CubeBuilder.destroy(tempBuilder)
end

function testDropdownHUDCreateAndDeleteFunctions()
    local tempBuilder = JLI.DropdownHUDBuilder.create()
    print(tempBuilder:getClassName() , ' (Builder): ', tempBuilder)

    local temp = JLI.DropdownHUD.create()
    print(temp:getClassName() , ' (Create): ', temp)

    local temp2 = JLI.DropdownHUD.clone(temp)
    print(temp2:getClassName() , ' (Clone): ', temp2)

    local temp3 = JLI.DropdownHUD.create(tempBuilder)
    print(temp3:getClassName() , ' (Create-builder): ', temp3)

    local temp4 = JLI.DropdownHUD.copy(temp)
    print(temp4:getClassName() , ' (Copy): ', temp4)

    local tempArray = JLI.DropdownHUD.createArray(ARRAY_SIZE)
    for i=0,(ARRAY_SIZE-1) do
        local tempArrayValue = JLI.DropdownHUDArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName() , ' (CreateArray): ', tempArrayValue)
        JLI.DropdownHUD.destroy(tempArrayValue)
    end
    JLI.DropdownHUD.destroyArray(tempArray)

    print(temp4:getClassName() , ' (Destroy-4): ', temp4)
    JLI.DropdownHUD.destroy(temp4)

    print(temp3:getClassName() , ' (Destroy-3): ', temp3)
    JLI.DropdownHUD.destroy(temp3)

    print(temp2:getClassName() , ' (Destroy-2): ', temp2)
    JLI.DropdownHUD.destroy(temp2)

    print(temp:getClassName() , ' (Destroy): ', temp)
    JLI.DropdownHUD.destroy(temp)

    print(tempBuilder:getClassName() , ' (Destroy-builder): ', tempBuilder)
    JLI.DropdownHUDBuilder.destroy(tempBuilder)
end

function testFontCreateAndDeleteFunctions()
	local tempBuilder = JLI.FontBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.Font.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.Font.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.Font.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.Font.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.Font.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.FontArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.Font.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.Font.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.Font.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.Font.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.Font.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.Font.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.FontBuilder.destroy(tempBuilder)
end

function testImageCreateAndDeleteFunctions()
	local tempBuilder = JLI.ImageBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.Image.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.Image.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.Image.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.Image.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.Image.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.ImageArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.Image.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.Image.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.Image.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.Image.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.Image.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.Image.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.ImageBuilder.destroy(tempBuilder)
end

function testJsonCreateAndDeleteFunctions()
	local tempBuilder = JLI.JsonBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.Json.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.Json.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.Json.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.Json.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.Json.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.JsonArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.Json.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.Json.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.Json.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.Json.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.Json.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.Json.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.JsonBuilder.destroy(tempBuilder)
end

function testLabelHUDCreateAndDeleteFunctions()
    local tempBuilder = JLI.LabelHUDBuilder.create()
    print(tempBuilder:getClassName() , ' (Builder): ', tempBuilder)

    local temp = JLI.LabelHUD.create()
    print(temp:getClassName() , ' (Create): ', temp)

    local temp2 = JLI.LabelHUD.clone(temp)
    print(temp2:getClassName() , ' (Clone): ', temp2)

    local temp3 = JLI.LabelHUD.create(tempBuilder)
    print(temp3:getClassName() , ' (Create-builder): ', temp3)

    local temp4 = JLI.LabelHUD.copy(temp)
    print(temp4:getClassName() , ' (Copy): ', temp4)

    local tempArray = JLI.LabelHUD.createArray(ARRAY_SIZE)
    for i=0,(ARRAY_SIZE-1) do
        local tempArrayValue = JLI.LabelHUDArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName() , ' (CreateArray): ', tempArrayValue)
        JLI.LabelHUD.destroy(tempArrayValue)
    end
    JLI.LabelHUD.destroyArray(tempArray)

    print(temp4:getClassName() , ' (Destroy-4): ', temp4)
    JLI.LabelHUD.destroy(temp4)

    print(temp3:getClassName() , ' (Destroy-3): ', temp3)
    JLI.LabelHUD.destroy(temp3)

    print(temp2:getClassName() , ' (Destroy-2): ', temp2)
    JLI.LabelHUD.destroy(temp2)

    print(temp:getClassName() , ' (Destroy): ', temp)
    JLI.LabelHUD.destroy(temp)

    print(tempBuilder:getClassName() , ' (Destroy-builder): ', tempBuilder)
    JLI.LabelHUDBuilder.destroy(tempBuilder)
end

function testLightCreateAndDeleteFunctions()
	local tempBuilder = JLI.LightBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.Light.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.Light.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.Light.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.Light.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.Light.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.LightArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.Light.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.Light.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.Light.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.Light.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.Light.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.Light.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.LightBuilder.destroy(tempBuilder)
end

function testLevelOfDetailCreateAndDeleteFunctions()
	local tempBuilder = JLI.LevelOfDetailBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.LevelOfDetail.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.LevelOfDetail.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.LevelOfDetail.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.LevelOfDetail.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.LevelOfDetail.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.LevelOfDetailArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.LevelOfDetail.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.LevelOfDetail.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.LevelOfDetail.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.LevelOfDetail.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.LevelOfDetail.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.LevelOfDetail.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.LevelOfDetailBuilder.destroy(tempBuilder)
end

function testLuaCreateAndDeleteFunctions()
	local tempBuilder = JLI.LuaBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.Lua.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.Lua.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.Lua.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.Lua.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.Lua.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.LuaArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.Lua.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.Lua.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.Lua.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.Lua.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.Lua.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.Lua.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.LuaBuilder.destroy(tempBuilder)
end

function testMaterialCreateAndDeleteFunctions()
	local tempBuilder = JLI.MaterialBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.Material.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.Material.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.Material.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.Material.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.Material.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.MaterialArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.Material.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.Material.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.Material.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.Material.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.Material.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.Material.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.MaterialBuilder.destroy(tempBuilder)
end

function testMaterialPropertyCreateAndDeleteFunctions()
	local tempBuilder = JLI.MaterialPropertyBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.MaterialProperty.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.MaterialProperty.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.MaterialProperty.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.MaterialProperty.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.MaterialProperty.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.MaterialPropertyArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.MaterialProperty.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.MaterialProperty.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.MaterialProperty.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.MaterialProperty.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.MaterialProperty.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.MaterialProperty.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.MaterialPropertyBuilder.destroy(tempBuilder)
end

function testNodeCreateAndDeleteFunctions()
	local tempBuilder = JLI.NodeBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.Node.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.Node.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.Node.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.Node.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.Node.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.NodeArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.Node.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.Node.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.Node.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.Node.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.Node.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.Node.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.NodeBuilder.destroy(tempBuilder)
end

function testNodeStateCreateAndDeleteFunctions()
	local tempBuilder = JLI.NodeStateBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.NodeState.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.NodeState.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.NodeState.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.NodeState.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.NodeState.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.NodeStateArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.NodeState.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.NodeState.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.NodeState.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.NodeState.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.NodeState.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.NodeState.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.NodeStateBuilder.destroy(tempBuilder)
end

function testNodeStateMachineCreateAndDeleteFunctions()
	local tempBuilder = JLI.NodeStateMachineBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.NodeStateMachine.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.NodeStateMachine.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.NodeStateMachine.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.NodeStateMachine.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.NodeStateMachine.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.NodeStateMachineArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.NodeStateMachine.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.NodeStateMachine.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.NodeStateMachine.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.NodeStateMachine.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.NodeStateMachine.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.NodeStateMachine.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.NodeStateMachineBuilder.destroy(tempBuilder)
end

function testParticleEmitterCreateAndDeleteFunctions()
	local tempBuilder = JLI.ParticleEmitterBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.ParticleEmitter.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.ParticleEmitter.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.ParticleEmitter.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.ParticleEmitter.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.ParticleEmitter.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.ParticleEmitterArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.ParticleEmitter.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.ParticleEmitter.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.ParticleEmitter.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.ParticleEmitter.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.ParticleEmitter.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.ParticleEmitter.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.ParticleEmitterBuilder.destroy(tempBuilder)
end

function testPhysicsBodyGhostCreateAndDeleteFunctions()
	local tempBuilder = JLI.PhysicsBodyGhostBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.PhysicsBodyGhost.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.PhysicsBodyGhost.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.PhysicsBodyGhost.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.PhysicsBodyGhost.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.PhysicsBodyGhost.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.PhysicsBodyGhostArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.PhysicsBodyGhost.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.PhysicsBodyGhost.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.PhysicsBodyGhost.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.PhysicsBodyGhost.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.PhysicsBodyGhost.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.PhysicsBodyGhost.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.PhysicsBodyGhostBuilder.destroy(tempBuilder)
end

function testPhysicsBodyRigidCreateAndDeleteFunctions()
	local tempBuilder = JLI.PhysicsBodyRigidBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.PhysicsBodyRigid.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.PhysicsBodyRigid.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.PhysicsBodyRigid.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.PhysicsBodyRigid.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.PhysicsBodyRigid.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.PhysicsBodyRigidArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.PhysicsBodyRigid.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.PhysicsBodyRigid.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.PhysicsBodyRigid.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.PhysicsBodyRigid.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.PhysicsBodyRigid.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.PhysicsBodyRigid.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.PhysicsBodyRigidBuilder.destroy(tempBuilder)
end

function testPhysicsBodySoftCreateAndDeleteFunctions()
	local tempBuilder = JLI.PhysicsBodySoftBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.PhysicsBodySoft.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.PhysicsBodySoft.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.PhysicsBodySoft.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.PhysicsBodySoft.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.PhysicsBodySoft.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.PhysicsBodySoftArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.PhysicsBodySoft.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.PhysicsBodySoft.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.PhysicsBodySoft.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.PhysicsBodySoft.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.PhysicsBodySoft.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.PhysicsBodySoft.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.PhysicsBodySoftBuilder.destroy(tempBuilder)
end

function testPhysicsContactCreateAndDeleteFunctions()
	local tempBuilder = JLI.PhysicsContactBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.PhysicsContact.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.PhysicsContact.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.PhysicsContact.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.PhysicsContact.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.PhysicsContact.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.PhysicsContactArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.PhysicsContact.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.PhysicsContact.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.PhysicsContact.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.PhysicsContact.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.PhysicsContact.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.PhysicsContact.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.PhysicsContactBuilder.destroy(tempBuilder)
end

function testPhysicsCloseContactCreateAndDeleteFunctions()
	local tempBuilder = JLI.PhysicsCloseContactBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.PhysicsCloseContact.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.PhysicsCloseContact.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.PhysicsCloseContact.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.PhysicsCloseContact.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.PhysicsCloseContact.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.PhysicsCloseContactArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.PhysicsCloseContact.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.PhysicsCloseContact.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.PhysicsCloseContact.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.PhysicsCloseContact.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.PhysicsCloseContact.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.PhysicsCloseContact.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.PhysicsCloseContactBuilder.destroy(tempBuilder)
end

function testPhysicsFieldCreateAndDeleteFunctions()
	local tempBuilder = JLI.PhysicsFieldBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.PhysicsField.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.PhysicsField.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.PhysicsField.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.PhysicsField.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.PhysicsField.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.PhysicsFieldArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.PhysicsField.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.PhysicsField.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.PhysicsField.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.PhysicsField.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.PhysicsField.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.PhysicsField.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.PhysicsFieldBuilder.destroy(tempBuilder)
end

function testPhysicsRayContactCreateAndDeleteFunctions()
	local tempBuilder = JLI.PhysicsRayContactBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.PhysicsRayContact.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.PhysicsRayContact.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.PhysicsRayContact.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.PhysicsRayContact.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.PhysicsRayContact.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.PhysicsRayContactArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.PhysicsRayContact.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.PhysicsRayContact.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.PhysicsRayContact.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.PhysicsRayContact.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.PhysicsRayContact.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.PhysicsRayContact.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.PhysicsRayContactBuilder.destroy(tempBuilder)
end

function testPhysicsShapeBoxCreateAndDeleteFunctions()
	local tempBuilder = JLI.PhysicsShapeBoxBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.PhysicsShapeBox.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.PhysicsShapeBox.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.PhysicsShapeBox.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.PhysicsShapeBox.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.PhysicsShapeBox.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.PhysicsShapeBoxArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.PhysicsShapeBox.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.PhysicsShapeBox.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.PhysicsShapeBox.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.PhysicsShapeBox.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.PhysicsShapeBox.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.PhysicsShapeBox.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.PhysicsShapeBoxBuilder.destroy(tempBuilder)
end

function testPhysicsWorldCreateAndDeleteFunctions()
	local tempBuilder = JLI.PhysicsWorldBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.PhysicsWorld.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.PhysicsWorld.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.PhysicsWorld.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.PhysicsWorld.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.PhysicsWorld.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.PhysicsWorldArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.PhysicsWorld.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.PhysicsWorld.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.PhysicsWorld.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.PhysicsWorld.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.PhysicsWorld.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.PhysicsWorld.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.PhysicsWorldBuilder.destroy(tempBuilder)
end

function testPlaneCreateAndDeleteFunctions()
	local tempBuilder = JLI.PlaneBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.Plane.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.Plane.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.Plane.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.Plane.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.Plane.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.PlaneArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.Plane.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.Plane.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.Plane.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.Plane.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.Plane.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.Plane.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.PlaneBuilder.destroy(tempBuilder)
end

function testSceneCreateAndDeleteFunctions()
	local tempBuilder = JLI.SceneBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.Scene.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.Scene.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.Scene.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.Scene.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.Scene.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.SceneArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.Scene.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.Scene.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.Scene.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.Scene.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.Scene.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.Scene.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.SceneBuilder.destroy(tempBuilder)
end

function testSceneStateCreateAndDeleteFunctions()
	local tempBuilder = JLI.SceneStateBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.SceneState.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.SceneState.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.SceneState.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.SceneState.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.SceneState.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.SceneStateArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.SceneState.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.SceneState.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.SceneState.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.SceneState.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.SceneState.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.SceneState.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.SceneStateBuilder.destroy(tempBuilder)
end

function testSceneStateMachineCreateAndDeleteFunctions()
	local tempBuilder = JLI.SceneStateMachineBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.SceneStateMachine.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.SceneStateMachine.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.SceneStateMachine.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.SceneStateMachine.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.SceneStateMachine.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.SceneStateMachineArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.SceneStateMachine.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.SceneStateMachine.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.SceneStateMachine.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.SceneStateMachine.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.SceneStateMachine.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.SceneStateMachine.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.SceneStateMachineBuilder.destroy(tempBuilder)
end

function testShaderProgramCreateAndDeleteFunctions()
	local tempBuilder = JLI.ShaderProgramBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.ShaderProgram.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.ShaderProgram.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.ShaderProgram.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.ShaderProgram.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.ShaderProgram.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.ShaderProgramArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.ShaderProgram.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.ShaderProgram.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.ShaderProgram.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.ShaderProgram.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.ShaderProgram.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.ShaderProgram.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.ShaderProgramBuilder.destroy(tempBuilder)
end

function testSkinnerCreateAndDeleteFunctions()
	local tempBuilder = JLI.SkinnerBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.Skinner.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.Skinner.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.Skinner.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.Skinner.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.Skinner.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.SkinnerArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.Skinner.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.Skinner.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.Skinner.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.Skinner.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.Skinner.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.Skinner.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.SkinnerBuilder.destroy(tempBuilder)
end

function testSliderHUDCreateAndDeleteFunctions()
    local tempBuilder = JLI.SliderHUDBuilder.create()
    print(tempBuilder:getClassName() , ' (Builder): ', tempBuilder)

    local temp = JLI.SliderHUD.create()
    print(temp:getClassName() , ' (Create): ', temp)

    local temp2 = JLI.SliderHUD.clone(temp)
    print(temp2:getClassName() , ' (Clone): ', temp2)

    local temp3 = JLI.SliderHUD.create(tempBuilder)
    print(temp3:getClassName() , ' (Create-builder): ', temp3)

    local temp4 = JLI.SliderHUD.copy(temp)
    print(temp4:getClassName() , ' (Copy): ', temp4)

    local tempArray = JLI.SliderHUD.createArray(ARRAY_SIZE)
    for i=0,(ARRAY_SIZE-1) do
        local tempArrayValue = JLI.SliderHUDArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName() , ' (CreateArray): ', tempArrayValue)
        JLI.SliderHUD.destroy(tempArrayValue)
    end
    JLI.SliderHUD.destroyArray(tempArray)

    print(temp4:getClassName() , ' (Destroy-4): ', temp4)
    JLI.SliderHUD.destroy(temp4)

    print(temp3:getClassName() , ' (Destroy-3): ', temp3)
    JLI.SliderHUD.destroy(temp3)

    print(temp2:getClassName() , ' (Destroy-2): ', temp2)
    JLI.SliderHUD.destroy(temp2)

    print(temp:getClassName() , ' (Destroy): ', temp)
    JLI.SliderHUD.destroy(temp)

    print(tempBuilder:getClassName() , ' (Destroy-builder): ', tempBuilder)
    JLI.SliderHUDBuilder.destroy(tempBuilder)
end

function testSoundCreateAndDeleteFunctions()
	local tempBuilder = JLI.SoundBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.Sound.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.Sound.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.Sound.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.Sound.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.Sound.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.SoundArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.Sound.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.Sound.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.Sound.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.Sound.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.Sound.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.Sound.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.SoundBuilder.destroy(tempBuilder)
end

function testSprite2DCreateAndDeleteFunctions()
	local tempBuilder = JLI.Sprite2DBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.Sprite2D.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.Sprite2D.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.Sprite2D.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.Sprite2D.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.Sprite2D.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.Sprite2DArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.Sprite2D.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.Sprite2D.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.Sprite2D.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.Sprite2D.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.Sprite2D.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.Sprite2D.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.Sprite2DBuilder.destroy(tempBuilder)
end

function testSpriteFrameAtlasCreateAndDeleteFunctions()
	local tempBuilder = JLI.SpriteFrameAtlasBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.SpriteFrameAtlas.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.SpriteFrameAtlas.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.SpriteFrameAtlas.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.SpriteFrameAtlas.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.SpriteFrameAtlas.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.SpriteFrameAtlasArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.SpriteFrameAtlas.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.SpriteFrameAtlas.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.SpriteFrameAtlas.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.SpriteFrameAtlas.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.SpriteFrameAtlas.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.SpriteFrameAtlas.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.SpriteFrameAtlasBuilder.destroy(tempBuilder)
end

function testStopWatchCreateAndDeleteFunctions()
	local tempBuilder = JLI.StopWatchBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.StopWatch.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.StopWatch.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.StopWatch.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.StopWatch.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.StopWatch.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.StopWatchArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.StopWatch.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.StopWatch.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.StopWatch.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.StopWatch.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.StopWatch.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.StopWatch.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.StopWatchBuilder.destroy(tempBuilder)
end

function testTextboxHUDCreateAndDeleteFunctions()
    local tempBuilder = JLI.TextboxHUDBuilder.create()
    print(tempBuilder:getClassName() , ' (Builder): ', tempBuilder)

    local temp = JLI.TextboxHUD.create()
    print(temp:getClassName() , ' (Create): ', temp)

    local temp2 = JLI.TextboxHUD.clone(temp)
    print(temp2:getClassName() , ' (Clone): ', temp2)

    local temp3 = JLI.TextboxHUD.create(tempBuilder)
    print(temp3:getClassName() , ' (Create-builder): ', temp3)

    local temp4 = JLI.TextboxHUD.copy(temp)
    print(temp4:getClassName() , ' (Copy): ', temp4)

    local tempArray = JLI.TextboxHUD.createArray(ARRAY_SIZE)
    for i=0,(ARRAY_SIZE-1) do
        local tempArrayValue = JLI.TextboxHUDArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName() , ' (CreateArray): ', tempArrayValue)
        JLI.TextboxHUD.destroy(tempArrayValue)
    end
    JLI.TextboxHUD.destroyArray(tempArray)

    print(temp4:getClassName() , ' (Destroy-4): ', temp4)
    JLI.TextboxHUD.destroy(temp4)

    print(temp3:getClassName() , ' (Destroy-3): ', temp3)
    JLI.TextboxHUD.destroy(temp3)

    print(temp2:getClassName() , ' (Destroy-2): ', temp2)
    JLI.TextboxHUD.destroy(temp2)

    print(temp:getClassName() , ' (Destroy): ', temp)
    JLI.TextboxHUD.destroy(temp)

    print(tempBuilder:getClassName() , ' (Destroy-builder): ', tempBuilder)
    JLI.TextboxHUDBuilder.destroy(tempBuilder)
end

function testTimerCreateAndDeleteFunctions()
	local tempBuilder = JLI.TimerBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.Timer.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.Timer.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.Timer.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.Timer.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.Timer.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.TimerArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.Timer.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.Timer.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.Timer.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.Timer.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.Timer.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.Timer.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.TimerBuilder.destroy(tempBuilder)
end

function testWorldStateCreateAndDeleteFunctions()
	local tempBuilder = JLI.WorldStateBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.WorldState.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.WorldState.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.WorldState.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.WorldState.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.WorldState.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.WorldStateArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.WorldState.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.WorldState.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.WorldState.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.WorldState.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.WorldState.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.WorldState.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.WorldStateBuilder.destroy(tempBuilder)
end

function testWorldStateMachineCreateAndDeleteFunctions()
	local tempBuilder = JLI.WorldStateMachineBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.WorldStateMachine.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.WorldStateMachine.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.WorldStateMachine.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.WorldStateMachine.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.WorldStateMachine.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.WorldStateMachineArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.WorldStateMachine.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.WorldStateMachine.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.WorldStateMachine.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.WorldStateMachine.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.WorldStateMachine.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.WorldStateMachine.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.WorldStateMachineBuilder.destroy(tempBuilder)
end

function testXmlCreateAndDeleteFunctions()
	local tempBuilder = JLI.XmlBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = JLI.Xml.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = JLI.Xml.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = JLI.Xml.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = JLI.Xml.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = JLI.Xml.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = JLI.XmlArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        JLI.Xml.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	JLI.Xml.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	JLI.Xml.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	JLI.Xml.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	JLI.Xml.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	JLI.Xml.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	JLI.XmlBuilder.destroy(tempBuilder)
end




























































function testWorldFunctions()
end

function testWorldFactoryFunctions()
end

function testWorldLuaVirtualMachineFunctions()
end

function testWorldResourceLoaderFunctions()
end

function testWorldSocketFunctions()
end

function testWorldHUDFunctions()
end

function testWorldInputFunctions()
end

function testWorldClockFunctions()
end

function testDeviceTouchFunctions()
end

function testActionFunctions()
end

function testActionBuilderFunctions()
end

function testButtonHUDFunctions()
    print('Testing functions for the ButtonHUD class')
end

function testButtonHUDBuilderFunctions()
    print('Testing functions for the ButtonHUDBuilder class')
end

function testCameraFunctions()
end

function testCameraBuilderFunctions()
end

function testCheckboxHUDFunctions()
    print('Testing functions for the CheckboxHUD class')
end

function testCheckboxHUDBuilderFunctions()
    print('Testing functions for the CheckboxHUDBuilder class')
end

function testClockFunctions()
end

function testClockBuilderFunctions()
end

function testCollisionResponseFunctions()
end

function testCollisionResponseBuilderFunctions()
end

function testCubeFunctions()
end

function testCubeBuilderFunctions()
end

function testDropdownHUDFunctions()
    print('Testing functions for the DropdownHUD class')
end

function testDropdownHUDBuilderFunctions()
    print('Testing functions for the DropdownHUDBuilder class')
end

function testFontFunctions()
end

function testFontBuilderFunctions()
end

function testImageFunctions()
end

function testImageBuilderFunctions()
end

function testJsonFunctions()
end

function testJsonBuilderFunctions()
end

function testLabelHUDFunctions()
    print('Testing functions for the LabelHUD class')
end

function testLabelHUDBuilderFunctions()
    print('Testing functions for the LabelHUDBuilder class')
end

function testLightFunctions()
end

function testLightBuilderFunctions()
end

function testLevelOfDetailFunctions()
end

function testLevelOfDetailBuilderFunctions()
end

function testLuaFunctions()
end

function testLuaBuilderFunctions()
end

function testMaterialFunctions()
end

function testMaterialBuilderFunctions()
end

function testMaterialPropertyFunctions()
end

function testMaterialPropertyBuilderFunctions()
end

function testNodeFunctions()
end

function testNodeBuilderFunctions()
end

function testNodeStateFunctions()
end

function testNodeStateBuilderFunctions()
end

function testNodeStateMachineFunctions()
end

function testNodeStateMachineBuilderFunctions()
end

function testParticleEmitterFunctions()
end

function testParticleEmitterBuilderFunctions()
end

function testPhysicsBodyFunctions()
end

function testPhysicsBodyGhostFunctions()
end

function testPhysicsBodyGhostBuilderFunctions()
end

function testPhysicsBodyRigidFunctions()
end

function testPhysicsBodyRigidBuilderFunctions()
end

function testPhysicsBodySoftFunctions()
end

function testPhysicsBodySoftBuilderFunctions()
end

function testPhysicsContactFunctions()
end

function testPhysicsContactBuilderFunctions()
end

function testPhysicsCloseContactFunctions()
end

function testPhysicsCloseContactBuilderFunctions()
end

function testPhysicsFieldFunctions()
end

function testPhysicsFieldBuilderFunctions()
end

function testPhysicsRayContactFunctions()
end

function testPhysicsRayContactBuilderFunctions()
end

function testPhysicsShapeBoxFunctions()
    local tempBuilder = JLI.PhysicsShapeBoxBuilder.create()
    print(tempBuilder:getClassName() , ' (Builder): ', tempBuilder)

    local temp = JLI.PhysicsShapeBox.create()
    print(temp:getClassName() , ' (Create): ', temp)

    local temp2 = JLI.PhysicsShapeBox.clone(temp)
    print(temp2:getClassName() , ' (Clone): ', temp2)

    local temp3 = JLI.PhysicsShapeBox.create(tempBuilder)
    print(temp3:getClassName() , ' (Create-builder): ' , temp3)

    local temp4 = JLI.PhysicsShapeBox.copy(temp)
    print(temp4:getClassName() , ' (Copy): ', temp4)


    temp:setHalfExtends(JLI.btVector3(11,122,133))
    print('getHalfExtentsWithMargin ' , temp:getHalfExtentsWithMargin())
    print('getHalfExtentsWithoutMargin ' , temp:getHalfExtentsWithoutMargin())

    temp:setHalfExtends(JLI.btVector3(9999,9999,9999))
    print('getHalfExtentsWithMargin ' , temp:getHalfExtentsWithMargin())
    print('getHalfExtentsWithoutMargin ' , temp:getHalfExtentsWithoutMargin())

    local identity = JLI.btTransform(JLI.btTransform.getIdentity())
    aabMin, aabMax = temp:getAabb(identity)
    print(aabMin , ' - ' , aabMax)

    print('getNumPlanes ' , temp:getNumPlanes())
    print('getNumVertices ' , temp:getNumVertices())
    print('getNumEdges ' , temp:getNumEdges())


    for i=0, temp:getNumEdges() - 1 do
    print('Edge (' , i , ') ' , temp:getEdge(i))
    end

    for i=0, temp:getNumVertices()- 1 do
    print('Vertex (' , i , ') ' , temp:getVertex(i))
    end

    for i=0, temp:getNumPlanes() - 1 do
    print('Plane (' , i , ') ' , temp:getPlane(i))
    end

    for i=0, temp:getNumPlanes() - 1 do
    print('PlaneEquation (' , i , ') ' , temp:getPlaneEquation(i))
    end

    --localGetSupportingVertex()
    --localGetSupportingVertexWithoutMargin()
    --batchedUnitVectorGetSupportingVertexWithoutMargin()
    --setMargin()
    --setLocalScaling()
    --calculateLocalInertia()

    JLI.PhysicsShapeBox.destroy(temp)
    JLI.PhysicsShapeBox.destroy(temp2)
    JLI.PhysicsShapeBox.destroy(temp3)
    JLI.PhysicsShapeBox.destroy(temp4)
    JLI.PhysicsShapeBoxBuilder.destroy(tempBuilder)
end

function testPhysicsShapeBoxBuilderFunctions()
end

function testPhysicsWorldFunctions()
end

function testPhysicsWorldBuilderFunctions()
end

function testPlaneFunctions()
end

function testPlaneBuilderFunctions()
end

function testSceneFunctions()
end

function testSceneBuilderFunctions()
end

function testSceneStateFunctions()
end

function testSceneStateBuilderFunctions()
end

function testSceneStateMachineFunctions()
end

function testSceneStateMachineBuilderFunctions()
end

function testShaderProgramFunctions()
end

function testShaderProgramBuilderFunctions()
end

function testSkinnerFunctions()
end

function testSkinnerBuilderFunctions()
end

function testSliderHUDFunctions()
    print('Testing functions for the SliderHUD class')
end

function testSliderHUDBuilderFunctions()
    print('Testing functions for the SliderHUDBuilder class')
end

function testSoundFunctions()
end

function testSoundBuilderFunctions()
end

function testSprite2DFunctions()
end

function testSprite2DBuilderFunctions()
end

function testSpriteFrameAtlasFunctions()
end

function testSpriteFrameAtlasBuilderFunctions()
end

function testStopWatchFunctions()
end

function testStopWatchBuilderFunctions()
end

function testTextboxHUDFunctions()
    print('Testing functions for the TextboxHUD class')
end

function testTextboxHUDBuilderFunctions()
    print('Testing functions for the TextboxHUDBuilder class')
end

function testTimerFunctions()
end

function testTimerBuilderFunctions()
end

function testWorldStateFunctions()
end

function testWorldStateBuilderFunctions()
end

function testWorldStateMachineFunctions()
end

function testWorldStateMachineBuilderFunctions()
end

function testXmlFunctions()
end

function testXmlBuilderFunctions()
end





































function testPhysicsShapeBoxFunctions()

end


















function testRenderCategories()
    print('none ' , JLI.JLI_BIT_CATEGORY_NONE)
    print('1 ' , JLI.JLI_BIT_CATEGORY_1)
    print('2 ' , JLI.JLI_BIT_CATEGORY_2)
    print('3 ' , JLI.JLI_BIT_CATEGORY_3)
    print('4 ' , JLI.JLI_BIT_CATEGORY_4)
    print('5 ' , JLI.JLI_BIT_CATEGORY_5)
    print('6 ' , JLI.JLI_BIT_CATEGORY_6)
    print('7 ' , JLI.JLI_BIT_CATEGORY_7)
    print('8 ' , JLI.JLI_BIT_CATEGORY_8)
    print('9 ' , JLI.JLI_BIT_CATEGORY_9)
    print('10 ' , JLI.JLI_BIT_CATEGORY_10)
    print('11 ' , JLI.JLI_BIT_CATEGORY_11)
    print('12 ' , JLI.JLI_BIT_CATEGORY_12)
    print('13 ' , JLI.JLI_BIT_CATEGORY_13)
    print('14 ' , JLI.JLI_BIT_CATEGORY_14)
    print('15 ' , JLI.JLI_BIT_CATEGORY_15)
    print('16 ' , JLI.JLI_BIT_CATEGORY_16)
    print('17 ' , JLI.JLI_BIT_CATEGORY_17)
    print('18 ' , JLI.JLI_BIT_CATEGORY_18)
    print('19 ' , JLI.JLI_BIT_CATEGORY_19)
    print('20 ' , JLI.JLI_BIT_CATEGORY_20)
    print('21 ' , JLI.JLI_BIT_CATEGORY_21)
    print('22 ' , JLI.JLI_BIT_CATEGORY_22)
    print('23 ' , JLI.JLI_BIT_CATEGORY_23)
    print('24 ' , JLI.JLI_BIT_CATEGORY_24)
    print('25 ' , JLI.JLI_BIT_CATEGORY_25)
    print('26 ' , JLI.JLI_BIT_CATEGORY_26)
    print('27 ' , JLI.JLI_BIT_CATEGORY_27)
    print('28 ' , JLI.JLI_BIT_CATEGORY_28)
    print('29 ' , JLI.JLI_BIT_CATEGORY_29)
    print('30 ' , JLI.JLI_BIT_CATEGORY_30)
    print('31 ' , JLI.JLI_BIT_CATEGORY_31)
    print('ALL ' , JLI.JLI_BIT_CATEGORY_ALL)
end

function callTestFunctions()
    testActionCreateAndDeleteFunctions()
    testButtonHUDCreateAndDeleteFunctions()
    testCameraCreateAndDeleteFunctions()
    testCheckboxHUDCreateAndDeleteFunctions()
    testClockCreateAndDeleteFunctions()
    testCollisionResponseCreateAndDeleteFunctions()
    testCubeCreateAndDeleteFunctions()
    testDropdownHUDCreateAndDeleteFunctions()
    testFontCreateAndDeleteFunctions()
    testImageCreateAndDeleteFunctions()
    testJsonCreateAndDeleteFunctions()
    testLabelHUDCreateAndDeleteFunctions()
    testLightCreateAndDeleteFunctions()
    testLevelOfDetailCreateAndDeleteFunctions()
    testLuaCreateAndDeleteFunctions()
    testMaterialCreateAndDeleteFunctions()
    testMaterialPropertyCreateAndDeleteFunctions()
    testNodeCreateAndDeleteFunctions()
    testNodeStateCreateAndDeleteFunctions()
    testNodeStateMachineCreateAndDeleteFunctions()
    testParticleEmitterCreateAndDeleteFunctions()
    testPhysicsBodyGhostCreateAndDeleteFunctions()
    testPhysicsBodyRigidCreateAndDeleteFunctions()
    testPhysicsBodySoftCreateAndDeleteFunctions()
    testPhysicsContactCreateAndDeleteFunctions()
    testPhysicsCloseContactCreateAndDeleteFunctions()
    testPhysicsFieldCreateAndDeleteFunctions()
    testPhysicsRayContactCreateAndDeleteFunctions()
    testPhysicsShapeBoxCreateAndDeleteFunctions()
    testPhysicsWorldCreateAndDeleteFunctions()
    testPlaneCreateAndDeleteFunctions()
    testSceneCreateAndDeleteFunctions()
    testSceneStateCreateAndDeleteFunctions()
    testSceneStateMachineCreateAndDeleteFunctions()
    testShaderProgramCreateAndDeleteFunctions()
    testSkinnerCreateAndDeleteFunctions()
    testSliderHUDCreateAndDeleteFunctions()
    testSoundCreateAndDeleteFunctions()
    testSprite2DCreateAndDeleteFunctions()
    testSpriteFrameAtlasCreateAndDeleteFunctions()
    testStopWatchCreateAndDeleteFunctions()
    testTextboxHUDCreateAndDeleteFunctions()
    testTimerCreateAndDeleteFunctions()
    testWorldStateCreateAndDeleteFunctions()
    testWorldStateMachineCreateAndDeleteFunctions()
    testXmlCreateAndDeleteFunctions()




	
	
	
	
	
	






















    testWorldFunctions()
    testWorldFactoryFunctions()
    testWorldLuaVirtualMachineFunctions()
    testWorldResourceLoaderFunctions()
    testWorldSocketFunctions()
    testWorldHUDFunctions()
    testWorldInputFunctions()
    testWorldClockFunctions()
    testDeviceTouchFunctions()
    testActionFunctions()
    testActionBuilderFunctions()
    testButtonHUDFunctions()
    testButtonHUDBuilderFunctions()
    testCameraFunctions()
    testCameraBuilderFunctions()
    testCheckboxHUDFunctions()
    testCheckboxHUDBuilderFunctions()
    testClockFunctions()
    testClockBuilderFunctions()
    testCollisionResponseFunctions()
    testCollisionResponseBuilderFunctions()
    testCubeFunctions()
    testCubeBuilderFunctions()
    testDropdownHUDFunctions()
    testDropdownHUDBuilderFunctions()
    testFontFunctions()
    testFontBuilderFunctions()
    testImageFunctions()
    testImageBuilderFunctions()
    testJsonFunctions()
    testJsonBuilderFunctions()
    testLabelHUDFunctions()
    testLabelHUDBuilderFunctions()
    testLightFunctions()
    testLightBuilderFunctions()
    testLevelOfDetailFunctions()
    testLevelOfDetailBuilderFunctions()
    testLuaFunctions()
    testLuaBuilderFunctions()
    testMaterialFunctions()
    testMaterialBuilderFunctions()
    testMaterialPropertyFunctions()
    testMaterialPropertyBuilderFunctions()
    testNodeFunctions()
    testNodeBuilderFunctions()
    testNodeStateFunctions()
    testNodeStateBuilderFunctions()
    testNodeStateMachineFunctions()
    testNodeStateMachineBuilderFunctions()
    testParticleEmitterFunctions()
    testParticleEmitterBuilderFunctions()
    testPhysicsBodyFunctions()
    testPhysicsBodyGhostFunctions()
    testPhysicsBodyGhostBuilderFunctions()
    testPhysicsBodyRigidFunctions()
    testPhysicsBodyRigidBuilderFunctions()
    testPhysicsBodySoftFunctions()
    testPhysicsBodySoftBuilderFunctions()
    testPhysicsContactFunctions()
    testPhysicsContactBuilderFunctions()
    testPhysicsCloseContactFunctions()
    testPhysicsCloseContactBuilderFunctions()
    testPhysicsFieldFunctions()
    testPhysicsFieldBuilderFunctions()
    testPhysicsRayContactFunctions()
    testPhysicsRayContactBuilderFunctions()
    testPhysicsShapeBoxFunctions()
    testPhysicsShapeBoxBuilderFunctions()
    testPhysicsWorldFunctions()
    testPhysicsWorldBuilderFunctions()
    testPlaneFunctions()
    testPlaneBuilderFunctions()
    testSceneFunctions()
    testSceneBuilderFunctions()
    testSceneStateFunctions()
    testSceneStateBuilderFunctions()
    testSceneStateMachineFunctions()
    testSceneStateMachineBuilderFunctions()
    testShaderProgramFunctions()
    testShaderProgramBuilderFunctions()
    testSkinnerFunctions()
    testSkinnerBuilderFunctions()
    testSliderHUDFunctions()
    testSliderHUDBuilderFunctions()
    testSoundFunctions()
    testSoundBuilderFunctions()
    testSprite2DFunctions()
    testSprite2DBuilderFunctions()
    testSpriteFrameAtlasFunctions()
    testSpriteFrameAtlasBuilderFunctions()
    testStopWatchFunctions()
    testStopWatchBuilderFunctions()
    testTextboxHUDFunctions()
    testTextboxHUDBuilderFunctions()
    testTimerFunctions()
    testTimerBuilderFunctions()
    testWorldStateFunctions()
    testWorldStateBuilderFunctions()
    testWorldStateMachineFunctions()
    testWorldStateMachineBuilderFunctions()
    testXmlFunctions()
    testXmlBuilderFunctions()
    
end


callTestFunctions()








