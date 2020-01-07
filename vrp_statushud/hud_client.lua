
local water = 0
local food = 0

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        TriggerServerEvent("getFoameSete")
        SendNUIMessage({
            pauseMenu = IsPauseMenuActive(),
            fuel = VehFuel(),
            health = GetEntityHealth(PlayerPedId())-100,
            armor = GetPedArmour(PlayerPedId()),
            food = food,
            water = water
        })
    end
end)



RegisterNetEvent("returnFoameSete")
AddEventHandler("returnFoameSete", function (Foame, Sete)
    food = Foame
    water = Sete
end)




function VehFuel()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false) 
    local fuelLevel = exports["LegacyFuel"]:GetFuel(vehicle)

    if IsPedInAnyVehicle(PlayerPedId(), false) then 
        return fuelLevel
    else
        return false
    end
end
