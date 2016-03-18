
--Test the functions for ParticleEmitterBuilder
local Test = {}

local function ParticleEmitterBuilder_calculateSerializeBufferSize_()
--//! [ParticleEmitterBuilder_calculateSerializeBufferSize_]
-- @TODO: Test: ParticleEmitterBuilder:calculateSerializeBufferSize()
--//! [ParticleEmitterBuilder_calculateSerializeBufferSize_]

end

local function ParticleEmitterBuilder_serialize_dataBuffer_btSerializer()
--//! [ParticleEmitterBuilder_serialize_dataBuffer_btSerializer]
-- @TODO: Test: ParticleEmitterBuilder:serialize(dataBuffer, btSerializer)
--//! [ParticleEmitterBuilder_serialize_dataBuffer_btSerializer]

end

local function ParticleEmitterBuilder_getObjectType_()
--//! [ParticleEmitterBuilder_getObjectType_]
-- @TODO: Test: ParticleEmitterBuilder:getObjectType()
--//! [ParticleEmitterBuilder_getObjectType_]

end

local function ParticleEmitterBuilder_getClassName_()
--//! [ParticleEmitterBuilder_getClassName_]
-- @TODO: Test: ParticleEmitterBuilder:getClassName()
--//! [ParticleEmitterBuilder_getClassName_]

end

local function ParticleEmitterBuilder_getType_()
--//! [ParticleEmitterBuilder_getType_]
-- @TODO: Test: ParticleEmitterBuilder:getType()
--//! [ParticleEmitterBuilder_getType_]

end

local function ParticleEmitterBuilder_createArray_size()
--//! [ParticleEmitterBuilder_createArray_size]
-- @TODO:Test: NJLI.ParticleEmitterBuilder.createArray(size)
--//! [ParticleEmitterBuilder_createArray_size]

end

local function ParticleEmitterBuilder_destroyArray_array()
--//! [ParticleEmitterBuilder_destroyArray_array]
-- @TODO:Test: NJLI.ParticleEmitterBuilder.destroyArray(array)
--//! [ParticleEmitterBuilder_destroyArray_array]

end

local function ParticleEmitterBuilder_create_()
--//! [ParticleEmitterBuilder_create_]
-- @TODO:Test: NJLI.ParticleEmitterBuilder.create()
--//! [ParticleEmitterBuilder_create_]

end

local function ParticleEmitterBuilder_clone_object()
--//! [ParticleEmitterBuilder_clone_object]
-- @TODO:Test: NJLI.ParticleEmitterBuilder.clone(object)
--//! [ParticleEmitterBuilder_clone_object]

end

local function ParticleEmitterBuilder_destroy_object()
--//! [ParticleEmitterBuilder_destroy_object]
-- @TODO:Test: NJLI.ParticleEmitterBuilder.destroy(object)
--//! [ParticleEmitterBuilder_destroy_object]

end

local function ParticleEmitterBuilder_load_object_L_stack_index()
--//! [ParticleEmitterBuilder_load_object_L_stack_index]
-- @TODO:Test: NJLI.ParticleEmitterBuilder.load(object, L, stack_index)
--//! [ParticleEmitterBuilder_load_object_L_stack_index]

end

local function ParticleEmitterBuilder_type_()
--//! [ParticleEmitterBuilder_type_]
-- @TODO:Test: NJLI.ParticleEmitterBuilder.type()
--//! [ParticleEmitterBuilder_type_]

end


function Test:testAll()
	ParticleEmitterBuilder_calculateSerializeBufferSize_()
	ParticleEmitterBuilder_serialize_dataBuffer_btSerializer()
	ParticleEmitterBuilder_getObjectType_()
	ParticleEmitterBuilder_getClassName_()
	ParticleEmitterBuilder_getType_()
	ParticleEmitterBuilder_createArray_size()
	ParticleEmitterBuilder_destroyArray_array()
	ParticleEmitterBuilder_create_()
	ParticleEmitterBuilder_clone_object()
	ParticleEmitterBuilder_destroy_object()
	ParticleEmitterBuilder_load_object_L_stack_index()
	ParticleEmitterBuilder_type_()
end

return Test