local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")


RegisterServerEvent("getFoameSete")
AddEventHandler("getFoameSete", function ()
    local user_id = vRP.getUserId({source})
    TriggerClientEvent("returnFoameSete",source,vRP.getHunger({user_id}),vRP.getThirst({user_id}))
end)