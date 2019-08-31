local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_inventory")

RegisterServerEvent("alexinv:openGui")
AddEventHandler(
    "alexinv:openGui",
    function()
        local user_id = vRP.getUserId({source})
        local player = vRP.getUserSource({user_id})
        local data = vRP.getUserDataTable({user_id})
        if data and data.inventory then
            local inventory = {}
            for data_k, data_v in pairs(data.inventory) do
                local item_name = vRP.getItemName({data_k})
                local nume = tostring(data_k):gsub("%s+", "_")
                if item_name then 
                    table.insert(
                        inventory,
                        {
                            name = item_name, 
                            amount = data_v.amount,
                            idname = nume
                        }
                    )
                end
            end
            local weight = vRP.getInventoryWeight({user_id})
            local maxWeight = vRP.getInventoryMaxWeight({user_id})
            TriggerClientEvent("alexinv:updateInventory", source, inventory, weight, maxWeight)
        end
    end
)

RegisterServerEvent("alexinv:useItem")
AddEventHandler(
    "alexinv:useItem",
    function(args)
        local data = args[1]
        local user_id = vRP.getUserId({source})
        local player = vRP.getUserSource({user_id})
        local nume = tostring(data.idname):gsub("_", " ")
        local choices = vRP.getItemChoices({nume})
        for k, v in pairs(choices) do
            if k ~= "Ofera" and k ~= "Arunca" then
                if k == "Equip" then
                    local arr = splitString(tostring(data.idname), "|")[2]
                    if vRP.tryGetInventoryItem({user_id, tostring(data.idname), 1, false}) then
                        local arme = {}
                        arme[tostring(arr)] = {ammo = 0}
                        vRPclient.giveWeapons(player,{arme})
                    end
                elseif k == "Load" then
                    local arr = splitString(tostring(data.idname), "|")[2]
                    local amount = vRP.getInventoryItemAmount({user_id, tostring(data.idname)})
                    vRP.prompt({player,"Cat incarci ? Max : ("..amount..")", "", function(player,valoare)
                        valoare = parseInt(valoare)
                        vRPclient.getWeapons(player, {}, function(armeechipate)
                            if armeechipate[arr] ~= nil then
                                if vRP.tryGetInventoryItem({user_id, tostring(data.idname), valoare, false}) then -- give weapon ammo
                                    local weapons = {}
                                    weapons[arr] = {ammo = valoare}
                                    vRPclient.giveWeapons(player, {weapons,false})
                                end
                            end
                        end)
                    end})
                else
                    local functie = v[1]
                    for i=1,data.amount do
                        functie(player, k)
                    end
                end
            end
        end 
    end
)

RegisterServerEvent("alexinv:dropItem")
AddEventHandler(
    "alexinv:dropItem",
    function(data)
        local user_id = vRP.getUserId({source})
        local player = vRP.getUserSource({user_id})
        local amount = parseInt(data.amount)
        local nume = tostring(data.idname):gsub("_", " ")
        local choices = vRP.getItemChoices({data.idname})
        for k, v in pairs(choices) do
            if k ~= "Ofera" and k ~= "Arunca" then
                if k == "Load" or k == "Equip" then
                    if vRP.tryGetInventoryItem({user_id, tostring(data.idname), amount, false}) then
                        TriggerClientEvent("alexinv:closeGui", player)
                        vRPclient.playAnim(player, {true, {{"pickup_object", "pickup_low", 1}}, false})
                    else
                        TriggerClientEvent(
                            "alexinv:UINotification",
                            player,
                            "warning",
                            Config.Language.WarningTitle,
                            Config.Language.Error
                        )
                    end
                else
                    if vRP.tryGetInventoryItem({user_id, nume, amount, false}) then
                        TriggerClientEvent("alexinv:closeGui", player)
                        vRPclient.playAnim(player, {true, {{"pickup_object", "pickup_low", 1}}, false})
                    else
                        TriggerClientEvent(
                            "alexinv:UINotification",
                            player,
                            "warning",
                            Config.Language.WarningTitle,
                            Config.Language.Error
                        )
                    end
                end
            end
        end
    end
)

function split(str, sep)
    local array = {}
    local reg = string.format("([^%s]+)", sep)
    for mem in string.gmatch(str, reg) do
        table.insert(array, mem)
    end
    return array
end

RegisterServerEvent("alexinv:giveItem")
AddEventHandler(
    "alexinv:giveItem",
    function(data)
        local user_id = vRP.getUserId({source})
        local player = vRP.getUserSource({user_id})
        local nume = tostring(data.idname):gsub("_", " ")
        local choices = vRP.getItemChoices({data.idname})
        if user_id ~= nil then
            for k, v in pairs(choices) do
                if k ~= "Ofera" and k ~= "Arunca" then
                    if k == "Equip" or k == "Load" then
                        vRPclient.getNearestPlayer(
                            player,
                            {10},
                            function(nplayer)
                                if nplayer ~= nil then
                                    local nuser_id = vRP.getUserId({nplayer})
                                    if nuser_id ~= nil then
                                        local amount = parseInt(data.amount)
                                        local new_weight = vRP.getInventoryWeight({nuser_id}) + vRP.getItemWeight({tostring(data.idname)}) * amount
                                        if new_weight <= vRP.getInventoryMaxWeight({nuser_id}) then
                                            if vRP.tryGetInventoryItem({user_id, tostring(data.idname), amount, false}) then
                                                vRP.giveInventoryItem({nuser_id, tostring(data.idname), amount, true})
                                                vRPclient.playAnim(player, {true, {{"mp_common", "givetake1_a", 1}}, false})
                                                vRPclient.playAnim(nplayer, {true, {{"mp_common", "givetake2_a", 1}}, false})
                                            else
                                                vRPclient.notify(player, {Config.Language.Error})
                                            end
                                        else
                                            vRPclient.notify(player, {Config.Language.NotEnoughtSpace})
                                        end
                                    else
                                        vRPclient.notify(player, {Config.Language.NoNearby})
                                    end
                                else
                                    vRPclient.notify(player, {Config.Language.NoNearby})
                                end
                            end
                        )
                    else
                        vRPclient.getNearestPlayer(
                            player,
                            {10},
                            function(nplayer)
                                if nplayer ~= nil then
                                    local nuser_id = vRP.getUserId({nplayer})
                                    if nuser_id ~= nil then
                                        local amount = parseInt(data.amount)
                                        local new_weight =
                                            vRP.getInventoryWeight({nuser_id}) + vRP.getItemWeight({nume}) * amount
                                        if new_weight <= vRP.getInventoryMaxWeight({nuser_id}) then
                                            if vRP.tryGetInventoryItem({user_id, nume, amount, false}) then
                                                vRP.giveInventoryItem({nuser_id, nume, amount, true})

                                                vRPclient.playAnim(player, {true, {{"mp_common", "givetake1_a", 1}}, false})
                                                vRPclient.playAnim(nplayer, {true, {{"mp_common", "givetake2_a", 1}}, false})
                                            else
                                                vRPclient.notify(player, {Config.Language.Error})
                                            end
                                        else
                                            vRPclient.notify(player, {Config.Language.NotEnoughtSpace})
                                        end
                                    else
                                        vRPclient.notify(player, {Config.Language.NoNearby})
                                    end
                                else
                                    vRPclient.notify(player, {Config.Language.NoNearby})
                                end
                            end
                        )
                    end
                end
            end
        end
    end
)

function play_eat(player)
    local seq = {
        {"mp_player_inteat@burger", "mp_player_int_eat_burger_enter",1},
        {"mp_player_inteat@burger", "mp_player_int_eat_burger",1},
        {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp",1},
        {"mp_player_inteat@burger", "mp_player_int_eat_exit_burger",1}
    }

    vRPclient.playAnim(player,{true,seq,false})
end

function play_drink(player)
    local seq = {
        {"mp_player_intdrink","intro_bottle",1},
        {"mp_player_intdrink","loop_bottle",1},
        {"mp_player_intdrink","outro_bottle",1}
    }

    vRPclient.playAnim(player,{true,seq,false})
end
