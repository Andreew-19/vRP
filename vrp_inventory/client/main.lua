vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_inventory")

local show = false
local temp_inventory = nil
local temp_weight = nil
local temp_maxWeight = nil
local cooldown = 0

function openGui(inventory, weight, maxWeight)
  if show == false then
    show = true
    SetNuiFocus(true, true)
    SendNUIMessage(
      {
        show = true,
        inventory = inventory,
        weight = weight,
        maxWeight = maxWeight
      }
    )
  end
end

function closeGui()
  show = false
  SetNuiFocus(false)
  SendNUIMessage({show = false})
end

RegisterNetEvent("alexinv:openGui")
AddEventHandler(
  "alexinv:openGui",
  function()
    if cooldown > 0 and temp_inventory ~= nil and temp_weight ~= nil and temp_maxWeight ~= nil then
      openGui(temp_inventory, temp_weight, temp_maxWeight)
    else
      TriggerServerEvent("alexinv:openGui")
    end
  end
)

RegisterNetEvent("alexinv:updateInventory")
AddEventHandler(
  "alexinv:updateInventory",
  function(inventory, weight, maxWeight)
    cooldown = Config.AntiSpamCooldown
    temp_inventory = inventory
    temp_weight = weight
    temp_maxWeight = maxWeight
    openGui(temp_inventory, temp_weight, temp_maxWeight)
  end
)

RegisterNetEvent("alexinv:UINotification")
AddEventHandler(
  "alexinv:UINotification",
  function(type, title, message)
    show = true
    SetNuiFocus(true, true)
    SendNUIMessage(
      {
        show = true,
        notification = true,
        type = type,
        title = title,
        message = message
      }
    )
  end
)

RegisterNetEvent("alexinv:closeGui")
AddEventHandler(
  "alexinv:closeGui",
  function()
    closeGui()
  end
)

RegisterNetEvent("alexinv:objectForAnimation")
AddEventHandler(
  "alexinv:objectForAnimation",
  function(type)
    local ped = GetPlayerPed(-1)
    DeleteObject(object)
    bone = GetPedBoneIndex(ped, 60309)
    coords = GetEntityCoords(ped)
    modelHash = GetHashKey(type)

    RequestModel(modelHash)
    object = CreateObject(modelHash, coords.x, coords.y, coords.z, true, true, false)
    AttachEntityToEntity(object, ped, bone, 0.1, 0.0, 0.0, 1.0, 1.0, 1.0, 1, 1, 0, 0, 2, 1)
    Citizen.Wait(2500)
    DeleteObject(object)
  end
)

RegisterNUICallback(
  "close",
  function(data)
    closeGui()
  end
)

RegisterNUICallback(
  "useItem",
  function(data)
    cooldown = 0
    closeGui()
    TriggerServerEvent("alexinv:useItem", {data})
  end
)

RegisterNUICallback(
  "dropItem",
  function(data)
    cooldown = 0
    closeGui()
    TriggerServerEvent("alexinv:dropItem", data)
  end
)

RegisterNUICallback(
  "giveItem",
  function(data)
    cooldown = 0
    closeGui()
    TriggerServerEvent("alexinv:giveItem", data)
  end
)

RegisterCommand(
  "inventory",
  function(source, args)
    TriggerEvent("alexinv:openGui")
  end
)

Citizen.CreateThread(
  function()
    while true do
      Citizen.Wait(0)
      if IsControlPressed(0, Config.OpenMenu) then
        TriggerEvent("alexinv:openGui")
      end
    end
  end
)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    if cooldown > 0 then 
      cooldown = cooldown - 1
    end
  end
end)

AddEventHandler(
  "onResourceStop",
  function(resource)
    if resource == GetCurrentResourceName() then
      closeGui()
    end
  end
)
