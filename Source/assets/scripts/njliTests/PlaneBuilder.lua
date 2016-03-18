
--Test the functions for PlaneBuilder
local Test = {}

local function PlaneBuilder_calculateSerializeBufferSize_()
--//! [PlaneBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: PlaneBuilder:calculateSerializeBufferSize()
--//! [PlaneBuilder_calculateSerializeBufferSize_]

end

local function PlaneBuilder_serialize_btSerializer()
--//! [PlaneBuilder_serialize_btSerializer]
-- @TODO: Test: PlaneBuilder:serialize(btSerializer)
--//! [PlaneBuilder_serialize_btSerializer]

end

local function PlaneBuilder_getObjectType_()
--//! [PlaneBuilder_getObjectType_]
-- @TODO: Test: PlaneBuilder:getObjectType()
--//! [PlaneBuilder_getObjectType_]

end

local function PlaneBuilder_getClassName_()
--//! [PlaneBuilder_getClassName_]
-- @TODO: Test: PlaneBuilder:getClassName()
--//! [PlaneBuilder_getClassName_]

end

local function PlaneBuilder_getType_()
--//! [PlaneBuilder_getType_]
-- @TODO: Test: PlaneBuilder:getType()
--//! [PlaneBuilder_getType_]

end

local function PlaneBuilder_createArray_size()
--//! [PlaneBuilder_createArray_size]
-- @TODO:Test: NJLI.PlaneBuilder.createArray(size)
--//! [PlaneBuilder_createArray_size]

end

local function PlaneBuilder_destroyArray_array()
--//! [PlaneBuilder_destroyArray_array]
-- @TODO:Test: NJLI.PlaneBuilder.destroyArray(array)
--//! [PlaneBuilder_destroyArray_array]

end

local function PlaneBuilder_create_()
--//! [PlaneBuilder_create_]
-- @TODO:Test: NJLI.PlaneBuilder.create()
--//! [PlaneBuilder_create_]

end

local function PlaneBuilder_clone_object()
--//! [PlaneBuilder_clone_object]
-- @TODO:Test: NJLI.PlaneBuilder.clone(object)
--//! [PlaneBuilder_clone_object]

end

local function PlaneBuilder_destroy_object()
--//! [PlaneBuilder_destroy_object]
-- @TODO:Test: NJLI.PlaneBuilder.destroy(object)
--//! [PlaneBuilder_destroy_object]

end

local function PlaneBuilder_load_object_L_stack_index()
--//! [PlaneBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.PlaneBuilder.load(object, L, stack_index)
--//! [PlaneBuilder_load_object_L_stack_index]

end

local function PlaneBuilder_type_()
--//! [PlaneBuilder_type_]
-- @TODO:Test: NJLI.PlaneBuilder.type()
--//! [PlaneBuilder_type_]

end


function Test:testAll()
	PlaneBuilder_calculateSerializeBufferSize_()
	PlaneBuilder_serialize_btSerializer()
	PlaneBuilder_getObjectType_()
	PlaneBuilder_getClassName_()
	PlaneBuilder_getType_()
	PlaneBuilder_createArray_size()
	PlaneBuilder_destroyArray_array()
	PlaneBuilder_create_()
	PlaneBuilder_clone_object()
	PlaneBuilder_destroy_object()
	PlaneBuilder_load_object_L_stack_index()
	PlaneBuilder_type_()
end

return Test