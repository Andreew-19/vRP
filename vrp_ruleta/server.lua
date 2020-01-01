  
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_ruleta")


RegisterServerEvent('loginhud2:payout')
AddEventHandler('loginhud2:payout', function(amount)
    local user_id = vRP.getUserId({source})
    vRP.giveMoney({user_id,(tonumber(amount))})
end)

RegisterServerEvent('loginhud2:remcash')
AddEventHandler('loginhud2:remcash', function(amount)
    local user_id = vRP.getUserId({source})
    vRP.tryPayment({user_id,(tonumber(amount))})
end)

vrpCR.RegisterServerCallback('loginhud2:checkcash', function(source, cb)
  local user_id = vRP.getUserId({source})
    local money = vRP.getMoney({user_id}) + 0.0
  cb(money)
  end)