
--Test the functions for Skinner
local Test = {}

local function Skinner_calculateSerializeBufferSize_()
--//! [Skinner_calculateSerializeBufferSize_]
-- @TODO: Test: Skinner:calculateSerializeBufferSize()
--//! [Skinner_calculateSerializeBufferSize_]

end

local function Skinner_serialize_btSerializer()
--//! [Skinner_serialize_btSerializer]
-- @TODO: Test: Skinner:serialize(btSerializer)
--//! [Skinner_serialize_btSerializer]

end

local function Skinner_getClassName_()
--//! [Skinner_getClassName_]
-- @TODO: Test: Skinner:getClassName()
--//! [Skinner_getClassName_]

end

local function Skinner_getType_()
--//! [Skinner_getType_]
-- @TODO: Test: Skinner:getType()
--//! [Skinner_getType_]

end

local function Skinner_createArray_size()
--//! [Skinner_createArray_size]
-- @TODO:Test: NJLI.Skinner.createArray(size)
--//! [Skinner_createArray_size]

end

local function Skinner_destroyArray_array()
--//! [Skinner_destroyArray_array]
-- @TODO:Test: NJLI.Skinner.destroyArray(array)
--//! [Skinner_destroyArray_array]

end

local function Skinner_create_()
--//! [Skinner_create_]
-- @TODO:Test: NJLI.Skinner.create()
--//! [Skinner_create_]

end

local function Skinner_create_builder()
--//! [Skinner_create_builder]
-- @TODO:Test: NJLI.Skinner.create(builder)
--//! [Skinner_create_builder]

end

local function Skinner_clone_object()
--//! [Skinner_clone_object]
-- @TODO:Test: NJLI.Skinner.clone(object)
--//! [Skinner_clone_object]

end

local function Skinner_copy_object()
--//! [Skinner_copy_object]
-- @TODO:Test: NJLI.Skinner.copy(object)
--//! [Skinner_copy_object]

end

local function Skinner_destroy_object()
--//! [Skinner_destroy_object]
-- @TODO:Test: NJLI.Skinner.destroy(object)
--//! [Skinner_destroy_object]

end

local function Skinner_load_object_L_stack_index()
--//! [Skinner_load_object_L_stack_index]
-- @TODO:Test: NJLI.Skinner.load(object, L, stack_index)
--//! [Skinner_load_object_L_stack_index]

end

local function Skinner_type_()
--//! [Skinner_type_]
-- @TODO:Test: NJLI.Skinner.type()
--//! [Skinner_type_]

end


function Test:testAll()
	Skinner_calculateSerializeBufferSize_()
	Skinner_serialize_btSerializer()
	Skinner_getClassName_()
	Skinner_getType_()
	Skinner_createArray_size()
	Skinner_destroyArray_array()
	Skinner_create_()
	Skinner_create_builder()
	Skinner_clone_object()
	Skinner_copy_object()
	Skinner_destroy_object()
	Skinner_load_object_L_stack_index()
	Skinner_type_()
end

return Test