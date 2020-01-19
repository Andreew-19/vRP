local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

RSCclient = Tunnel.getInterface("vrp_names","vrp_names")
vRPclient = Tunnel.getInterface("vRP","vrp_names")
vRP = Proxy.getInterface("vRP")


factions = {
	{"superadmin", "Owner"},
	{"admin", "Administrator"},
	{"mod", "Moderator"},
	{"cop", "Police Officer"},
	{"ems", "Medic"}
}

local function update_name(player, user_id, source)
	vRP.getUserIdentity({user_id, function(identity)
		if identity ~= nil then
			group = "Civilian"
			for i, v in pairs(factions) do
				theGroup = tostring(v[1])
				theName = tostring(v[2])
				if(vRP.hasGroup({user_id, theGroup}))then
					group = theGroup
				end
			end
			RSCclient.insertUser(player,{user_id,source,identity.firstname .. ' ' .. identity.name,vRP.hasPermission({user_id, "player.group.add"}),group})
		end
	end})
end

AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn) 
	local users = vRP.getUsers({})
	for k,v in pairs(users) do
		update_name(source,k,v)
		update_name(v,user_id,source)
	end
end)

AddEventHandler("vRP:playerLeave",function(user_id, source)
	local users = vRP.getUsers({})
	for k,v in pairs(users) do
		RSCclient.removeUser(v,{user_id})
	end
end)


RegisterServerEvent("getBasics")
AddEventHandler("getBasics", function ()
    local user_id = vRP.getUserId({source})
    TriggerClientEvent("returnBasics",source,vRP.getHunger({user_id}),vRP.getThirst({user_id}))
end)



RegisterServerEvent('reuploadgrade')
AddEventHandler('reuploadgrade', function(sansa)
	local users = vRP.getUsers({})
	local user_id = vRP.getUserId({source})
	for k,v in pairs(users) do
		update_name(source,k,v)
		update_name(v,user_id,source)
	end
end)