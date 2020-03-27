local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_adminTicket")


adminRequests = {}

RegisterServerEvent('adminTicket')
AddEventHandler('adminTicket', function(descriere)
  user_id = vRP.getUserId({source})
  player = vRP.getUserSource({user_id})

  local answered = false
  local players = {}
  local users = vRP.getUsers({})
  
  for k,v in pairs(users) do
    local player = vRP.getUserSource({tonumber(k)})
    if vRP.isUserTrialHelper({k}) and source ~= nil then
      table.insert(players,player)
    end
  end

  for k,v in pairs(players) do
    usrID = vRP.getUserId({v})
    if(adminRequests[user_id] == nil)then
        vRP.request({v,"ID ["..user_id.."] has a Problem: " ..descriere, 30, function(v,ok)
        adminRequests[user_id] = true
        if ok then -- take the call
          if not answered then
            vRPclient.notify(player,{"An admin took your ticket."})
            vRPclient.getPosition(player, {}, function(x,y,z)
              vRPclient.teleport(v,{x,y,z})
            end)

            local theAdmin = vRP.getUserSource(usrID)
            vRPclient.notify(v, {"[TICKET] ~r~Ticketul lui ~w~"..user_id.." ~r~luat de ~w~"..GetPlayerName(theAdmin)})
            answered = true
            adminRequests[user_id] = nil
          end
        else
          vRPclient.notify(v,{"Ticket already taken."})
        end
      end})
    else
    end
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
