
vRP = Proxy.getInterface("vRP")

local Casinos = {
    {name="Casino", x= 977.03497314454, y= 48.7698097229, z= 74.681129455566},
  }	
  
  
Citizen.CreateThread(function()
    while true do
    Wait(0)
        if CasinoZone() then
            DisplayHelpText("Apasa ~INPUT_PICKUP~ pentru a juca la ~r~Ruleta")
        
            if IsControlJustPressed(1, 38) then
                LoadPage()
            end
        end

        if IsControlJustPressed(1, 322) then
        ClosePage()
        end
    end
end)
  
function LoadPage()
    SetNuiFocus(true, true)
    vrpCR.TriggerServerCallback('loginhud2:checkcash', function(cash)
        saldo = cash
        
        SendNUIMessage({ type = 'openGeneral', 
            nazwa = GetPlayerName(),
            cash = saldo})
    end)
end
  
function SendSaldo()
vrpCR.TriggerServerCallback('loginhud2:checkcash', function(cash)
        saldo   = cash
        
        SendNUIMessage({ type = 'setCash', 
            cash = saldo})
    end)
end
  
function ClosePage()
    SetNuiFocus(false, false)
    SendNUIMessage({type = 'closeAll'})
end
  
RegisterNUICallback('NUIFocusOff', function()
    ClosePage()
end)
  
RegisterNUICallback('NUIRestart', function()
    ClosePage()
    Citizen.Wait(1)
    LoadPage()
end)
  
  
RegisterNUICallback('win', function(data)
    TriggerServerEvent('loginhud2:payout', data.amount)
    SendSaldo()
end)

RegisterNUICallback('lose', function(data)
    TriggerServerEvent('loginhud2:remcash', data.amount)
    SendSaldo()
end)

function CasinoZone()
    local player = GetPlayerPed(-1)
    local playerloc = GetEntityCoords(player, 0)
    
    for _, search in pairs(Casinos) do
        local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
        
        if distance <= 1 then
            return true
        end
    end
end

function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end