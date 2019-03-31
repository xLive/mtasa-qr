local screenW, screenH = guiGetScreenSize()

function renderQR()
    if image then
    local a = interpolateBetween (0,0,0,255,0,0,(getTickCount () - start) / 4000,"Linear")
    dxDrawImage((screenW - qw or 200) / 2, (screenH - qh or 200) / 2, qw or 200, qh or 200,image,0,0,0,tocolor(255,255,255,a))
    --dxDrawLinedRectangle ((screenW - qw or 200) / 2, (screenH - qh or 200) / 2, qw or 200, qh or 200,tocolor (0,0,0,a),8)
    end
end
addEvent ("qr:show",true)
addEventHandler ("qr:show",root,
function (p)
    image,qw,qh = dxCreateTexture (p),dxGetPixelsSize (p)
    addEventHandler ("onClientRender",root,renderQR)
    start = getTickCount ()
    end
)
--
function dxDrawLinedRectangle( x, y, width, height, color, _width, postGUI )
	_width = _width or 1
	dxDrawLine ( x, y, x+width, y, color, _width, postGUI ) -- Top
	dxDrawLine ( x, y, x, y+height, color, _width, postGUI ) -- Left
	dxDrawLine ( x, y+height, x+width, y+height, color, _width, postGUI ) -- Bottom
	return dxDrawLine ( x+width, y, x+width, y+height, color, _width, postGUI ) -- Right
end
--
function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
    if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
         local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
         if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
              for i, v in ipairs( aAttachedFunctions ) do
                   if v == func then
                    return true
               end
          end
     end
    end
    return false
end