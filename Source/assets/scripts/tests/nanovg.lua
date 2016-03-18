--local testAllFunctions = assert (loadfile ("scripts/testAllFunctions.lua"))
--local testWorldState = assert (loadfile ("scripts/testWorldState.lua"))
--local testHookFunctions = assert (loadfile ("scripts/testHookFunctions.lua"))
--local testNodeAndScene = assert (loadfile ("scripts/testNodeAndScene.lua"))
--local testAllFunctions = assert (loadfile ("scripts/testAllFunctions.lua"))
--local testFileIO = assert (loadfile ("scripts/testFileIO.lua"))
--local testImageLoading = assert (loadfile ("scripts/testImageLoading.lua"))
--local testSprites = assert (loadfile ("scripts/testSprites.lua"))
local testParticleEmitter = assert (loadfile(JLI.ASSET_PATH("scripts/testParticleEmitter.lua")))
--local testSpriteTextCoords = assert (loadfile("scripts/testSpriteTextCoords.lua"))

local ICON_SEARCH = 0x1F50D
local ICON_CIRCLED_CROSS = 0x2716
local ICON_CHEVRON_RIGHT = 0xE75E
local ICON_CHECK = 0x2713
local ICON_LOGIN = 0xE740
local ICON_TRASH = 0xE729


local hud = JLI.World.getInstance():getWorldHUD()
local demoData = {images={}}

--local data = {}

--data["fontChinese"] = hud:createFont("sans-ch", "fonts/Chinese.ttf")

--data["fontIcons"] = hud:createFont("icons", "fonts/entypo.ttf")

--data["fontNormal"] = hud:createFont("sans", "fonts/Roboto-Regular.ttf")

--data["fontBold"] = hud:createFont("sans-bold", "fonts/Roboto-Bold.ttf")

--data["fontJapanese"] = hud:createFont("sans-jp", "fonts/DroidSansJapanese.ttf")







function clamp(v, min, max)

    if(v < min) then
        v = min
    end

    if(v > max) then
        v = max
    end

    return v
end

function loadDemoData()


    for i=0,11 do
        local file = string.format("images/images/image%d.jpg", i+1)
        demoData["images"][i] = hud:createImage(file, 0);
        if (demoData["images"][i] == 0) then
            print (string.format("Could not load %s.\n", file))
        end
    end


    demoData.fontIcons = hud:createFont("icons", "fonts/entypo.ttf")
    if (demoData.fontIcons == -1) then
        print("Could not add font icons.\n");
    end
    
    demoData.fontNormal = hud:createFont("sans", "fonts/Roboto-Regular.ttf")
    if (demoData.fontNormal == -1) then
        print("Could not add font italic.\n");
    end
    
    demoData.fontBold = hud:createFont("sans-bold", "fonts/Roboto-Bold.ttf")
    if (demoData.fontBold == -1) then
        print("Could not add font bold.\n");
    end
end










--World-------------------

function MyWorldStateEnter()

end

function MyWorldStateUpdate(timeStep)
end

function MyWorldStateExit()
end

function MyWorldStateTouchDown(touches)

end

function MyWorldStateTouchUp(touches)
end

function MyWorldStateTouchMove(touches)
end


function labelEnglish()
    local x = 69
    local y = 95
    local h = 20
    local text = "THIS IS A TEST"

    local pos = JLI.btVector2(x, y+h*0.5)


    hud:fontFaceId(data["fontBold"])
    hud:fontSize(18)
    hud:fontFace("sans-bold")
    hud:fillColor(JLI.WorldHUD.rgbaf(1.0,0,0,1.0))


    hud:textAlign(JLI.JLI_HUD_ALIGN_MIDDLE)
    hud:text(pos,text, NULL)
end

function labelJapanese()
    local x = 69
    local y = 95
    local h = 20

    local text = "私はガラスを食べられます。それは私を傷つけません。"

    local pos = JLI.btVector2(x, y+h*0.5)


    hud:fontFaceId(data["fontJapanese"])
    hud:fontSize(72)
    hud:fontFace("sans-jp")
    hud:fillColor(JLI.WorldHUD.rgbaf(1.0,0,0,1.0))


    hud:textAlign(JLI.JLI_HUD_ALIGN_MIDDLE)
    hud:text(pos,text, NULL)
end

function labelChinese()
    local x = 69
    local y = 95
    local h = 20

    local text = "由于基码数量比氨基酸多，许多氨基酸有超过一个基码来表述它们。"

    local pos = JLI.btVector2(x, y+h*0.5)


    hud:fontFaceId(data["fontBold"])
    hud:fontSize(18)
    hud:fontFace("sans-bold")
    hud:fillColor(JLI.WorldHUD.rgbaf(1.0,0,0,1.0))


    hud:textAlign(JLI.JLI_HUD_ALIGN_MIDDLE)
    hud:text(pos,text, NULL)
end





































function drawEyes(x, y, w, h, mx, my, t)
local ex = w *0.23;
local ey = h * 0.5;
local lx = x + ex;
local ly = y + ey;
local rx = x + w - ex;
local ry = y + ey;
local br = ey * 0.5
if(ex < ey)then
br = ex * 0.5
end
local blink = 1 - math.pow(math.sin(t*0.5),200)*0.8;

local bg = hud:linearGradient(x,y+h*0.5,x+w*0.1,y+h, JLI.WorldHUD.rgba(0,0,0,32), JLI.WorldHUD.rgba(0,0,0,16));
hud:beginPath();
hud:ellipse(lx+3.0,ly+16.0, ex,ey);
hud:ellipse(rx+3.0,ry+16.0, ex,ey);
hud:fillPaint(bg);
hud:fill();

bg = hud:linearGradient(x,y+h*0.25,x+w*0.1,y+h, JLI.WorldHUD.rgba(220,220,220,255), JLI.WorldHUD.rgba(128,128,128,255));
hud:beginPath();
hud:ellipse(lx,ly, ex,ey);
hud:ellipse(rx,ry, ex,ey);
hud:fillPaint(bg);
hud:fill();

local dx = (mx - rx) / (ex * 10);
local dy = (my - ry) / (ey * 10);
local d = math.sqrt(dx*dx+dy*dy);
if (d > 1.0) then
dx = dx / d
dy = dy / d;
end
dx = dx * ex*0.4;
dy = dy * ey*0.5;
hud:beginPath();
hud:ellipse(lx+dx,ly+dy+ey*0.25*(1-blink), br,br*blink);
hud:fillColor(JLI.WorldHUD.rgba(32,32,32,255));
hud:fill();

dx = (mx - rx) / (ex * 10);
dy = (my - ry) / (ey * 10);
d = math.sqrt(dx*dx+dy*dy);
if (d > 1.0) then
dx = dx / d
dy = dy / d
end
dx = dx * ex*0.4;
dy = dy * ey*0.5;
hud:beginPath();
hud:ellipse(rx+dx,ry+dy+ey*0.25*(1-blink), br,br*blink);
hud:fillColor(JLI.WorldHUD.rgba(32,32,32,255));
hud:fill();

local gloss = hud:radialGradient(lx-ex*0.25,ly-ey*0.5, ex*0.1,ex*0.75, JLI.WorldHUD.rgba(255,255,255,128), JLI.WorldHUD.rgba(255,255,255,0));
hud:beginPath();
hud:ellipse(lx,ly, ex,ey);
hud:fillPaint(gloss);
hud:fill();

gloss = hud:radialGradient(rx-ex*0.25,ry-ey*0.5, ex*0.1,ex*0.75, JLI.WorldHUD.rgba(255,255,255,128), JLI.WorldHUD.rgba(255,255,255,0));
hud:beginPath();
hud:ellipse(rx,ry, ex,ey);
hud:fillPaint(gloss);
hud:fill();
end

function drawGraph(x, y, w, h, t)
    local samples= {}
    local sx = {}
    local sy = {}
    local dx = w/5.0

    samples[0] = (1+math.sin(t*1.2345+math.cos(t*0.33457)*0.44))*0.5
    samples[1] = (1+math.sin(t*0.68363+math.cos(t*1.3)*1.55))*0.5
    samples[2] = (1+math.sin(t*1.1642+math.cos(t*0.33457)*1.24))*0.5
    samples[3] = (1+math.sin(t*0.56345+math.cos(t*1.63)*0.14))*0.5
    samples[4] = (1+math.sin(t*1.6245+math.cos(t*0.254)*0.3))*0.5
    samples[5] = (1+math.sin(t*0.345+math.cos(t*0.03)*0.6))*0.5

    for i=0,5 do
        sx[i] = x+i*dx
        sy[i] = y+h*samples[i]*0.8
    end

    -- Graph background
    local bg = hud:linearGradient(x,y,x,y+h, JLI.WorldHUD.rgba(0,160,192,0), JLI.WorldHUD.rgba(0,160,192,64))
    hud:beginPath()
    hud:moveTo(sx[0], sy[0])

    for i=1,5 do
        hud:bezierTo(sx[i-1]+dx*0.5, sy[i-1], sx[i]-dx*0.5, sy[i], sx[i],sy[i])
    end

    hud:lineTo(x+w, y+h)
    hud:lineTo(x, y+h)
    hud:fillPaint(bg)
    hud:fill()

    -- Graph line
    hud:beginPath()
    hud:moveTo(sx[0], sy[0]+2)
    for i=1,5 do
        hud:bezierTo(sx[i-1]+dx*0.5, sy[i-1]+2, sx[i]-dx*0.5, sy[i]+2, sx[i],sy[i]+2)
    end
    hud:strokeColor(JLI.WorldHUD.rgba(0,0,0,32))
    hud:strokeWidth(3.0)
    hud:stroke()

    hud:beginPath()
    hud:moveTo(sx[0], sy[0])
    for i=1,5 do
        hud:bezierTo(sx[i-1]+dx*0.5, sy[i-1], sx[i]-dx*0.5, sy[i], sx[i],sy[i])
    end
    hud:strokeColor(JLI.WorldHUD.rgba(0,160,192,255))
    hud:strokeWidth(3.0)
    hud:stroke()

    -- Graph sample pos
    for i=0,5 do
        bg = hud:radialGradient(sx[i],sy[i]+2, 3.0, 8.0, JLI.WorldHUD.rgba(0,0,0,32), JLI.WorldHUD.rgba(0,0,0,0))
        hud:beginPath()
        hud:rect(sx[i]-10, sy[i]-10+2, 20,20)
        hud:fillPaint(bg)
        hud:fill()
    end

    hud:beginPath()
    for i=0,5 do
    hud:circle(sx[i], sy[i], 4.0)
    end
    hud:fillColor(JLI.WorldHUD.rgba(0,160,192,255))
    hud:fill()
    hud:beginPath()
    for i=0,5 do
    hud:circle(sx[i], sy[i], 2.0)
    end
    hud:fillColor(JLI.WorldHUD.rgba(220,220,220,255))
    hud:fill()

    hud:strokeWidth(1.0)
end


function drawLabel(text, x, y, w, h)

    hud:fontSize(18.0)
    hud:fontFace("sans")
    hud:fillColor(JLI.WorldHUD.rgba(255,255,255,128))

    local align = bit.bor(bit.tobit(JLI.JLI_HUD_ALIGN_LEFT), bit.tobit(JLI.JLI_HUD_ALIGN_MIDDLE))
    hud:textAlign(align)

    hud:text(x,y+h*0.5, text)
end








function isBlack(col)
if( col.r == 0.0 and col.g == 0.0 and col.b == 0.0 and col.a == 0.0 ) then
return 1
end
return 0
end

function drawButton(preicon, text, x, y, w, h, col)
    local cornerRadius = 4.0
    local tw = 0
    local iw = 0
    local colorIsBlack = isBlack(col)

    local param = 32
    if( colorIsBlack == 1 )then
        param = 16
    end

    local bg = hud:linearGradient(x,y,x,y+h, JLI.WorldHUD.rgba(255,255,255,param), JLI.WorldHUD.rgba(0,0,0,param))
    hud:beginPath()
    hud:roundedRect(x+1,y+1, w-2,h-2, cornerRadius-1)
    if ( colorIsBlack == 0 ) then
        hud:fillColor(col)
        hud:fill()
    end
    hud:fillPaint(bg)
    hud:fill()

    hud:beginPath()
    hud:roundedRect(x+0.5, y+0.5, w-1, h-1, cornerRadius-0.5)
    hud:strokeColor(JLI.WorldHUD.rgba(0,0,0,48))
    hud:stroke()

    local rect = JLI.Rect()
    hud:fontSize(20.0)
    hud:fontFace("sans-bold")
    tw = hud:textBounds(0, 0, rect, text)

    if (preicon ~= 0) then
        hud:fontSize(h*1.3)
        hud:fontFace("icons")
        iw = hud:textBounds(0,0, rect, JLI.WorldHUD.cpToUTF8(preicon))
        iw = iw + h*0.15
    end

    if (preicon ~= 0) then
        hud:fontSize(h*1.3)
        hud:fontFace("icons")
        hud:fillColor(JLI.WorldHUD.rgba(255,255,255,96))

        local align = bit.bor(bit.tobit(JLI.JLI_HUD_ALIGN_LEFT), bit.tobit(JLI.JLI_HUD_ALIGN_MIDDLE))
        hud:textAlign(align)
        hud:text(x+w*0.5-tw*0.5-iw*0.75, y+h*0.5, JLI.WorldHUD.cpToUTF8(preicon))
    end

    hud:fontSize(20.0)
    hud:fontFace("sans-bold")

    local align = bit.bor(bit.tobit(JLI.JLI_HUD_ALIGN_LEFT), bit.tobit(JLI.JLI_HUD_ALIGN_MIDDLE))
    hud:textAlign(align)
    hud:fillColor(JLI.WorldHUD.rgba(0,0,0,160))
    hud:text(x+w*0.5-tw*0.5+iw*0.25, y+h*0.5-1,text, NULL)
    hud:fillColor(JLI.WorldHUD.rgba(255,255,255,160))
    hud:text(x+w*0.5-tw*0.5+iw*0.25, y+h*0.5, text)
end

function drawColorwheel(x, y, w, h, t)
    local hue = math.sin(t * 0.12)

    hud:save()

    local cx = x + w*0.5
    local cy = y + h*0.5
    local r1 = h * 0.5 - 5.0

    if(w<h)then
        r1 = w * 0.5 - 5.0
    end

    local r0 = r1 - 20.0
    local aeps = 0.5 / r1	-- half a pixel arc length in radians (2pi cancels out).

    for i=0,5 do
        local a0 = i / 6.0 * JLI.PI * 2.0 - aeps
        local a1 = (i+1.0) / 6.0 * JLI.PI * 2.0 + aeps
        hud:beginPath()
        hud:arc(cx,cy, r0, a0, a1, JLI.JLI_HUD_WINDING_CW)
        hud:arc(cx,cy, r1, a1, a0, JLI.JLI_HUD_WINDING_CCW)
        hud:closePath()
        local ax = cx + math.cos(a0) * (r0+r1)*0.5
        local ay = cy + math.sin(a0) * (r0+r1)*0.5
        local bx = cx + math.cos(a1) * (r0+r1)*0.5
        local by = cy + math.sin(a1) * (r0+r1)*0.5
        local paint = hud:linearGradient(ax,ay, bx,by, JLI.WorldHUD.hsla(a0/(JLI.PI*2),1.0,0.55,255), JLI.WorldHUD.hsla(a1/(JLI.PI*2),1.0,0.55,255))
        hud:fillPaint(paint)
        hud:fill()
    end

    hud:beginPath()
    hud:circle(cx,cy, r0-0.5)
    hud:circle(cx,cy, r1+0.5)
    hud:strokeColor(JLI.WorldHUD.rgba(0,0,0,64))
    hud:strokeWidth(1.0)
    hud:stroke()

    -- Selector
    hud:save()
    hud:translate(cx,cy)
    hud:rotate(hue*JLI.PI*2)

    -- Marker on
    hud:strokeWidth(2.0)
    hud:beginPath()
    hud:rect(r0-1,-3,r1-r0+2,6)
    hud:strokeColor(JLI.WorldHUD.rgba(255,255,255,192))
    hud:stroke()

    paint = hud:boxGradient(r0-3,-5,r1-r0+6,10, 2,4, JLI.WorldHUD.rgba(0,0,0,128), JLI.WorldHUD.rgba(0,0,0,0))
    hud:beginPath()
    hud:rect(r0-2-10,-4-10,r1-r0+4+20,8+20)
    hud:rect(r0-2,-4,r1-r0+4,8)
    hud:pathWinding(JLI.JLI_HUD_SOLIDITY_HOLE)
    hud:fillPaint(paint)
    hud:fill()

    -- Center triangle
    local r = r0 - 6
    ax = math.cos(120.0/180.0*JLI.PI) * r
    ay = math.sin(120.0/180.0*JLI.PI) * r
    bx = math.cos(-120.0/180.0*JLI.PI) * r
    by = math.sin(-120.0/180.0*JLI.PI) * r
    hud:beginPath()
    hud:moveTo(r,0)
    hud:lineTo(ax,ay)
    hud:lineTo(bx,by)
    hud:closePath()
    paint = hud:linearGradient(r,0, ax,ay, JLI.WorldHUD.hsla(hue,1.0,0.5,255), JLI.WorldHUD.rgba(255,255,255,255))
    hud:fillPaint(paint)
    hud:fill()
    paint = hud:linearGradient((r+ax)*0.5, (0+ay)*0.5, bx,by, JLI.WorldHUD.rgba(0,0,0,0), JLI.WorldHUD.rgba(0,0,0,255))
    hud:fillPaint(paint)
    hud:fill()
    hud:strokeColor(JLI.WorldHUD.rgba(0,0,0,64))
    hud:stroke()

    -- Select circle on triangle
    ax = math.cos(120.0/180.0*JLI.PI) * r*0.3
    ay = math.sin(120.0/180.0*JLI.PI) * r*0.4
    hud:strokeWidth(2.0)
    hud:beginPath()
    hud:circle(ax,ay,5)
    hud:strokeColor(JLI.WorldHUD.rgba(255,255,255,192))
    hud:stroke()

    paint = hud:radialGradient(ax,ay, 7,9, JLI.WorldHUD.rgba(0,0,0,64), JLI.WorldHUD.rgba(0,0,0,0))
    hud:beginPath()
    hud:rect(ax-20,ay-20,40,40)
    hud:circle(ax,ay,7)
    hud:pathWinding(JLI.JLI_HUD_SOLIDITY_HOLE)
    hud:fillPaint(paint)
    hud:fill()

    hud:restore()

    hud:restore()
end


function drawLines(x, y, w, h, t)
    local pad = 5.0 s = w/9.0 - pad*2

    local joins = {}
    local caps = {}
    local pts = {}

    joins[0] = JLI.JLI_HUD_LINECAP_MITER
    joins[1] = JLI.JLI_HUD_LINECAP_ROUND
    joins[2] = JLI.JLI_HUD_LINECAP_BEVEL

    caps[0] = JLI.JLI_HUD_LINECAP_BUTT
    caps[1] = JLI.JLI_HUD_LINECAP_ROUND
    caps[2] = JLI.JLI_HUD_LINECAP_SQUARE

    hud:save()

    pts[0] = -s*0.25 + math.cos(t*0.3) * s*0.5
    pts[1] = math.sin(t*0.3) * s*0.5
    pts[2] = -s*0.25
    pts[3] =  0
    pts[4] = s*0.25
    pts[5] = 0
    pts[6] = s*0.25 + math.cos(-t*0.3) * s*0.5
    pts[7] = math.sin(-t*0.3) * s*0.5

    for i=0,2 do
        for j=0,2 do
            local fx = x + s*0.5 + (i*3+j)/9.0*w + pad
            local fy = y - s*0.5 + pad

            hud:lineCap(caps[i])
            hud:lineJoin(joins[j])

            hud:strokeWidth(s*0.3)
            hud:strokeColor(JLI.WorldHUD.rgba(0,0,0,160))
            hud:beginPath()
            hud:moveTo(fx+pts[0], fy+pts[1])
            hud:lineTo(fx+pts[2], fy+pts[3])
            hud:lineTo(fx+pts[4], fy+pts[5])
            hud:lineTo(fx+pts[6], fy+pts[7])
            hud:stroke()

            hud:lineCap(JLI.JLI_HUD_LINECAP_BUTT)
            hud:lineJoin(JLI.JLI_HUD_LINECAP_BEVEL)

            hud:strokeWidth(1.0)
            hud:strokeColor(JLI.WorldHUD.rgba(0,192,255,255))
            hud:beginPath()
            hud:moveTo(fx+pts[0], fy+pts[1])
            hud:lineTo(fx+pts[2], fy+pts[3])
            hud:lineTo(fx+pts[4], fy+pts[5])
            hud:lineTo(fx+pts[6], fy+pts[7])
            hud:stroke()
        end
    end


    hud:restore()
end








function drawWindow(title, x, y, w, h)
    local cornerRadius = 3.0
    
    hud:save()
    --	nvgClearState()
    
    -- Window
    hud:beginPath()
    hud:roundedRect(x,y, w,h, cornerRadius)
    hud:fillColor(JLI.WorldHUD.rgba(28,30,34,192))
    --	hud:fillColor(JLI.WorldHUD.rgba(0,0,0,128))
    hud:fill()
    
    -- Drop shadow
    local shadowPaint = hud:boxGradient(x,y+2, w,h, cornerRadius*2, 10, JLI.WorldHUD.rgba(0,0,0,128), JLI.WorldHUD.rgba(0,0,0,0))
    hud:beginPath()
    hud:rect(x-10,y-10, w+20,h+30)
    hud:roundedRect(x,y, w,h, cornerRadius)
    hud:pathWinding(JLI.JLI_HUD_SOLIDITY_HOLE)
    hud:fillPaint(shadowPaint)
    hud:fill()
    
    -- Header
    local headerPaint = hud:linearGradient(x,y,x,y+15, JLI.WorldHUD.rgba(255,255,255,8), JLI.WorldHUD.rgba(0,0,0,16))
    hud:beginPath()
    hud:roundedRect(x+1,y+1, w-2,30, cornerRadius-1)
    hud:fillPaint(headerPaint)
    hud:fill()
    hud:beginPath()
    hud:moveTo(x+0.5, y+0.5+30)
    hud:lineTo(x+0.5+w-1, y+0.5+30)
    hud:strokeColor(JLI.WorldHUD.rgba(0,0,0,32))
    hud:stroke()
    
    hud:fontSize(18.0)
    hud:fontFace("sans-bold")
    hud:textAlign(JLI.JLI_HUD_ALIGN_CENTER)
    
    hud:fontBlur(2)
    hud:fillColor(JLI.WorldHUD.rgba(0,0,0,128))
    hud:text(x+w/2, y+16+1, title)
    
    hud:fontBlur(0)
    hud:fillColor(JLI.WorldHUD.rgba(220,220,220,160))
    hud:text(x+w/2,y+16, title)
    
    hud:restore()
end


function drawSearchBox(text, x, y, w, h)
    local icon = {}
    local cornerRadius = h/2-1
    
    -- Edit
    local bg = hud:boxGradient(x,y+1.5, w,h, h/2,5, JLI.WorldHUD.rgba(0,0,0,16), JLI.WorldHUD.rgba(0,0,0,92))
    hud:beginPath()
    hud:roundedRect(x,y, w,h, cornerRadius)
    hud:fillPaint(bg)
    hud:fill()
    
    hud:fontSize(h*1.3)
    hud:fontFace("icons")
    hud:fillColor(JLI.WorldHUD.rgba(255,255,255,64))

    local align = bit.bor(bit.tobit(JLI.JLI_HUD_ALIGN_CENTER), bit.tobit(JLI.JLI_HUD_ALIGN_MIDDLE))
    hud:textAlign(align)
    hud:text(x+h*0.55, y+h*0.55, JLI.WorldHUD.cpToUTF8(ICON_SEARCH))
    
    hud:fontSize(20.0)
    hud:fontFace("sans")
    hud:fillColor(JLI.WorldHUD.rgba(255,255,255,32))

    local align = bit.bor(bit.tobit(JLI.JLI_HUD_ALIGN_CENTER), bit.tobit(JLI.JLI_HUD_ALIGN_MIDDLE))
    hud:textAlign(align)
    hud:text(x+h*1.05, y+h*0.5, text)
    
    hud:fontSize(h*1.3)
    hud:fontFace("icons")
    hud:fillColor(JLI.WorldHUD.rgba(255,255,255,32))

    local align = bit.bor(bit.tobit(JLI.JLI_HUD_ALIGN_CENTER), bit.tobit(JLI.JLI_HUD_ALIGN_MIDDLE))
    hud:textAlign(align)
    hud:text(x+w-h*0.55, y+h*0.55, JLI.WorldHUD.cpToUTF8(ICON_CIRCLED_CROSS))
end



function drawDropDown(text, x, y, w, h)
    local cornerRadius = 4.0

    local bg = hud:linearGradient(x,y,x,y+h, JLI.WorldHUD.rgba(255,255,255,16), JLI.WorldHUD.rgba(0,0,0,16))
    hud:beginPath()
    hud:roundedRect(x+1,y+1, w-2,h-2, cornerRadius-1)
    hud:fillPaint(bg)
    hud:fill()

    hud:beginPath()
    hud:roundedRect(x+0.5, y+0.5, w-1,h-1, cornerRadius-0.5)
    hud:strokeColor(JLI.WorldHUD.rgba(0,0,0,48))
    hud:stroke()

    hud:fontSize(20.0)
    hud:fontFace("sans")
    hud:fillColor(JLI.WorldHUD.rgba(255,255,255,160))
    local align = bit.bor(bit.tobit(JLI.JLI_HUD_ALIGN_LEFT), bit.tobit(JLI.JLI_HUD_ALIGN_MIDDLE))
    hud:textAlign(align)
    hud:text(x+h*0.3, y+h*0.5, text)

    hud:fontSize(h*1.3)
    hud:fontFace("icons")
    hud:fillColor(JLI.WorldHUD.rgba(255,255,255,64))
    local align = bit.bor(bit.tobit(JLI.JLI_HUD_ALIGN_CENTER), bit.tobit(JLI.JLI_HUD_ALIGN_MIDDLE))
    hud:textAlign(align)
    hud:text(x+w-h*0.5, y+h*0.5, JLI.WorldHUD.cpToUTF8(ICON_CHEVRON_RIGHT))
end






function drawEditBoxBase(x, y, w, h)
    -- Edit
    local bg = hud:boxGradient(x+1,y+1+1.5, w-2,h-2, 3,4, JLI.WorldHUD.rgba(255,255,255,32), JLI.WorldHUD.rgba(32,32,32,32))
    hud:beginPath()
    hud:roundedRect(x+1,y+1, w-2,h-2, 4-1)
    hud:fillPaint(bg)
    hud:fill()
    
    hud:beginPath()
    hud:roundedRect(x+0.5, y+0.5, w-1,h-1, 4-0.5)
    hud:strokeColor(JLI.WorldHUD.rgba(0,0,0,48))
    hud:stroke()
end

function drawEditBox(text, x, y, w, h)

    drawEditBoxBase(x,y, w,h)
    
    hud:fontSize(20.0)
    hud:fontFace("sans")
    hud:fillColor(JLI.WorldHUD.rgba(255,255,255,64))
    local align = bit.bor(bit.tobit(JLI.JLI_HUD_ALIGN_LEFT), bit.tobit(JLI.JLI_HUD_ALIGN_MIDDLE))
    hud:textAlign(align)
    hud:text(x+h*0.3, y+h*0.5, text)

end

function drawEditBoxNum(text, units, x, y, w, h)
    drawEditBoxBase(x,y, w,h)

    local bounds = JLI.Rect()

    local uw = hud:textBounds(0,0, bounds, units)
    
    hud:fontSize(18.0)
    hud:fontFace("sans")
    hud:fillColor(JLI.WorldHUD.rgba(255,255,255,64))

    local align = bit.bor(bit.tobit(JLI.JLI_HUD_ALIGN_RIGHT), bit.tobit(JLI.JLI_HUD_ALIGN_MIDDLE))
    hud:textAlign(align)
    hud:text(x+w-h*0.3, y+h*0.5, units)
    
    hud:fontSize(20.0)
    hud:fontFace("sans")
    hud:fillColor(JLI.WorldHUD.rgba(255,255,255,128))
    local align = bit.bor(bit.tobit(JLI.JLI_HUD_ALIGN_RIGHT), bit.tobit(JLI.JLI_HUD_ALIGN_MIDDLE))
    hud:textAlign(align)
    hud:text(x+w-uw-h*0.5, y+h*0.5, text)
end





function drawCheckBox(text, x, y, w, h)
    hud:fontSize(18.0)
    hud:fontFace("sans")
    hud:fillColor(JLI.WorldHUD.rgba(255,255,255,160))

    local align = bit.bor(bit.tobit(JLI.JLI_HUD_ALIGN_LEFT), bit.tobit(JLI.JLI_HUD_ALIGN_MIDDLE))
    hud:textAlign(align)
    hud:text(x+28,y+h*0.5, text)
    
    local bg = hud:boxGradient(x+1,y+(h*0.5)-9+1, 18,18, 3,3, JLI.WorldHUD.rgba(0,0,0,32), JLI.WorldHUD.rgba(0,0,0,92))
    hud:beginPath()
    hud:roundedRect(x+1,y+(h*0.5)-9, 18,18, 3)
    hud:fillPaint(bg)
    hud:fill()
    
    hud:fontSize(40)
    hud:fontFace("icons")
    hud:fillColor(JLI.WorldHUD.rgba(255,255,255,128))

    local align = bit.bor(bit.tobit(JLI.JLI_HUD_ALIGN_CENTER), bit.tobit(JLI.JLI_HUD_ALIGN_MIDDLE))
    hud:textAlign(align)
    hud:text(x+9+2, y+h*0.5, JLI.WorldHUD.cpToUTF8(ICON_CHECK))
end



function drawSlider(pos, x, y, w, h)
    local cy = y+(h*0.5)
    local kr = (h*0.25)
    
    hud:save()
    --	nvgClearState()
    
    -- Slot
    local bg = hud:boxGradient(x,cy-2+1, w,4, 2,2, JLI.WorldHUD.rgba(0,0,0,32), JLI.WorldHUD.rgba(0,0,0,128))
    hud:beginPath()
    hud:roundedRect(x,cy-2, w,4, 2)
    hud:fillPaint(bg)
    hud:fill()
    
    -- Knob Shadow
    bg = hud:radialGradient(x+(pos*w),cy+1, kr-3,kr+3, JLI.WorldHUD.rgba(0,0,0,64), JLI.WorldHUD.rgba(0,0,0,0))
    hud:beginPath()
    hud:rect(x+(pos*w)-kr-5,cy-kr-5,kr*2+5+5,kr*2+5+5+3)
    hud:circle(x+(pos*w),cy, kr)
    hud:pathWinding(JLI.JLI_HUD_SOLIDITY_HOLE)
    hud:fillPaint(bg)
    hud:fill()
    
    -- Knob
    local knob = hud:linearGradient(x,cy-kr,x,cy+kr, JLI.WorldHUD.rgba(255,255,255,16), JLI.WorldHUD.rgba(0,0,0,16))
    hud:beginPath()
    hud:circle(x+(pos*w),cy, kr-1)
    hud:fillColor(JLI.WorldHUD.rgba(40,43,48,255))
    hud:fill()
    hud:fillPaint(knob)
    hud:fill()
    
    hud:beginPath()
    hud:circle(x+(pos*w),cy, kr-0.5)
    hud:strokeColor(JLI.WorldHUD.rgba(0,0,0,92))
    hud:stroke()
    
    hud:restore()
end






function drawSpinner(cx, cy, r, t)
    local a0 = 0.0 + t*6
    local a1 = JLI.PI + t*6
    local r0 = r
    local r1 = r * 0.75

    hud:save()

    hud:beginPath()
    hud:arc(cx,cy, r0, a0, a1, JLI.JLI_HUD_WINDING_CW)
    hud:arc(cx,cy, r1, a1, a0, JLI.JLI_HUD_WINDING_CCW)
    hud:closePath()
    local ax = cx + math.cos(a0) * (r0+r1)*0.5
    local ay = cy + math.sin(a0) * (r0+r1)*0.5
    local bx = cx + math.cos(a1) * (r0+r1)*0.5
    local by = cy + math.sin(a1) * (r0+r1)*0.5
    local paint = hud:linearGradient(ax,ay, bx,by, JLI.WorldHUD.rgba(0,0,0,0), JLI.WorldHUD.rgba(0,0,0,128))
    hud:fillPaint(paint)
    hud:fill()

    hud:restore()
end



function drawThumbnails(x, y, w, h, images, nimages, t)
    local cornerRadius = 3.0
    local ix,iy,iw,ih = 0, 0, 0, 0
    local thumb = 60.0
    local arry = 30.5
    local stackh = (nimages/2) * (thumb+10) + 10
    local u = (1+math.cos(t*0.5))*0.5
    local u2 = (1-math.cos(t*0.2))*0.5

    hud:save()
    --	nvgClearState()

    -- Drop shadow
    local shadowPaint = hud:boxGradient(x,y+4, w,h, cornerRadius*2, 20, JLI.WorldHUD.rgba(0,0,0,128), JLI.WorldHUD.rgba(0,0,0,0))
    hud:beginPath()
    hud:rect(x-10,y-10, w+20,h+30)
    hud:roundedRect(x,y, w,h, cornerRadius)
    hud:pathWinding(JLI.JLI_HUD_SOLIDITY_HOLE)
    hud:fillPaint(shadowPaint)
    hud:fill()

    -- Window
    hud:beginPath()
    hud:roundedRect(x,y, w,h, cornerRadius)
    hud:moveTo(x-10,y+arry)
    hud:lineTo(x+1,y+arry-11)
    hud:lineTo(x+1,y+arry+11)
    hud:fillColor(JLI.WorldHUD.rgba(200,200,200,255))
    hud:fill()

    hud:save()
    hud:scissor(x,y,w,h)
    hud:translate(0, -(stackh - h)*u)

    local dv = 1.0 / (nimages-1)

    for i=0,(nimages-1) do
        local tx, ty, v, a
        tx = x+10
        ty = y+10
        tx = tx + (i%2) * (thumb+10)
        ty = ty + (i/2) * (thumb+10)

        local imgw, imgh = hud:imageSize(images[i])

        if (imgw < imgh) then
            iw = thumb
            ih = iw * imgh/imgw
            ix = 0
            iy = -(ih-thumb)*0.5
        else
            ih = thumb
            iw = ih * imgw/imgh
            ix = -(iw-thumb)*0.5
            iy = 0
        end
        
        v = i * dv
        a = clamp((u2-v) / dv, 0, 1)
        
        if (a < 1.0) then
            drawSpinner(tx+thumb/2,ty+thumb/2, thumb*0.25, t)
        end
        
        local imgPaint = hud:imagePattern(tx+ix, ty+iy, iw,ih, 0.0/180.0*JLI.PI, images[i], a)
        hud:beginPath()
        hud:roundedRect(tx,ty, thumb,thumb, 5)
        hud:fillPaint(imgPaint)
        hud:fill()
        
        shadowPaint = hud:boxGradient(tx-1,ty, thumb+2,thumb+2, 5, 3, JLI.WorldHUD.rgba(0,0,0,128), JLI.WorldHUD.rgba(0,0,0,0))
        hud:beginPath()
        hud:rect(tx-5,ty-5, thumb+10,thumb+10)
        hud:roundedRect(tx,ty, thumb,thumb, 6)
        hud:pathWinding(JLI.JLI_HUD_SOLIDITY_HOLE)
        hud:fillPaint(shadowPaint)
        hud:fill()
        
        hud:beginPath()
        hud:roundedRect(tx+0.5, ty+0.5, thumb-1,thumb-1, 4-0.5)
        hud:strokeWidth(1.0)
        hud:strokeColor(JLI.WorldHUD.rgba(255,255,255,192))
        hud:stroke()
    end
    hud:restore()

    -- Hide fades
    local fadePaint = hud:linearGradient(x,y,x,y+6, JLI.WorldHUD.rgba(200,200,200,255), JLI.WorldHUD.rgba(200,200,200,0))
    hud:beginPath()
    hud:rect(x+4,y,w-8,6)
    hud:fillPaint(fadePaint)
    hud:fill()

    fadePaint = hud:linearGradient(x,y+h,x,y+h-6, JLI.WorldHUD.rgba(200,200,200,255), JLI.WorldHUD.rgba(200,200,200,0))
    hud:beginPath()
    hud:rect(x+4,y+h-6,w-8,6)
    hud:fillPaint(fadePaint)
    hud:fill()

    -- Scroll bar
    shadowPaint = hud:boxGradient(x+w-12+1,y+4+1, 8,h-8, 3,4, JLI.WorldHUD.rgba(0,0,0,32), JLI.WorldHUD.rgba(0,0,0,92))
    hud:beginPath()
    hud:roundedRect(x+w-12,y+4, 8,h-8, 3)
    hud:fillPaint(shadowPaint)
    --	hud:fillColor(JLI.WorldHUD.rgba(255,0,0,128))
    hud:fill()

    local scrollh = (h/stackh) * (h-8)
    shadowPaint = hud:boxGradient(x+w-12-1,y+4+(h-8-scrollh)*u-1, 8,scrollh, 3,4, JLI.WorldHUD.rgba(220,220,220,255), JLI.WorldHUD.rgba(128,128,128,255))
    hud:beginPath()
    hud:roundedRect(x+w-12+1,y+4+1 + (h-8-scrollh)*u, 8-2,scrollh-2, 2)
    hud:fillPaint(shadowPaint)
    --	hud:fillColor(JLI.WorldHUD.rgba(0,0,0,128))
    hud:fill()

    hud:restore()
end



function drawWidths(x, y, width)
    hud:save()
    
    hud:strokeColor(JLI.WorldHUD.rgba(0,0,0,255))
    
    for i=0,19 do
        local w = (i+0.5)*0.1
        hud:strokeWidth(w)
        hud:beginPath()
        hud:moveTo(x,y)
        hud:lineTo(x+width,y+width*0.3)
        hud:stroke()
        y = y + 10
    end
    
    hud:restore()
end

function drawCaps(x, y, width)

    local caps = {}
    caps[0] = JLI.JLI_HUD_LINECAP_BUTT
    caps[1] = JLI.JLI_HUD_LINECAP_ROUND
    caps[2] = JLI.JLI_HUD_LINECAP_SQUARE

    local lineWidth = 8.0
    
    hud:save()
    
    hud:beginPath()
    hud:rect(x-lineWidth/2, y, width+lineWidth, 40)
    hud:fillColor(JLI.WorldHUD.rgba(255,255,255,32))
    hud:fill()
    
    hud:beginPath()
    hud:rect(x, y, width, 40)
    hud:fillColor(JLI.WorldHUD.rgba(255,255,255,32))
    hud:fill()
    
    hud:strokeWidth(lineWidth)

    for i=0,2 do
        hud:lineCap(caps[i])
        hud:strokeColor(JLI.WorldHUD.rgba(0,0,0,255))
        hud:beginPath()
        hud:moveTo(x, y + i*10 + 5)
        hud:lineTo(x+width, y + i*10 + 5)
        hud:stroke()
    end
    
    hud:restore()
end



function drawScissor(x, y, t)
    hud:save()
    
    -- Draw first rect and set scissor to it's area.
    hud:translate(x, y)
    hud:rotate(JLI.WorldHUD.degToRad(5))
    hud:beginPath()
    hud:rect(-20,-20,60,40)
    hud:fillColor(JLI.WorldHUD.rgba(255,0,0,255))
    hud:fill()
    hud:scissor(-20,-20,60,40)
    
    -- Draw second rectangle with offset and rotation.
    hud:translate(40,0)
    hud:rotate(t)
    
    -- Draw the intended second rectangle without any scissoring.
    hud:save()
    hud:resetScissor()
    hud:beginPath()
    hud:rect(-20,-10,60,30)
    hud:fillColor(JLI.WorldHUD.rgba(255,128,0,64))
    hud:fill()
    hud:restore()
    
    -- Draw second rectangle with combined scissoring.
    hud:intersectScissor(-20,-10,60,30)
    hud:beginPath()
    hud:rect(-20,-10,60,30)
    hud:fillColor(JLI.WorldHUD.rgba(255,128,0,255))
    hud:fill()
    
    hud:restore()
end













--[[
function drawParagraph(local x, local y, local width, local height, local mx, local my)
hud:textRow rows[3]
NVGglyphPosition glyphs[100]
const char* text = "This is longer chunk of text.\n  \n  Would have used lorem ipsum but she    was busy jumping over the lazy dog with the fox and all the men who came to the aid of the party."
const char* start
const char* end
int nrows, i, nglyphs, j, lnum = 0
local lineh
local caretx, px
local bounds[4]
local a
local gx,gy
int gutter = 0
NVG_NOTUSED(height)

hud:save()

hud:fontSize(18.0f)
hud:fontFace("sans")
hud:textAlign(NVG_ALIGN_LEFT|NVG_ALIGN_TOP)
hud:textMetrics(NULL, NULL, &lineh)

-- The text break API can be used to fill a large buffer of rows,
-- or to iterate over the text just few lines (or just one) at a time.
-- The "next" variable of the last returned item tells where to continue.
start = text
end = text + strlen(text)
while ((nrows = hud:textBreakLines(start, end, width, rows, 3))) {
    for (i = 0 i < nrows i++) {
        hud:textRow* row = &rows[i]
        int hit = mx > x && mx < (x+width) && my >= y && my < (y+lineh)
        
        hud:beginPath()
        hud:fillColor(JLI.WorldHUD.rgba(255,255,255,hit?64:16))
        hud:rect(x, y, row->width, lineh)
        hud:fill()
        
        hud:fillColor(JLI.WorldHUD.rgba(255,255,255,255))
        hud:text(x, y, row->start, row->end)
        
        if (hit) {
            caretx = (mx < x+row->width/2) ? x : x+row->width
            px = x
            nglyphs = hud:textGlyphPositions(x, y, row->start, row->end, glyphs, 100)
            for (j = 0 j < nglyphs j++) {
                local x0 = glyphs[j].x
                local x1 = (j+1 < nglyphs) ? glyphs[j+1].x : x+row->width
                local gx = x0 * 0.3f + x1 * 0.7
                if (mx >= px && mx < gx)
                caretx = glyphs[j].x
                px = gx
            }
            hud:beginPath()
            hud:fillColor(JLI.WorldHUD.rgba(255,192,0,255))
            hud:rect(caretx, y, 1, lineh)
            hud:fill()
            
            gutter = lnum+1
            gx = x - 10
            gy = y + lineh/2
        }
        lnum++
        y += lineh
    }
    -- Keep going...
    start = rows[nrows-1].next
}

if (gutter) {
    char txt[16]
    snprintf(txt, sizeof(txt), "%d", gutter)
    hud:fontSize(13.0f)
    hud:textAlign(NVG_ALIGN_RIGHT|JLI_HUD_ALIGN_MIDDLE)
    
    hud:textBounds(gx,gy, txt, NULL, bounds)
    
    hud:beginPath()
    hud:fillColor(JLI.WorldHUD.rgba(255,192,0,255))
    hud:roundedRect((int)bounds[0]-4,(int)bounds[1]-2, (int)(bounds[2]-bounds[0])+8, (int)(bounds[3]-bounds[1])+4, ((int)(bounds[3]-bounds[1])+4)/2-1)
    hud:fill()
    
    hud:fillColor(JLI.WorldHUD.rgba(32,32,32,255))
    hud:text(gx,gy, txt, NULL)
}

y += 20.0

hud:fontSize(13.0f)
hud:textAlign(NVG_ALIGN_LEFT|NVG_ALIGN_TOP)
hud:textLineHeight(1.2f)

hud:textBoxBounds(x,y, 150, "Hover your mouse over the text to see calculated caret position.", NULL, bounds)

-- Fade the tooltip out when close to it.
gx = fabsf((mx - (bounds[0]+bounds[2])*0.5f) / (bounds[0] - bounds[2]))
gy = fabsf((my - (bounds[1]+bounds[3])*0.5f) / (bounds[1] - bounds[3]))
a = maxf(gx, gy) - 0.5
a = clamp(a, 0, 1)
nvgGlobalAlpha(a)

hud:beginPath()
hud:fillColor(JLI.WorldHUD.rgba(220,220,220,255))
hud:roundedRect(bounds[0]-2,bounds[1]-2, (int)(bounds[2]-bounds[0])+4, (int)(bounds[3]-bounds[1])+4, 3)
px = (int)((bounds[2]+bounds[0])/2)
hud:moveTo(px,bounds[1] - 10)
hud:lineTo(px+7,bounds[1]+1)
hud:lineTo(px-7,bounds[1]+1)
hud:fill()

hud:fillColor(JLI.WorldHUD.rgba(0,0,0,220))
hud:textBox(x,y, 150, "Hover your mouse over the text to see calculated caret position.", NULL)

hud:restore()
end
]]--






























--[[





















void freeDemoData(DemoData* data)
{
    int i
    
    if ( == NULL)
    return
    
    for (i = 0 i < 12 i++)
    nvgDeleteImage(data->images[i])
}










]]--



























loadDemoData()

function RenderHUD()

    local mx, my, width, height, t, blowup = JLI.World.getInstance():getViewportDimensions():x(), JLI.World.getInstance():getViewportDimensions():y(), JLI.World.getInstance():getViewportDimensions():x(), JLI.World.getInstance():getViewportDimensions():y(), JLI.World.getInstance():getWorldClock():totalMilliseconds(), 0

    drawEyes(width - 250, 50, 150, 100, mx, my, t)
    --drawParagraph(width - 450, 50, 150, 100, mx, my)
    --drawGraph(0, height/2, width, height/2, t)
    drawColorwheel(width - 300, height - 300, 250.0, 250.0, t)

    -- Line joints
    drawLines(120, height-50, 600, 50, t)

    -- Line caps
    drawWidths(10, 50, 30)

    -- Line caps
    drawCaps(10, 300, 30)

    drawScissor(50, height-80, t)

    hud:save()
    if (blowup==1) then
        hud:rotate(math.sin(t*0.3)*5.0/180.0*JLI.PI)
        hud:scale(2.0, 2.0)
    end

    -- Widgets
    drawWindow("Widgets `n Stuff", 50, 50, 300, 400)
    local x = 60
    local y = 95
    drawSearchBox("Search", x,y,280,25)
    y = y + 40
    drawDropDown("Effects", x,y,280,28)
    local popy = y + 14
    y = y + 45

    -- Form
    drawLabel("Login", x,y, 280,20)
    y = y + 25
    drawEditBox("Email",  x,y, 280,28)
    y = y + 35
    drawEditBox("Password", x,y, 280,28)
    y = y + 38
    drawCheckBox("Remember me", x,y, 140,28)
    drawButton(ICON_LOGIN, "Sign in", x+138, y, 140, 28, JLI.WorldHUD.rgba(0,96,128,255))
    y = y + 45

    -- Slider
    drawLabel("Diameter", x,y, 280,20)
    y = y + 25
    drawEditBoxNum("123.00", "px", x+180,y, 100,28)
    drawSlider(0.4, x,y, 170,28)
    y = y + 55

    drawButton(ICON_TRASH, "Delete", x, y, 160, 28, JLI.WorldHUD.rgba(128,16,8,255))
    drawButton(0, "Cancel", x+170, y, 110, 28, JLI.WorldHUD.rgba(0,0,0,0))

    -- Thumbnails box
    drawThumbnails(365, popy-30, 160, 300, demoData["images"], 12, t)

    hud:restore()

end




