local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")


RegisterServerEvent('adminTicket')
AddEventHandler('adminTicket', function(descriere)
  user_id = vRP.getUserId({source})
  player = vRP.getUserSource({user_id})

  local raspuns = false

  if vRP.hasPermission({user_id,"tickete.admin"})then
  vRP.request({player,"ID ["..user_id.."] are o Problema: " ..descriere, 30, function(player,da)
    if da then
        if not raspuns then
            vRPclient.notify(player,{"[ADMIN TICKET] ~g~Adminul ~r~" ..GetPlayerName(player).. " ~g~ti a acceptat Ticket-ul"})
            vRPclient.getPosition(player, {}, function(x,y,z)
            vRPclient.teleport(source,{x,y,z})
        end)
        raspuns = true
    else
        vRPclient.notify(source,{"[ADMIN TICKET] ~r~Acest Ticket a fost deja luat !"})
     end
    end
  end})
end
end)


local admin_Ticket = {function(player,choice) 
	
	TriggerClientEvent("adminWindow", player)
	vRP.closeMenu({player})

end,""}

vRP.registerMenuBuilder({"admin", function(add, data)
	local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
			choices["Admin Ticket"] = admin_Ticket
		add(choices)
	end
end})



RegisterCommand("adminticket", function(source, args, rawCommand)
	TriggerClientEvent("adminWindow", source)
end, false)