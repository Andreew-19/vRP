
local water = 0
local food = 0

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        TriggerServerEvent("getFoameSete")
        SendNUIMessage({
            pauseMenu = IsPauseMenuActive(),
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