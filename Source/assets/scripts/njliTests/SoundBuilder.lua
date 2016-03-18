
--Test the functions for SoundBuilder
local Test = {}

local function SoundBuilder_calculateSerializeBufferSize_()
--//! [SoundBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: SoundBuilder:calculateSerializeBufferSize()
--//! [SoundBuilder_calculateSerializeBufferSize_]

end

local function SoundBuilder_serialize_btSerializer()
--//! [SoundBuilder_serialize_btSerializer]
-- @TODO: Test: SoundBuilder:serialize(btSerializer)
--//! [SoundBuilder_serialize_btSerializer]

end

local function SoundBuilder_getObjectType_()
--//! [SoundBuilder_getObjectType_]
-- @TODO: Test: SoundBuilder:getObjectType()
--//! [SoundBuilder_getObjectType_]

end

local function SoundBuilder_getClassName_()
--//! [SoundBuilder_getClassName_]
-- @TODO: Test: SoundBuilder:getClassName()
--//! [SoundBuilder_getClassName_]

end

local function SoundBuilder_getType_()
--//! [SoundBuilder_getType_]
-- @TODO: Test: SoundBuilder:getType()
--//! [SoundBuilder_getType_]

end

local function SoundBuilder_createArray_size()
--//! [SoundBuilder_createArray_size]
-- @TODO:Test: NJLI.SoundBuilder.createArray(size)
--//! [SoundBuilder_createArray_size]

end

local function SoundBuilder_destroyArray_array()
--//! [SoundBuilder_destroyArray_array]
-- @TODO:Test: NJLI.SoundBuilder.destroyArray(array)
--//! [SoundBuilder_destroyArray_array]

end

local function SoundBuilder_create_()
--//! [SoundBuilder_create_]
-- @TODO:Test: NJLI.SoundBuilder.create()
--//! [SoundBuilder_create_]

end

local function SoundBuilder_clone_object()
--//! [SoundBuilder_clone_object]
-- @TODO:Test: NJLI.SoundBuilder.clone(object)
--//! [SoundBuilder_clone_object]

end

local function SoundBuilder_destroy_object()
--//! [SoundBuilder_destroy_object]
-- @TODO:Test: NJLI.SoundBuilder.destroy(object)
--//! [SoundBuilder_destroy_object]

end

local function SoundBuilder_load_object_L_stack_index()
--//! [SoundBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.SoundBuilder.load(object, L, stack_index)
--//! [SoundBuilder_load_object_L_stack_index]

end

local function SoundBuilder_type_()
--//! [SoundBuilder_type_]
-- @TODO:Test: NJLI.SoundBuilder.type()
--//! [SoundBuilder_type_]

end


function Test:testAll()
	SoundBuilder_calculateSerializeBufferSize_()
	SoundBuilder_serialize_btSerializer()
	SoundBuilder_getObjectType_()
	SoundBuilder_getClassName_()
	SoundBuilder_getType_()
	SoundBuilder_createArray_size()
	SoundBuilder_destroyArray_array()
	SoundBuilder_create_()
	SoundBuilder_clone_object()
	SoundBuilder_destroy_object()
	SoundBuilder_load_object_L_stack_index()
	SoundBuilder_type_()
end

return Test