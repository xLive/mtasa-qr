addCommandHandler ("qr",
function (player,_,...)
    local args = {...}
        if #args > 0 then
        local text = table.concat (args,"%20")
        fetchRemote ("https://api.qrserver.com/v1/create-qr-code/?size=250x250&data="..text,callBack,"",false,player)
        outputChatBox ("Done.",player,0,255,0)
        end
    end
)
--
function callBack(data,errno,player)
    if errno == 0 and data then
    triggerClientEvent (player,"qr:show",resourceRoot,data)
    end
end