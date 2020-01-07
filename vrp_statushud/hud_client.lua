
local sete = 0
local foame = 0

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        TriggerServerEvent("getBasics2")
        SendNUIMessage({
            pauseMenu = IsPauseMenuActive(),
            health = GetEntityHealth(PlayerPedId())-100,
            armor = GetPedArmour(PlayerPedId()),
            foame = foame,
            sete = sete
        })
    end
end)


RegisterNetEvent("returnBasics2")
AddEventHandler("returnBasics2", function (Foame, Sete)
    foame = Foame
    sete = Sete
end)