local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vRP_pickweed")



RegisterServerEvent('pickweed')
AddEventHandler('pickweed', function()

    local sansa = math.random(1, 1)

    if sansa == 1 then

        local items = { 
            'weed'
        }

        local user_id = vRP.getUserId({source})
        local randomItems = items[math.random(#items)]
        local quantity = math.random(#items)
    
        vRP.giveInventoryItem({user_id,randomItems,quantity,false})
        vRPclient.notify(source, {'You found ' .. quantity .. ' gram of ' .. randomItems})
    else
        vRPclient.notify(source, {'Nothing found, maybe someone already harvested?'})
    end
end)




