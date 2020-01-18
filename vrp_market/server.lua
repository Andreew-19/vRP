local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_market")

vRPSmarkets = {}
Tunnel.bindInterface("vrp_market",vRPSmarkets)
Proxy.addInterface("vrp_market",vRPSmarkets)
vRPCmarkets = Tunnel.getInterface("vrp_market","vrp_market")



function vRPSmarkets.market(item,suma,pret,item2)
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    local weight = vRP.getInventoryWeight({user_id})
    local new_weight = vRP.getInventoryWeight({user_id})+vRP.getItemWeight({item})*suma
   
    if new_weight <= vRP.getInventoryMaxWeight({user_id}) then
        if vRP.tryPayment({user_id, suma*pret}) then
            vRP.giveInventoryItem({user_id,item,suma,false})
            vRPclient.notify(player,{"[MARKET] ~g~You bought ~y~" ..suma.. " ~y~" ..item2.. " ~g~with "..suma*pret.." ~r~$"})
        else
            vRPclient.notify(player,{"[MARKET] ~r~Nu ai suficienti bani cash la tine"})
        end
    else
        vRPclient.notify(player,{"[MARKET] ~r~Nu ai suficient spatiu in inventar"})
    end
end





