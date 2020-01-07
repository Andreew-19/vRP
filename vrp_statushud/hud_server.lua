local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")


RegisterServerEvent("getBasics2")
AddEventHandler("getBasics2", function ()
    local user_id = vRP.getUserId({source})
    TriggerClientEvent("returnBasics2",source,vRP.getHunger({user_id}),vRP.getThirst({user_id}))
end)