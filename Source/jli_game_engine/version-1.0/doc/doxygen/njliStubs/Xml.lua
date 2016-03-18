
--Test the functions for Xml
local Test = {}

local function Xml_calculateSerializeBufferSize_()
--//! [Xml_calculateSerializeBufferSize_]
-- @TODO: Test: Xml:calculateSerializeBufferSize()
--//! [Xml_calculateSerializeBufferSize_]

end

local function Xml_serialize_btSerializer()
--//! [Xml_serialize_btSerializer]
-- @TODO: Test: Xml:serialize(btSerializer)
--//! [Xml_serialize_btSerializer]

end

local function Xml_getClassName_()
--//! [Xml_getClassName_]
-- @TODO: Test: Xml:getClassName()
--//! [Xml_getClassName_]

end

local function Xml_getType_()
--//! [Xml_getType_]
-- @TODO: Test: Xml:getType()
--//! [Xml_getType_]

end

local function Xml_createArray_size()
--//! [Xml_createArray_size]
-- @TODO:Test: NJLI.Xml.createArray(size)
--//! [Xml_createArray_size]

end

local function Xml_destroyArray_array()
--//! [Xml_destroyArray_array]
-- @TODO:Test: NJLI.Xml.destroyArray(array)
--//! [Xml_destroyArray_array]

end

local function Xml_create_()
--//! [Xml_create_]
-- @TODO:Test: NJLI.Xml.create()
--//! [Xml_create_]

end

local function Xml_create_builder()
--//! [Xml_create_builder]
-- @TODO:Test: NJLI.Xml.create(builder)
--//! [Xml_create_builder]

end

local function Xml_clone_object()
--//! [Xml_clone_object]
-- @TODO:Test: NJLI.Xml.clone(object)
--//! [Xml_clone_object]

end

local function Xml_copy_object()
--//! [Xml_copy_object]
-- @TODO:Test: NJLI.Xml.copy(object)
--//! [Xml_copy_object]

end

local function Xml_destroy_object()
--//! [Xml_destroy_object]
-- @TODO:Test: NJLI.Xml.destroy(object)
--//! [Xml_destroy_object]

end

local function Xml_load_object_L_stack_index()
--//! [Xml_load_object_L_stack_index]
-- @TODO:Test: NJLI.Xml.load(object, L, stack_index)
--//! [Xml_load_object_L_stack_index]

end

local function Xml_type_()
--//! [Xml_type_]
-- @TODO:Test: NJLI.Xml.type()
--//! [Xml_type_]

end


function Test:testAll()
	Xml_calculateSerializeBufferSize_()
	Xml_serialize_btSerializer()
	Xml_getClassName_()
	Xml_getType_()
	Xml_createArray_size()
	Xml_destroyArray_array()
	Xml_create_()
	Xml_create_builder()
	Xml_clone_object()
	Xml_copy_object()
	Xml_destroy_object()
	Xml_load_object_L_stack_index()
	Xml_type_()
end

return Test