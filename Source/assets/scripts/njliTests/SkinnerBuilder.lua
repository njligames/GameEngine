
--Test the functions for SkinnerBuilder
local Test = {}

local function SkinnerBuilder_calculateSerializeBufferSize_()
--//! [SkinnerBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: SkinnerBuilder:calculateSerializeBufferSize()
--//! [SkinnerBuilder_calculateSerializeBufferSize_]

end

local function SkinnerBuilder_serialize_btSerializer()
--//! [SkinnerBuilder_serialize_btSerializer]
-- @TODO: Test: SkinnerBuilder:serialize(btSerializer)
--//! [SkinnerBuilder_serialize_btSerializer]

end

local function SkinnerBuilder_getObjectType_()
--//! [SkinnerBuilder_getObjectType_]
-- @TODO: Test: SkinnerBuilder:getObjectType()
--//! [SkinnerBuilder_getObjectType_]

end

local function SkinnerBuilder_getClassName_()
--//! [SkinnerBuilder_getClassName_]
-- @TODO: Test: SkinnerBuilder:getClassName()
--//! [SkinnerBuilder_getClassName_]

end

local function SkinnerBuilder_getType_()
--//! [SkinnerBuilder_getType_]
-- @TODO: Test: SkinnerBuilder:getType()
--//! [SkinnerBuilder_getType_]

end

local function SkinnerBuilder_createArray_size()
--//! [SkinnerBuilder_createArray_size]
-- @TODO:Test: NJLI.SkinnerBuilder.createArray(size)
--//! [SkinnerBuilder_createArray_size]

end

local function SkinnerBuilder_destroyArray_array()
--//! [SkinnerBuilder_destroyArray_array]
-- @TODO:Test: NJLI.SkinnerBuilder.destroyArray(array)
--//! [SkinnerBuilder_destroyArray_array]

end

local function SkinnerBuilder_create_()
--//! [SkinnerBuilder_create_]
-- @TODO:Test: NJLI.SkinnerBuilder.create()
--//! [SkinnerBuilder_create_]

end

local function SkinnerBuilder_clone_object()
--//! [SkinnerBuilder_clone_object]
-- @TODO:Test: NJLI.SkinnerBuilder.clone(object)
--//! [SkinnerBuilder_clone_object]

end

local function SkinnerBuilder_destroy_object()
--//! [SkinnerBuilder_destroy_object]
-- @TODO:Test: NJLI.SkinnerBuilder.destroy(object)
--//! [SkinnerBuilder_destroy_object]

end

local function SkinnerBuilder_load_object_L_stack_index()
--//! [SkinnerBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.SkinnerBuilder.load(object, L, stack_index)
--//! [SkinnerBuilder_load_object_L_stack_index]

end

local function SkinnerBuilder_type_()
--//! [SkinnerBuilder_type_]
-- @TODO:Test: NJLI.SkinnerBuilder.type()
--//! [SkinnerBuilder_type_]

end


function Test:testAll()
	SkinnerBuilder_calculateSerializeBufferSize_()
	SkinnerBuilder_serialize_btSerializer()
	SkinnerBuilder_getObjectType_()
	SkinnerBuilder_getClassName_()
	SkinnerBuilder_getType_()
	SkinnerBuilder_createArray_size()
	SkinnerBuilder_destroyArray_array()
	SkinnerBuilder_create_()
	SkinnerBuilder_clone_object()
	SkinnerBuilder_destroy_object()
	SkinnerBuilder_load_object_L_stack_index()
	SkinnerBuilder_type_()
end

return Test