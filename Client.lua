local screenW, screenH = guiGetScreenSize()
local image,start,render

function renderQR()
    if image then
        local a = interpolateBetween (0,0,0,255,0,0,(getTickCount () - start) / 4000,"Linear")
        dxDrawImage((screenW -200) / 2, (screenH - 200) / 2, 200,200,image,0,0,0,tocolor(255,255,255,a))
    end
end

addEvent ("qr:show",true)
addEventHandler ("qr:show",resourceRoot,
function (p)
    image = dxCreateTexture (p)
    start = getTickCount ()
    if not render then
        addEventHandler ("onClientRender",root,renderQR)
        render = true
    end
end)

addEvent("qr:close",true)
addEventHandler("qr:close",resourceRoot,
function ()
    if render then
        removeEventHandler("onClientRender",root,renderQR)
        render = false
    end
end)