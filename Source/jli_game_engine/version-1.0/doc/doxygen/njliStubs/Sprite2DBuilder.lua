
--Test the functions for Sprite2DBuilder
local Test = {}

local function Sprite2DBuilder_calculateSerializeBufferSize_()
--//! [Sprite2DBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: Sprite2DBuilder:calculateSerializeBufferSize()
--//! [Sprite2DBuilder_calculateSerializeBufferSize_]

end

local function Sprite2DBuilder_serialize_btSerializer()
--//! [Sprite2DBuilder_serialize_btSerializer]
-- @TODO: Test: Sprite2DBuilder:serialize(btSerializer)
--//! [Sprite2DBuilder_serialize_btSerializer]

end

local function Sprite2DBuilder_getObjectType_()
--//! [Sprite2DBuilder_getObjectType_]
-- @TODO: Test: Sprite2DBuilder:getObjectType()
--//! [Sprite2DBuilder_getObjectType_]

end

local function Sprite2DBuilder_getClassName_()
--//! [Sprite2DBuilder_getClassName_]
-- @TODO: Test: Sprite2DBuilder:getClassName()
--//! [Sprite2DBuilder_getClassName_]

end

local function Sprite2DBuilder_getType_()
--//! [Sprite2DBuilder_getType_]
-- @TODO: Test: Sprite2DBuilder:getType()
--//! [Sprite2DBuilder_getType_]

end

local function Sprite2DBuilder_createArray_size()
--//! [Sprite2DBuilder_createArray_size]
-- @TODO:Test: NJLI.Sprite2DBuilder.createArray(size)
--//! [Sprite2DBuilder_createArray_size]

end

local function Sprite2DBuilder_destroyArray_array()
--//! [Sprite2DBuilder_destroyArray_array]
-- @TODO:Test: NJLI.Sprite2DBuilder.destroyArray(array)
--//! [Sprite2DBuilder_destroyArray_array]

end

local function Sprite2DBuilder_create_()
--//! [Sprite2DBuilder_create_]
-- @TODO:Test: NJLI.Sprite2DBuilder.create()
--//! [Sprite2DBuilder_create_]

end

local function Sprite2DBuilder_clone_object()
--//! [Sprite2DBuilder_clone_object]
-- @TODO:Test: NJLI.Sprite2DBuilder.clone(object)
--//! [Sprite2DBuilder_clone_object]

end

local function Sprite2DBuilder_destroy_object()
--//! [Sprite2DBuilder_destroy_object]
-- @TODO:Test: NJLI.Sprite2DBuilder.destroy(object)
--//! [Sprite2DBuilder_destroy_object]

end

local function Sprite2DBuilder_load_object_L_stack_index()
--//! [Sprite2DBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.Sprite2DBuilder.load(object, L, stack_index)
--//! [Sprite2DBuilder_load_object_L_stack_index]

end

local function Sprite2DBuilder_type_()
--//! [Sprite2DBuilder_type_]
-- @TODO:Test: NJLI.Sprite2DBuilder.type()
--//! [Sprite2DBuilder_type_]

end


function Test:testAll()
	Sprite2DBuilder_calculateSerializeBufferSize_()
	Sprite2DBuilder_serialize_btSerializer()
	Sprite2DBuilder_getObjectType_()
	Sprite2DBuilder_getClassName_()
	Sprite2DBuilder_getType_()
	Sprite2DBuilder_createArray_size()
	Sprite2DBuilder_destroyArray_array()
	Sprite2DBuilder_create_()
	Sprite2DBuilder_clone_object()
	Sprite2DBuilder_destroy_object()
	Sprite2DBuilder_load_object_L_stack_index()
	Sprite2DBuilder_type_()
end

return Test