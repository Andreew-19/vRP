vRPCrc = {}
Tunnel.bindInterface("vRP_pickweed",vRPCrc)
Proxy.addInterface("vRP_pickweed",vRPCrc)
vRPSrc = Tunnel.getInterface("vRP_pickweed","vRP_pickweed")
vRP = Proxy.getInterface("vRP")


cachedPlant = {}
closestPlant = {
    'Prop_weed_01',
    'bkr_prop_weed_lrg_01a',
    'bkr_prop_weed_lrg_01b',
    'bkr_prop_weed_med_01a',
    'bkr_prop_weed_med_01b',
    'bkr_prop_weed_01_small_01a',
    'bkr_prop_weed_01_small_01b',
    'bkr_prop_weed_01_small_01c'


}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000)
        cachedPlant = {}
    end
end)


Citizen.CreateThread(function()
    while true do
        
        local sleep = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        for i = 1, #closestPlant do
            local x = GetClosestObjectOfType(playerCoords, 2.0, GetHashKey(closestPlant[i]), false, false, false)
            local entity = nil
            if DoesEntityExist(x) then
                entity = x
                Plant    = GetEntityCoords(entity)
                sleep  = 5
                DrawText3D(Plant.x, Plant.y, Plant.z + 1.5, 'Press [~g~E~s~] to harvest the ~b~weed~s~')  
                if IsControlJustReleased(0, 38) then
                    if not cachedPlant[entity] then
                        OpenPlant(entity)
                    else
                        vRPclient.notify(source, {'~r~This plant has already been harvested.~s~'})
                    end
                end
                break
            else
                sleep = 1000
            end
        end
        Citizen.Wait(sleep)
    end
end)



OpenPlant = function(entity)
    TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_GARDENER_PLANT", 0, true)
    Citizen.Wait(10000)
    cachedPlant[entity] = true
    TriggerServerEvent('pickweed')
    ClearPedTasksImmediately(PlayerPedId())
end



DrawText3D = function(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
  
	local scale = 0.45
   
	if onScreen then
		SetTextScale(scale, scale)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextOutline()
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 370
        DrawRect(_x, _y + 0.0150, 0.030 + factor , 0.030, 66, 66, 66, 150)
	end
end
