
--Test the functions for WorldFactory
local Test = {}

local function WorldFactory_has_object()
--//! [WorldFactory_has_object]
-- @TODO: Test: WorldFactory:has(object)
--//! [WorldFactory_has_object]

end

local function WorldFactory_destroyAll_()
--//! [WorldFactory_destroyAll_]
-- @TODO: Test: WorldFactory:destroyAll()
--//! [WorldFactory_destroyAll_]

end

local function WorldFactory_size_()
--//! [WorldFactory_size_]
-- @TODO: Test: WorldFactory:size()
--//! [WorldFactory_size_]

end

local function WorldFactory_numberOfReferences_object()
--//! [WorldFactory_numberOfReferences_object]
-- @TODO: Test: WorldFactory:numberOfReferences(object)
--//! [WorldFactory_numberOfReferences_object]

end

local function WorldFactory_get_u32()
--//! [WorldFactory_get_u32]
-- @TODO: Test: WorldFactory:get(u32)
--//! [WorldFactory_get_u32]

end

local function WorldFactory_getAll_objects()
--//! [WorldFactory_getAll_objects]
-- @TODO: Test: WorldFactory:getAll(objects)
--//! [WorldFactory_getAll_objects]

end

local function WorldFactory_index_object()
--//! [WorldFactory_index_object]
-- @TODO: Test: WorldFactory:index(object)
--//! [WorldFactory_index_object]

end

local function WorldFactory_serialize_serializer()
--//! [WorldFactory_serialize_serializer]
-- @TODO: Test: WorldFactory:serialize(serializer)
--//! [WorldFactory_serialize_serializer]

end

local function WorldFactory_getClassName_()
--//! [WorldFactory_getClassName_]
-- @TODO: Test: WorldFactory:getClassName()
--//! [WorldFactory_getClassName_]

end

local function WorldFactory_getType_()
--//! [WorldFactory_getType_]
-- @TODO: Test: WorldFactory:getType()
--//! [WorldFactory_getType_]

end

local function WorldFactory_isBuilder_u32()
--//! [WorldFactory_isBuilder_u32]
-- @TODO: Test: WorldFactory:isBuilder(u32)
--//! [WorldFactory_isBuilder_u32]

end


function Test:testAll()
	WorldFactory_has_object()
	WorldFactory_destroyAll_()
	WorldFactory_size_()
	WorldFactory_numberOfReferences_object()
	WorldFactory_get_u32()
	WorldFactory_getAll_objects()
	WorldFactory_index_object()
	WorldFactory_serialize_serializer()
	WorldFactory_getClassName_()
	WorldFactory_getType_()
	WorldFactory_isBuilder_u32()
end

return Test