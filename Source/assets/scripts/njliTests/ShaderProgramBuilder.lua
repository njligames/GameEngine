
--Test the functions for ShaderProgramBuilder
local Test = {}

local function ShaderProgramBuilder_calculateSerializeBufferSize_()
--//! [ShaderProgramBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: ShaderProgramBuilder:calculateSerializeBufferSize()
--//! [ShaderProgramBuilder_calculateSerializeBufferSize_]

end

local function ShaderProgramBuilder_serialize_btSerializer()
--//! [ShaderProgramBuilder_serialize_btSerializer]
-- @TODO: Test: ShaderProgramBuilder:serialize(btSerializer)
--//! [ShaderProgramBuilder_serialize_btSerializer]

end

local function ShaderProgramBuilder_getObjectType_()
--//! [ShaderProgramBuilder_getObjectType_]
-- @TODO: Test: ShaderProgramBuilder:getObjectType()
--//! [ShaderProgramBuilder_getObjectType_]

end

local function ShaderProgramBuilder_getClassName_()
--//! [ShaderProgramBuilder_getClassName_]
-- @TODO: Test: ShaderProgramBuilder:getClassName()
--//! [ShaderProgramBuilder_getClassName_]

end

local function ShaderProgramBuilder_getType_()
--//! [ShaderProgramBuilder_getType_]
-- @TODO: Test: ShaderProgramBuilder:getType()
--//! [ShaderProgramBuilder_getType_]

end

local function ShaderProgramBuilder_createArray_size()
--//! [ShaderProgramBuilder_createArray_size]
-- @TODO:Test: NJLI.ShaderProgramBuilder.createArray(size)
--//! [ShaderProgramBuilder_createArray_size]

end

local function ShaderProgramBuilder_destroyArray_array()
--//! [ShaderProgramBuilder_destroyArray_array]
-- @TODO:Test: NJLI.ShaderProgramBuilder.destroyArray(array)
--//! [ShaderProgramBuilder_destroyArray_array]

end

local function ShaderProgramBuilder_create_()
--//! [ShaderProgramBuilder_create_]
-- @TODO:Test: NJLI.ShaderProgramBuilder.create()
--//! [ShaderProgramBuilder_create_]

end

local function ShaderProgramBuilder_clone_object()
--//! [ShaderProgramBuilder_clone_object]
-- @TODO:Test: NJLI.ShaderProgramBuilder.clone(object)
--//! [ShaderProgramBuilder_clone_object]

end

local function ShaderProgramBuilder_destroy_object()
--//! [ShaderProgramBuilder_destroy_object]
-- @TODO:Test: NJLI.ShaderProgramBuilder.destroy(object)
--//! [ShaderProgramBuilder_destroy_object]

end

local function ShaderProgramBuilder_load_object_L_stack_index()
--//! [ShaderProgramBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.ShaderProgramBuilder.load(object, L, stack_index)
--//! [ShaderProgramBuilder_load_object_L_stack_index]

end

local function ShaderProgramBuilder_type_()
--//! [ShaderProgramBuilder_type_]
-- @TODO:Test: NJLI.ShaderProgramBuilder.type()
--//! [ShaderProgramBuilder_type_]

end


function Test:testAll()
	ShaderProgramBuilder_calculateSerializeBufferSize_()
	ShaderProgramBuilder_serialize_btSerializer()
	ShaderProgramBuilder_getObjectType_()
	ShaderProgramBuilder_getClassName_()
	ShaderProgramBuilder_getType_()
	ShaderProgramBuilder_createArray_size()
	ShaderProgramBuilder_destroyArray_array()
	ShaderProgramBuilder_create_()
	ShaderProgramBuilder_clone_object()
	ShaderProgramBuilder_destroy_object()
	ShaderProgramBuilder_load_object_L_stack_index()
	ShaderProgramBuilder_type_()
end

return Test