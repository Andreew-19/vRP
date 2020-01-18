local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")


RegisterServerEvent('adminTicket')
AddEventHandler('adminTicket', function(descriere)
  user_id = vRP.getUserId({source})
  player = vRP.getUserSource({user_id})

  local raspuns = false

  if vRP.hasPermission({user_id,"admin.tickets"})then
  vRP.request({player,"ID ["..user_id.."] has a Problem: " ..descriere, 30, function(jucator,da)
    if da then
        if not raspuns then
            vRPclient.notify(jucator,{"[ADMIN TICKET] ~g~Adminul ~r~" ..GetPlayerName(jucator).. " ~g~ti a acceptat Ticket-ul"})
            vRPclient.getPosition(jucator, {}, function(x,y,z)
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