
--Test the functions for ShaderProgram
local Test = {}

local function ShaderProgram_calculateSerializeBufferSize_()
--//! [ShaderProgram_calculateSerializeBufferSize_]
-- @TODO: Test: ShaderProgram:calculateSerializeBufferSize()
--//! [ShaderProgram_calculateSerializeBufferSize_]

end

local function ShaderProgram_serialize_btSerializer()
--//! [ShaderProgram_serialize_btSerializer]
-- @TODO: Test: ShaderProgram:serialize(btSerializer)
--//! [ShaderProgram_serialize_btSerializer]

end

local function ShaderProgram_getClassName_()
--//! [ShaderProgram_getClassName_]
-- @TODO: Test: ShaderProgram:getClassName()
--//! [ShaderProgram_getClassName_]

end

local function ShaderProgram_getType_()
--//! [ShaderProgram_getType_]
-- @TODO: Test: ShaderProgram:getType()
--//! [ShaderProgram_getType_]

end

local function ShaderProgram_saveSource_()
--//! [ShaderProgram_saveSource_]
-- @TODO: Test: ShaderProgram:saveSource()
--//! [ShaderProgram_saveSource_]

end

local function ShaderProgram_isLinked_()
--//! [ShaderProgram_isLinked_]
-- @TODO: Test: ShaderProgram:isLinked()
--//! [ShaderProgram_isLinked_]

end

local function ShaderProgram_unLoadGPU_()
--//! [ShaderProgram_unLoadGPU_]
-- @TODO: Test: ShaderProgram:unLoadGPU()
--//! [ShaderProgram_unLoadGPU_]

end

local function ShaderProgram_createArray_size()
--//! [ShaderProgram_createArray_size]
-- @TODO:Test: NJLI.ShaderProgram.createArray(size)
--//! [ShaderProgram_createArray_size]

end

local function ShaderProgram_destroyArray_array()
--//! [ShaderProgram_destroyArray_array]
-- @TODO:Test: NJLI.ShaderProgram.destroyArray(array)
--//! [ShaderProgram_destroyArray_array]

end

local function ShaderProgram_create_()
--//! [ShaderProgram_create_]
-- @TODO:Test: NJLI.ShaderProgram.create()
--//! [ShaderProgram_create_]

end

local function ShaderProgram_create_builder()
--//! [ShaderProgram_create_builder]
-- @TODO:Test: NJLI.ShaderProgram.create(builder)
--//! [ShaderProgram_create_builder]

end

local function ShaderProgram_clone_object()
--//! [ShaderProgram_clone_object]
-- @TODO:Test: NJLI.ShaderProgram.clone(object)
--//! [ShaderProgram_clone_object]

end

local function ShaderProgram_copy_object()
--//! [ShaderProgram_copy_object]
-- @TODO:Test: NJLI.ShaderProgram.copy(object)
--//! [ShaderProgram_copy_object]

end

local function ShaderProgram_destroy_object()
--//! [ShaderProgram_destroy_object]
-- @TODO:Test: NJLI.ShaderProgram.destroy(object)
--//! [ShaderProgram_destroy_object]

end

local function ShaderProgram_load_object_L_stack_index()
--//! [ShaderProgram_load_object_L_stack_index]
-- @TODO:Test: NJLI.ShaderProgram.load(object, L, stack_index)
--//! [ShaderProgram_load_object_L_stack_index]

end

local function ShaderProgram_type_()
--//! [ShaderProgram_type_]
-- @TODO:Test: NJLI.ShaderProgram.type()
--//! [ShaderProgram_type_]

end


function Test:testAll()
	ShaderProgram_calculateSerializeBufferSize_()
	ShaderProgram_serialize_btSerializer()
	ShaderProgram_getClassName_()
	ShaderProgram_getType_()
	ShaderProgram_saveSource_()
	ShaderProgram_isLinked_()
	ShaderProgram_unLoadGPU_()
	ShaderProgram_createArray_size()
	ShaderProgram_destroyArray_array()
	ShaderProgram_create_()
	ShaderProgram_create_builder()
	ShaderProgram_clone_object()
	ShaderProgram_copy_object()
	ShaderProgram_destroy_object()
	ShaderProgram_load_object_L_stack_index()
	ShaderProgram_type_()
end

return Test