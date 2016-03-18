
--Test the functions for LabelHUD
local Test = {}

local function LabelHUD_calculateSerializeBufferSize_()
--//! [LabelHUD_calculateSerializeBufferSize_]
-- @TODO: Test: LabelHUD:calculateSerializeBufferSize()
--//! [LabelHUD_calculateSerializeBufferSize_]

end

local function LabelHUD_serialize_dataBuffer_btSerializer()
--//! [LabelHUD_serialize_dataBuffer_btSerializer]
-- @TODO: Test: LabelHUD:serialize(dataBuffer, btSerializer)
--//! [LabelHUD_serialize_dataBuffer_btSerializer]

end

local function LabelHUD_getClassName_()
--//! [LabelHUD_getClassName_]
-- @TODO: Test: LabelHUD:getClassName()
--//! [LabelHUD_getClassName_]

end

local function LabelHUD_getType_()
--//! [LabelHUD_getType_]
-- @TODO: Test: LabelHUD:getType()
--//! [LabelHUD_getType_]

end

local function LabelHUD_setFontSize_size()
--//! [LabelHUD_setFontSize_size]
-- @TODO: Test: LabelHUD:setFontSize(size)
--//! [LabelHUD_setFontSize_size]

end

local function LabelHUD_getFontSize_()
--//! [LabelHUD_getFontSize_]
-- @TODO: Test: LabelHUD:getFontSize()
--//! [LabelHUD_getFontSize_]

end

local function LabelHUD_setFontFace_fontFace()
--//! [LabelHUD_setFontFace_fontFace]
-- @TODO: Test: LabelHUD:setFontFace(fontFace)
--//! [LabelHUD_setFontFace_fontFace]

end

local function LabelHUD_getFontFace_()
--//! [LabelHUD_getFontFace_]
-- @TODO: Test: LabelHUD:getFontFace()
--//! [LabelHUD_getFontFace_]

end

local function LabelHUD_setFillColor_color()
--//! [LabelHUD_setFillColor_color]
-- @TODO: Test: LabelHUD:setFillColor(color)
--//! [LabelHUD_setFillColor_color]

end

local function LabelHUD_getFillColor_()
--//! [LabelHUD_getFillColor_]
-- @TODO: Test: LabelHUD:getFillColor()
--//! [LabelHUD_getFillColor_]

end

local function LabelHUD_setAlign_align()
--//! [LabelHUD_setAlign_align]
-- @TODO: Test: LabelHUD:setAlign(align)
--//! [LabelHUD_setAlign_align]

end

local function LabelHUD_getAlign_()
--//! [LabelHUD_getAlign_]
-- @TODO: Test: LabelHUD:getAlign()
--//! [LabelHUD_getAlign_]

end

local function LabelHUD_setPosition_pos()
--//! [LabelHUD_setPosition_pos]
-- @TODO: Test: LabelHUD:setPosition(pos)
--//! [LabelHUD_setPosition_pos]

end

local function LabelHUD_getPosition_()
--//! [LabelHUD_getPosition_]
-- @TODO: Test: LabelHUD:getPosition()
--//! [LabelHUD_getPosition_]

end

local function LabelHUD_setText_text()
--//! [LabelHUD_setText_text]
-- @TODO: Test: LabelHUD:setText(text)
--//! [LabelHUD_setText_text]

end

local function LabelHUD_getText_()
--//! [LabelHUD_getText_]
-- @TODO: Test: LabelHUD:getText()
--//! [LabelHUD_getText_]

end

local function LabelHUD_createArray_size()
--//! [LabelHUD_createArray_size]
-- @TODO:Test: NJLI.LabelHUD.createArray(size)
--//! [LabelHUD_createArray_size]

end

local function LabelHUD_destroyArray_array()
--//! [LabelHUD_destroyArray_array]
-- @TODO:Test: NJLI.LabelHUD.destroyArray(array)
--//! [LabelHUD_destroyArray_array]

end

local function LabelHUD_create_()
--//! [LabelHUD_create_]
-- @TODO:Test: NJLI.LabelHUD.create()
--//! [LabelHUD_create_]

end

local function LabelHUD_create_builder()
--//! [LabelHUD_create_builder]
-- @TODO:Test: NJLI.LabelHUD.create(builder)
--//! [LabelHUD_create_builder]

end

local function LabelHUD_clone_object()
--//! [LabelHUD_clone_object]
-- @TODO:Test: NJLI.LabelHUD.clone(object)
--//! [LabelHUD_clone_object]

end

local function LabelHUD_copy_object()
--//! [LabelHUD_copy_object]
-- @TODO:Test: NJLI.LabelHUD.copy(object)
--//! [LabelHUD_copy_object]

end

local function LabelHUD_destroy_object()
--//! [LabelHUD_destroy_object]
-- @TODO:Test: NJLI.LabelHUD.destroy(object)
--//! [LabelHUD_destroy_object]

end

local function LabelHUD_load_object_L_stack_index()
--//! [LabelHUD_load_object_L_stack_index]
-- @TODO:Test: NJLI.LabelHUD.load(object, L, stack_index)
--//! [LabelHUD_load_object_L_stack_index]

end

local function LabelHUD_type_()
--//! [LabelHUD_type_]
-- @TODO:Test: NJLI.LabelHUD.type()
--//! [LabelHUD_type_]

end


function Test:testAll()
	LabelHUD_calculateSerializeBufferSize_()
	LabelHUD_serialize_dataBuffer_btSerializer()
	LabelHUD_getClassName_()
	LabelHUD_getType_()
	LabelHUD_setFontSize_size()
	LabelHUD_getFontSize_()
	LabelHUD_setFontFace_fontFace()
	LabelHUD_getFontFace_()
	LabelHUD_setFillColor_color()
	LabelHUD_getFillColor_()
	LabelHUD_setAlign_align()
	LabelHUD_getAlign_()
	LabelHUD_setPosition_pos()
	LabelHUD_getPosition_()
	LabelHUD_setText_text()
	LabelHUD_getText_()
	LabelHUD_createArray_size()
	LabelHUD_destroyArray_array()
	LabelHUD_create_()
	LabelHUD_create_builder()
	LabelHUD_clone_object()
	LabelHUD_copy_object()
	LabelHUD_destroy_object()
	LabelHUD_load_object_L_stack_index()
	LabelHUD_type_()
end

return Test