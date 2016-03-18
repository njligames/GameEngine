
--Test the functions for XmlBuilder
local Test = {}

local function XmlBuilder_calculateSerializeBufferSize_()
--//! [XmlBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: XmlBuilder:calculateSerializeBufferSize()
--//! [XmlBuilder_calculateSerializeBufferSize_]

end

local function XmlBuilder_serialize_btSerializer()
--//! [XmlBuilder_serialize_btSerializer]
-- @TODO: Test: XmlBuilder:serialize(btSerializer)
--//! [XmlBuilder_serialize_btSerializer]

end

local function XmlBuilder_getObjectType_()
--//! [XmlBuilder_getObjectType_]
-- @TODO: Test: XmlBuilder:getObjectType()
--//! [XmlBuilder_getObjectType_]

end

local function XmlBuilder_getClassName_()
--//! [XmlBuilder_getClassName_]
-- @TODO: Test: XmlBuilder:getClassName()
--//! [XmlBuilder_getClassName_]

end

local function XmlBuilder_getType_()
--//! [XmlBuilder_getType_]
-- @TODO: Test: XmlBuilder:getType()
--//! [XmlBuilder_getType_]

end

local function XmlBuilder_createArray_size()
--//! [XmlBuilder_createArray_size]
-- @TODO:Test: NJLI.XmlBuilder.createArray(size)
--//! [XmlBuilder_createArray_size]

end

local function XmlBuilder_destroyArray_array()
--//! [XmlBuilder_destroyArray_array]
-- @TODO:Test: NJLI.XmlBuilder.destroyArray(array)
--//! [XmlBuilder_destroyArray_array]

end

local function XmlBuilder_create_()
--//! [XmlBuilder_create_]
-- @TODO:Test: NJLI.XmlBuilder.create()
--//! [XmlBuilder_create_]

end

local function XmlBuilder_clone_object()
--//! [XmlBuilder_clone_object]
-- @TODO:Test: NJLI.XmlBuilder.clone(object)
--//! [XmlBuilder_clone_object]

end

local function XmlBuilder_destroy_object()
--//! [XmlBuilder_destroy_object]
-- @TODO:Test: NJLI.XmlBuilder.destroy(object)
--//! [XmlBuilder_destroy_object]

end

local function XmlBuilder_load_object_L_stack_index()
--//! [XmlBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.XmlBuilder.load(object, L, stack_index)
--//! [XmlBuilder_load_object_L_stack_index]

end

local function XmlBuilder_type_()
--//! [XmlBuilder_type_]
-- @TODO:Test: NJLI.XmlBuilder.type()
--//! [XmlBuilder_type_]

end


function Test:testAll()
	XmlBuilder_calculateSerializeBufferSize_()
	XmlBuilder_serialize_btSerializer()
	XmlBuilder_getObjectType_()
	XmlBuilder_getClassName_()
	XmlBuilder_getType_()
	XmlBuilder_createArray_size()
	XmlBuilder_destroyArray_array()
	XmlBuilder_create_()
	XmlBuilder_clone_object()
	XmlBuilder_destroy_object()
	XmlBuilder_load_object_L_stack_index()
	XmlBuilder_type_()
end

return Test