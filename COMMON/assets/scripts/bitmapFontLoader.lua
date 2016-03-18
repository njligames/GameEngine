
local arg={...}








local mymodule = 
{
 material = nil,
 geometry = nil
}










function mymodule.loadFont( fntFile, path)
 local function extract( s, p )
 return string.match( s, p ), string.gsub( s, p, '', 1 )
 end
 local path = path or ""
 local font = { info = {}, spritesheets = {}, sprites = {}, chars = {}, kernings = {} }
 
 local readline = io.lines(njli.ASSET_PATH("fonts/" .. fntFile))
 for line in readline do
 local t = {}; local tag;
 tag, line = extract( line, '^%s*([%a_]+)%s*' )
 while string.len( line ) > 0 do
 local k, v
 k, line = extract( line, '^([%a_]+)=' )
 if not k then
 break
 end
 v, line = extract( line, '^"([^"]*)"%s*' )
 if not v then
 v, line = extract( line, '^([^%s]*)%s*' )
 end
 if not v then
 break
 end
 t[ k ] = v
 end
 if tag == 'info' or tag == 'common' then
 for k, v in pairs( t ) do font.info[ k ] = v end
 elseif tag == 'page' then
 font.spritesheets[ 1 + t.id ] = { file = t.file, frames = {} }
 elseif tag == 'char' then
 t.letter = string.char( t.id )
 font.chars[ t.letter ] = {}
 for k, v in pairs( t ) do font.chars[ t.letter ][ k ] = v end
 if 0 + font.chars[ t.letter ].width > 0 and 0 + font.chars[ t.letter ].height > 0 then
 font.spritesheets[ 1 + t.page ].frames[ #font.spritesheets[ 1 + t.page ].frames + 1 ] = {
 
 textureRect = { x = 0 + t.x, y = 0 + t.y, width = t.width, height = t.height },
 spriteSourceSize = { width = 0 + t.width, height = 0 + t.height },
 spriteColorRect = { x = 0, y = 0, width = -1 + t.width, height = -1 + t.height },
 spriteTrimmed = true
 }
 font.sprites[ t.letter ] = {
 spritesheet = 1 + t.page,
 frame = #font.spritesheets[ 1 + t.page ].frames
 }
 end
 elseif( tag == 'kerning' ) then
 font.kernings[ string.char( t.first ) .. string.char( t.second ) ] = 0 + t.amount
 end
 end
 for k, v in pairs( font.spritesheets ) do
 
 end
 for k, v in pairs( font.sprites ) do
 
 end
 return font
end


local function accessorize( t )
 local mt = getmetatable( t )
 setmetatable( t, {
 __index = function( t, k )
 if rawget( t, 'get_'..k ) then
 return rawget(t, 'get_'..k )( t, k )
 elseif rawget( t, 'raw_'..k ) then
 return rawget( t, 'raw_'..k )
 elseif mt.__index then
 return mt.__index( t, k )
 else
 return nil
 end
 end,
 __newindex = function( t, k, v )
 if rawget( t, 'set_'..k ) then
 rawget( t, 'set_'..k )( t, k, v )
 elseif rawget( t, 'raw_'..k ) then
 rawset( t, 'raw_'..k, v )
 elseif mt.__newindex then
 mt.__newindex( t, k, v )
 else
 rawset( t, 'raw_'..k, v )
 end
 end,
 } )
end


local function removerize( t )
 local old = t.removeSelf
 t.removeSelf = function( o )
 for i = o.numChildren, 1, -1 do o[ i ]:removeSelf() end
 old( o )
 end
end

function mymodule.newString( font, text, material, geometry, shader)

 local function Count_Substring( s1, s2 )
 local magic = "[%^%$%(%)%%%.%[%]%*%+%-%?]"
 local percent = function(s)return "%"..s end
 return select( 2, s1:gsub( s2:gsub(magic,percent), "" ) )
 end

 

 local image = njli.Image.create()

 mymodule.material = material or mymodule.material
 mymodule.geometry = geometry or mymodule.geometry
 mymodule.shader = shader or mymodule.shader

 local imagePath = "fonts/" .. font.spritesheets[1].file

 njli.World.getInstance():getWorldResourceLoader():load(imagePath, image)
 material:getDiffuse():loadGPU(image)
 njli.Image.destroy(image)
 image = nil

 geometry:removeMaterial()
 geometry:addMaterial(material)
 geometry:addShaderProgram(mymodule.shader)

 local mainNode = njli.Node.create()
 mainNode:setName(text)

 local t = 
 {
 raw_font = font,
 raw_text = text,
 }

 local rect = 
 {
 0, 0, 0, 0
 }


 local numLines = tonumber(Count_Substring( text, "\n" )) + 1
 local oldAlign = ( t.align or 'left' )
 t.align = 'left'
 local x = 0; local y = -(numLines - 1) * t.raw_font.info.lineHeight
 local last = ''; local xMax = 0; local yMax = numLines * t.raw_font.info.lineHeight
 if t.raw_font then
 for c in string.gmatch( t.raw_text..'\n', '(.)' ) do
 if c == '\n' then 
 x = 0; y = y + t.raw_font.info.lineHeight
 elseif c == '\t' then
 local numSpaces = 4
 c = " "

 for i=1,numSpaces do
 if 0 + t.raw_font.chars[ c ].width > 0 and 0 + t.raw_font.chars[ c ].height > 0 then
 local node = njli.Node.create()
 node:setName(c)
 node:addGeometry(geometry)

 local letter = {}

 if t.raw_font.kernings[ last .. c ] then
 x = x + font.kernings[ last .. c ]
 end

 letter.anchorX = 0
 letter.anchorY = 0

 letter.x = t.raw_font.chars[ c ].xoffset + x
 letter.y = (t.raw_font.info.lineHeight - t.raw_font.chars[ c ].yoffset) - t.raw_font.chars[ c ].height - (t.raw_font.info.lineHeight - t.raw_font.info.base) - y

 geometry:setSpriteAtlasFrame(node, 
 t.raw_font.chars[ c ].x, 
 t.raw_font.chars[ c ].y, 
 t.raw_font.chars[ c ].width, 
 t.raw_font.chars[ c ].height)
 geometry:setDimensions(node,
 bullet.btVector2( t.raw_font.chars[ c ].width*2, t.raw_font.chars[ c ].height*2),
 bullet.btVector2( letter.anchorX, letter.anchorY ))

 node:setOrigin(bullet.btVector3(letter.x, letter.y, 0))

 mainNode:addChildNode(node)

 last = c
 end
 x = x + t.raw_font.chars[ c ].xadvance + (t.raw_font.info.outline or 0) 
 if x >= xMax then
 xMax = x
 end
 end
 elseif t.raw_font.chars[ c ] then
 local rfc = t.raw_font.chars[ c ]

 if 0 + t.raw_font.chars[ c ].width > 0 and 0 + t.raw_font.chars[ c ].height > 0 then
 local node = njli.Node.create()
 node:setName(c)
 node:addGeometry(geometry)

 local letter = {}

 if t.raw_font.kernings[ last .. c ] then
 x = x + font.kernings[ last .. c ]
 end

 letter.anchorX = 0
 letter.anchorY = 0

 letter.x = t.raw_font.chars[ c ].xoffset + x
 letter.y = (t.raw_font.info.lineHeight - t.raw_font.chars[ c ].yoffset) - t.raw_font.chars[ c ].height - (t.raw_font.info.lineHeight - t.raw_font.info.base) - y

 geometry:setSpriteAtlasFrame(node, 
 t.raw_font.chars[ c ].x, 
 t.raw_font.chars[ c ].y, 
 t.raw_font.chars[ c ].width, 
 t.raw_font.chars[ c ].height)
 geometry:setDimensions(node,
 bullet.btVector2( t.raw_font.chars[ c ].width*2, t.raw_font.chars[ c ].height*2),
 bullet.btVector2( letter.anchorX, letter.anchorY ))

 node:setOrigin(bullet.btVector3(letter.x, letter.y, 0))

 mainNode:addChildNode(node)

 last = c
 end
 x = x + t.raw_font.chars[ c ].xadvance + (t.raw_font.info.outline or 0) 
 if x >= xMax then
 xMax = x
 end
 end
 end

 rect = 
 {
 x=x, y=y, width=xMax, height=yMax
 }
 end

 return mainNode, rect
end







































































































































































































































































































return mymodule
