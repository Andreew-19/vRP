local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

MySQL = module("vrp_mysql", "MySQL")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_showroom")
Gclient = Tunnel.getInterface("vRP_garages","vRP_showroom")

local cfg = module("vrp_showroom","cfg/showroom")
local vehgarage = cfg


-- vehicle db / garage and lscustoms compatibility
MySQL.createCommand("vRP/showroom_columns", [[
ALTER TABLE vrp_user_vehicles ADD IF NOT EXISTS veh_type varchar(255) NOT NULL DEFAULT 'default' ;
ALTER TABLE vrp_user_vehicles ADD IF NOT EXISTS vehicle_plate varchar(255) NOT NULL;
]])
MySQL.query("vRP/showroom_columns")

MySQL.createCommand("vRP/add_custom_vehicle","INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,vehicle_plate,veh_type) VALUES(@user_id,@vehicle,@vehicle_plate,@veh_type)")
MySQL.createCommand("vRP/select_veh_plate","SELECT vehicle_plate FROM vrp_user_vehicles")
MySQL.createCommand("vRP/get_vehicle_id","SELECT id FROM vrp_user_vehicles ORDER BY id DESC LIMIT 1")
MySQL.createCommand("vRP/get_plr_vhz","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id")
MySQL.createCommand("vRP/get_vehicle_byPlate","SELECT * FROM vrp_user_vehicles WHERE vehicle_plate = @vehicle_plate")
MySQL.createCommand("vRP/update_license_plate","UPDATE vrp_user_vehicles SET vehicle_plate = @vehicle_plate WHERE user_id = @user_id AND vehicle = @vehicle")

function getPrice( category, model )
    for i,v in ipairs(vehshop.menu[category].buttons) do
      if v.model == model then
          return v.costs
      end
    end
    return nil 
end

-- SHOWROOM
RegisterServerEvent('veh_SR:CheckMoneyForVeh')
AddEventHandler('veh_SR:CheckMoneyForVeh', function(category, vehicle, price, veh_type, isXZ, isDM)
	local user_id = tonumber(vRP.getUserId({source}))
	local player = vRP.getUserSource({user_id})
	
	MySQL.query("vRP/get_vehicle", {user_id = user_id, vehicle = vehicle}, function(pvehicle, affected)
		if #pvehicle > 0 then
			vRPclient.notify(player,{"[DEALERSHIP] ~r~You already have this vehicle"})
			Citizen.Wait(1500)
			TriggerClientEvent("meniu", player)
		else
			local actual_price = getPrice( category, vehicle)
			if actual_price == nil then
				print( "Vehicle "..vehicle.." from the category "..category.." doesn't have aprice set in cfg/showroom.lua" )
				vRPclient.notify(player,{"[DEALERSHIP] ~r~The car is out of stock"})
				TriggerClientEvent("meniu", player)
				return 
			end
			if  actual_price ~= price then
				print( "Player with ID "..user_id.. " is suspected of Cheat Engine.")
			end	
      if vRP.tryFullPayment({user_id,actual_price}) then
            plate = "B "..tostring(math.random(10000,99999))
            MySQL.query("vRP/select_veh_plate",{}, function(rows, affected)
              if #rows > 0 then
                for k,v in pairs(rows) do
                  if plate  == rows[k].vehicle_plate then
                    plate = "B "..tostring(math.random(10000,99999))
                  end
                end
              end
            end)

        MySQL.query("vRP/add_custom_vehicle", {user_id = user_id, vehicle = vehicle, vehicle_plate = plate, veh_type = veh_type})
        TriggerClientEvent('veh_SR:CloseMenu', player)
        TriggerClientEvent('veh_SR:Spawn_veh', player, vehicle, plate)
				vRPclient.notify(player,{"[DEALERSHIP] ~g~You paid ~r~"..actual_price.."$ ~g~for the car with the plate \n~y~" ..plate})
			else
				vRPclient.notify(player,{"[DEALERSHIP] ~r~You don't have enough money to buy this vehicle"})
				TriggerClientEvent("meniu", player)
			end
		end
	end)
end)

RegisterServerEvent('veh_SR:CheckMoneyForBasicVeh')
AddEventHandler('veh_SR:CheckMoneyForBasicVeh', function(user_id, vehicle, price ,veh_type)
  local player = vRP.getUserSource({user_id})
  MySQL.query("vRP/get_vehicle", {user_id = user_id, vehicle = vehicle}, function(pvehicle, affected)
    if #pvehicle > 0 then
      vRPclient.notify(player,{"~r~Vehicle already owned."})
      vRP.giveMoney({user_id,price})
    else
          vRPclient.notify(player,{"Paid ~r~"..price.."$."})
      vRP.getUserIdentity({user_id, function(identity)
            MySQL.query("vRP/add_custom_vehicle", {user_id = user_id, vehicle = vehicle, vehicle_plate = "P "..identity.registration, veh_type = veh_type})
      end})
      Gclient.spawnBoughtVehicle(player,{veh_type, vehicle})
    end
  end)
end)

AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
  local user_id = vRP.getUserId({source})
  local player = vRP.getUserSource({user_id})
  SetTimeout(1000,function()
	  TriggerClientEvent('veh_SR:assvehicles',player)
  end)
end)
