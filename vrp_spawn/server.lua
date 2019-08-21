local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_spawn")

local factiuni = {
    {"cop",432.29684448242,-981.99334716796,30.710739135742}
}

AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	for k,v in pairs(factiuni) do
		factiune = v[1]
		x = v[2]
		y = v[3]
		z = v[4]

		if vRP.hasGroup({user_id,v[1]}) then
            vRPclient.teleport(player,{v[2],v[3],v[4]})

        end
    end
end)