
vRP = Proxy.getInterface("vRP")
vRPg = Proxy.getInterface("vRP_garages")
heading = 0

function deleteVehiclePedIsIn()
  local v = GetVehiclePedIsIn(GetPlayerPed(-1),false)
  SetVehicleHasBeenOwnedByPlayer(v,false)
  Citizen.InvokeNative(0xAD738C3085FE7E11, v, false, true) -- set not as mission entity
  SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(v))
  Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(v))
end

function isCursorInPosition(x,y,width,height)
	local sx, sy = GetActiveScreenResolution()
  local cx, cy = GetNuiCursorPosition ( )
  local cx, cy = (cx / sx), (cy / sy)
  
	local width = width / 2
	local height = height / 2
  
  if (cx >= (x - width) and cx <= (x + width)) and (cy >= (y - height) and cy <= (y + height)) then
	  return true
  else
	  return false
  end
end


RegisterNetEvent( 'wk:deleteVehicle2' )
AddEventHandler( 'wk:deleteVehicle2', function()
    local ped = GetPlayerPed( -1 )
    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then 
        local pos = GetEntityCoords(ped)
        if (IsPedSittingInAnyVehicle(ped)) then 
            local vehicle = GetVehiclePedIsIn(ped, false)
            if (GetPedInVehicleSeat(vehicle, -1) == ped) then 
                SetEntityAsMissionEntity(vehicle, true, true)
                deleteCar(vehicle)
                if (DoesEntityExist(vehicle)) then 
                	ShowNotification("~r~Unable to delete vehicle, try again.")
                else 
                	ShowNotification("Vehicle deleted.")
                end 
            else 
                ShowNotification( "You must be in the driver's seat!" )
            end 
        else
            local playerPos = GetEntityCoords( ped, 1)
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, distanceToCheck, 0.0 )
            local vehicle = GetVehicleInDirection( playerPos, inFrontOfPlayer )

            if (DoesEntityExist(vehicle)) then 
                SetEntityAsMissionEntity(vehicle, true, true)
                deleteCar(vehicle)

                if ( DoesEntityExist(vehicle)) then 
                	ShowNotification("~r~Unable to delete vehicle, try again.")
                else 
                	ShowNotification("Vehicle deleted.")
                end 
            else 
                ShowNotification("You must be in or near a vehicle to delete it.")
            end 
        end 
    end 
end )

function deleteCar(entity)
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(entity))
end


function GetVehicleInDirection(coordFrom, coordTo)
    local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
    local _, _, _, _, vehicle = GetRaycastResult(rayHandle)
    return vehicle
end


function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false,false)
end

local vehshop = {
	opened = false,
	title = "Dealership",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 4 },
	menu = {
		x = 0.1,
		y = 0.08,
		width = 0.2,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["main"] = {
			title = "Showroom",
			name = "main",
			buttons = {
				{name = "Masini", description = ""},
				--{name = "suv-offroad", description = ""},
				--{name = "Mafie", description = ""},
			--	{name = "hitman", description = ""},
				{name = "Tiruri", description = ""},
				--{name = "thelostmc", description = ""},
				{name = "Motociclete", description = ""},
				{name = "Masini Factiuni", description = ""},
			--	{name = "vip", description = ""},
				--{name = "dmd-cars", description = ""},
			--	{name = "bikes", description = ""},
				--{name = "aviation", description = ""},
			}
		},
		["Masini"] = {
			title = "Masini",
			name = "Masini",
			buttons = {
				{name = "Audi", description = ''},
				{name = "BMW", description = ''},
				{name = "Mercede-Benz", description = ''},
				--{name = "ferrari", description = ''},
				--{name = "fast-and-furios", description = ''},
				{name = "Dacia", description = ''},
				--{name = "lamborghini", description = ''},
				--{name = "Aston Martin", description = ''},
			--	{name = "Porche", description = ''},
			--	{name = "Toyota", description = ''},
				--{name = "cars5", description = ''},
				{name = "Masini Scumpe", description = ''},
				--{name = "cycles", description = ''},
			}
		},
		["Audi"] = {
			title = "Audi",
			name = "Audi",
			buttons = {
				{name = "Audi RS5 2013", costs = 32000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "t20"},
				{name = "Audi RS3 2012", costs = 27500, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "rs3"},
				{name = "Audi A8 2010", costs = 31650, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "a8fsi"},
				{name = "Audi A8 2008", costs = 17000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "a8audi"},
				{name = "Audi RS6 2003", costs = 30000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "c5rs6"},
				{name = "Audi RS6 2009", costs = 38500, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "rs6sedan"},
				{name = "Audi R8 V10 Spyder", costs = 98900, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "14r8"},
				{name = "Audi RS6", costs = 84000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "audirs6tk"},
				{name = "Audi SQ7 2017", costs = 56689, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "SQ72016"},
				{name = "Audi RS7 2013", costs = 48900, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "2016rs7"},
				{name = "Audi A8 2018", costs = 73661, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "a8lfsi"},
				{name = "Audi A4 2017", costs = 27900, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "A4"},
				{name = "Audi R8V10", costs = 88900, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "r8v10"},
			}
		},
		["BMW"] = {
			title = "BMW",
			name = "BMW",
			buttons = {
				{name = "BMW M3 E36", costs = 25000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "rmodm3e36"},
				{name = "BMW X6M", costs = 43490, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "x6m"},
				{name = "BMW 440I", costs = 43490, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "440i"},
				{name = "BMW M5 E60", costs = 43490, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "e60"},
				{name = "BMW I8", costs = 57900, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "rmodbmwi8"},
				{name = "BMW M3", costs = 26500, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "m3f80"},
				{name = "BMW M4", costs = 43500, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "bmwm4"},
				{name = "BMW M3 E30", costs = 6200, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "m3e30"},
			}
		},
		["Mercede-Benz"] = {
			title = "mercedesbenz",
			name = "mercedesbenz",
			buttons = {
				{name = "Mercedes A45 AMG", costs = 33800, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "a45amg"},
				{name = "Mercedes s600", costs = 92000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "s600w220"},
				{name = "Merceds X-CLASS", costs = 27980, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "xclass"},
				{name = "Merceds EQC400", costs = 68000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "Mb400"},
				{name = "Mercedes W222", costs = 22900, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "w222wald"},
				{name = "Mercedes V250", costs = 33850, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "mb250"},
				{name = "Mercedes Brabus", costs = 24980, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "mlbrabus"},
				{name = "Mercedes C63", costs = 59999, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "c63s"},
				{name = "Mercedes GLE450", costs = 79800, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "mbgle"},
				{name = "Mercedes GL63", costs = 57980, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "gl63"},
				{name = "Mercedes G65", costs = 90000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "g65amg"},
			}
		},
		["ferrari"] = {
			title = "ferrari",
			name = "ferrari",
			buttons = {
			    {name = "Ferrari LaFerrari", costs = 2950000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "aperta"},
				{name = "Ferrari 599", costs = 128305, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "gto"},
				{name = "Ferrari Enzo", costs = 1850000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "enzofxx"},
				{name = "Ferrari F12", costs = 159000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "nlargo"},
				{name = "Ferrari J50", costs = 3000000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "j50"},
				{name = "Ferrari Portofino", costs = 210720, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "fpino"},
			}
		},
		["lamborghini"] = {
			title = "lamborghini",
			name = "lamborghini",
			buttons = {
				{name = "Lamborghini Huracan", costs = 274000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "huraperfospy"},
				{name = "Lamborghini Urus", costs = 475000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "urus2018"},
				{name = "Lamborghini Centenario", costs = 3378000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "lp770r"},
				{name = "Lamborghini Aventador", costs = 212000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "aventadors"},
			}
		},
		["Aston Martin"] = {
			title = "Aston Martin",
			name = "Aston Martin",
			buttons = {
			    {name = "Aston Martin xTreme", costs = 4000000, speed = 50, acce = 40, brake = 40, trac = 40, description = {}, model = "db11"},
			    {name = "Aston Martin GT12", costs = 5000000, speed = 45, acce = 30, brake = 40, trac = 40, description = {}, model = "vgt12"},
				{name = "Aston Martin VANTAGE 2019", costs = 5200000, speed = 60, acce = 40, brake = 40, trac = 40, description = {}, model = "amv19"},
			}
		},
		["Porche"] = {
			title = "Porche",
			name = "Porche",
			buttons = {
			    {name = "Porsche Macan", costs = 37000, speed = 60, acce = 50, brake = 40, trac = 40, description = {}, model = "macanpd600m"},
				{name = "Porsche 718 Boxster", costs = 82800, speed = 60, acce = 50, brake = 40, trac = 40, description = {}, model = "718boxster"},
				{name = "Porsche 911R", costs = 136000, speed = 60, acce = 50, brake = 40, trac = 40, description = {}, model = "p911r"},
				{name = "Porsche 959", costs = 269900, speed = 60, acce = 50, brake = 40, trac = 40, description = {}, model = "por9"},
				{name = "Porsche Carrera", costs = 113400, speed = 60, acce = 50, brake = 40, trac = 40, description = {}, model = "cgt"},
				{name = "Porsche Panamera", costs = 32900, speed = 60, acce = 50, brake = 40, trac = 40, description = {}, model = "panamera17turbo"},
				{name = "Porsche 918 Spyder", costs = 117800, speed = 60, acce = 50, brake = 40, trac = 40, description = {}, model = "918"},
			}
		},
	--[[	["fast-and-furios"] = {
			title = "Fast And Furios",
			name = "Fast And Furios",
			buttons = {
				{name = "Gtr34", costs = 10000000, speed = 60, acce = 50, brake = 70, trac = 60, description = {}, model = "2f2fgtr34"},
				{name = "Gts", costs = 10000000, speed = 60, acce = 50, brake = 70, trac = 60, description = {}, model = "2f2fgts"},
				{name = "Mk4", costs = 10000000, speed = 60, acce = 50, brake = 70, trac = 60, description = {}, model = "2f2fmk4"},
				{name = "Mle7", costs = 10000000, speed = 60, acce = 50, brake = 70, trac = 60, description = {}, model = "2f2fmle7"},
				{name = "Wrx", costs = 10000000, speed = 60, acce = 50, brake = 70, trac = 60, description = {}, model = "ff4wrx"},
				{name = "R34", costs = 10000000, speed = 60, acce = 50, brake = 70, trac = 60, description = {}, model = "fnf4r34"},
				{name = "Lan", costs = 10000000, speed = 60, acce = 50, brake = 70, trac = 60, description = {}, model = "fnflan"},
				{name = "Mits", costs = 10000000, speed = 60, acce = 50, brake = 70, trac = 60, description = {}, model = "fnfmits"},
				{name = "Fmk4", costs = 10000000, speed = 60, acce = 50, brake = 70, trac = 60, description = {}, model = "fnfmk4"},
				{name = "GtX", costs = 10000000, speed = 60, acce = 50, brake = 70, trac = 60, description = {}, model = "gtx"},
				{name = "Frx", costs = 10000000, speed = 60, acce = 50, brake = 70, trac = 60, description = {}, model = "2f2frx7"},
				{name = "2000", costs = 10000000, speed = 60, acce = 50, brake = 70, trac = 60, description = {}, model = "2f2fs2000"},
				{name = "Dom", costs = 10000000, speed = 60, acce = 50, brake = 70, trac = 60, description = {}, model = "fnfrx7dom"},
				{name = "Sultan V8", costs = 5000000, speed = 55, acce = 50, brake = 70, trac = 50, description = {}, model = "sultanrsv8"},
			}
		},]]
		["Dacia"] = {
			title = "Dacia",
			name = "Dacia",
			buttons = {
				{name = "Dacia Sandero", costs = 6500, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "sandero"},
				{name = "Dacia Logan", costs = 5679, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "logan"},
				{name = "Dacia Duster", costs = 7690, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "daduster"},
			}
		},
	--[[	["Toyota"] = {
			title = "dacia",
			name = "dacia",
			buttons = {
			    {name = "Toyota GT86", costs = 200000, speed = 50, acce = 40, brake = 40, trac = 20, description = {}, model = "gt86"},
				{name = "Toyota Supra", costs = 230000, speed = 55, acce = 60, brake = 40, trac = 60, description = {}, model = "supra2"},
				{name = "Camioneta Calimon", costs = 2000000, speed = 55, acce = 60, brake = 40, trac = 60, description = {}, model = "80elcamino"},
				{name = "Dead Ringer", costs = 2300000, speed = 55, acce = 60, brake = 40, trac = 60, description = {}, model = "deadringer"},
			}
		},
		["cars5"] = {
			title = "cars5",
			name = "cars5",
			buttons = {
			    {name = "T20", costs = 3000000, speed = 40, acce = 20, brake = 40, trac = 20, description = {}, model = "t20"},
			    {name = "Bullet", costs = 350000, speed = 40, acce = 20, brake = 40, trac = 20, description = {}, model = "bullet"},
				{name = "Drift Tampa", costs = 850000, speed = 40, acce = 20, brake = 40, trac = 20, description = {}, model = "tampa2"},
				{name = "Ruston", costs = 750000, speed = 40, acce = 20, brake = 40, trac = 20, description = {}, model = "ruston"},
			    {name = "Entity XF", costs = 250000, speed = 40, acce = 20, brake = 40, trac = 20, description = {}, model = "entityxf"},
			    {name = "FMJ", costs = 700000, speed = 40, acce = 20, brake = 40, trac = 20, description = {}, model = "fmj"},
				{name = "Coquette Classic", costs = 300000, speed = 40, acce = 20, brake = 40, trac = 20, description = {}, model = "coquette2"},
			    {name = "Itali GTB Custom", costs = 800000, speed = 40, acce = 20, brake = 40, trac = 20, description = {}, model = "italigtb2"},
			    {name = "Nero Custom", costs = 1000000, speed = 40, acce = 20, brake = 40, trac = 20, description = {}, model = "nero2"},
				{name = "Nero", costs = 800000, speed = 40, acce = 20, brake = 40, trac = 20, description = {}, model = "nero"},
			    {name = "RE-7B", costs = 850000, speed = 40, acce = 20, brake = 40, trac = 20, description = {}, model = "le7b"},
			    {name = "Tempesta", costs = 950000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "tempesta"},
			    {name = "Turismo R", costs = 350000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "turismor"},
			    {name = "Tyrus", costs = 730000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "tyrus"},
			    {name = "Specter Custom", costs = 450000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "specter2"},
			    {name = "ETR1", costs = 700000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "sheava"},
			    {name = "811", costs = 500000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "pfister811"},
				{name = "Elegy", costs = 150000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "elegy"},
				{name = "GP1", costs = 150000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "gp1"},
				{name = "Cheetah", costs = 1300000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "cheetah"},
				{name = "Tampa", costs = 72000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "tampa"},
				{name = "Verkierer", costs = 110000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "verlierer2"},
				{name = "Infernus", costs = 250000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "infernus"},
				{name = "Lynx", costs = 170000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "lynx"},
				{name = "Vacca", costs = 340000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "vacca"},
				{name = "Zentorno", costs = 1500000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "zentorno"},
				{name = "X80 Proto", costs = 4500000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "prototipo"},
				{name = "Reaper", costs = 500000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "reaper"},

				{name = "XA21", costs = 1300000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "xa21"},


				{name = "Tesla 2020", costs = 4300000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "tr22"},

{name = "Lamborghini Huracan", costs = 274000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "huraperfospy"},
				{name = "Lamborghini Urus", costs = 475000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "urus2018"},
				{name = "Lamborghini Centenario", costs = 3378000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "lp770r"},
				{name = "Lamborghini Aventador", costs = 212000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "aventadors"},



			}
		},]]
		["Masini Scumpe"] = {
			title = "Masini Scumpe",
			name = "Masini Scumpe",
			buttons = {
				{name = "Bugatti Chiron", costs = 2950000, description = {}, model = "2017chiron"},
				{name = "Bugatti Veyron", costs = 1550000, description = {}, model = "bugatti"},
				{name = "Bugatti Divo", costs = 3100000, description = {}, model = "divo"},
				--{name = "Lamborghini Aventador", costs = 212000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "aventadors"},
				{name = "Porsche 718", costs = 90000, description = {}, model = "718"},
				{name = "Bentley", costs = 75000, description = {}, model = "urus"},
				{name = "McLaren 720", costs = 229000, description = {}, model = "720s"},
				{name = "Porsche Cayenne S", costs = 88991, description = {}, model = "pcs18"},
				{name = "Porsche Panamera", costs = 128401, description = {}, model = "panamera17turbo"},
				{name = "Porsche Cayman", costs = 125245, description = {}, model = "cayman16"},
				{name = "Porsche Monh", costs = 91000, description = {}, model = "63lb"},
				{name = "Rolls Royce Wraith", costs = 165000, description = {}, model = "wraith"},
				--{name = "Lamborghini Urus", costs = 71000, description = {}, model = "urus2018"},
				{name = "Viper Acr", costs = 51000, description = {}, model = "acr"},
				{name = "Tesla X", costs = 67000, description = {}, model = "teslax"},
				{name = "Tesla Model 3", costs = 76000, description = {}, model = "tmodel"},
				--{name = "Lamborghini Huracan", costs = 274000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "huraperfospy"},
				--{name = "Lamborghini Urus", costs = 475000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "urus2018"},
			--	{name = "Lamborghini Centenario", costs = 3378000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "lp770r"},
				--{name = "Lamborghini Aventador", costs = 212000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "aventadors"},
				{name = "Lamborghini Huracan", costs = 274000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "huraperfospy"},
				{name = "Lamborghini Urus", costs = 475000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "urus2018"},
				{name = "Lamborghini Centenario", costs = 371000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "lp770r"},
				{name = "Lamborghini Aventador", costs = 465000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "aventadors"},
				{name = "Porsche Macan", costs = 119567, speed = 60, acce = 50, brake = 40, trac = 40, description = {}, model = "macanpd600m"},
				{name = "Ferrari LaFerrari", costs = 2950000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "aperta"},
				{name = "Ferrari F8T", costs = 2950000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "f8t"},
				{name = "Nissan Skyline GT-R (R34)", costs = 60000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "skyline"},
				{name = "Aston Martin Cyrus", costs = 5000000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "cyrus"},
				{name = "Nissan Titan Warrior", costs = 500000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "warrior"},
				{name = "BRABUS 700 G63 AMG 6x6", costs = 500000, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "brabus700"},
				{name = "Ford Mustang 2015 GT", costs = 1500000, speed = 150, acce = 80, brake = 45, trac = 40, description = {}, model = "mgt"},
				{name = "Bentley Supersport 2017", costs = 2500000, speed = 315, acce = 150, brake = 80, trac = 80, description = {}, model = "ben17"},
			}
		},
		["Motociclete"] = {
			title = "Motociclete",
			name = "Motociclete",
			buttons = {
				{name = "BMW S1000", costs = 4500, description = {}, model = "bs17"},
			    {name = "Kawasaki KR", costs = 7500, description = {}, model = "kr150"},
			    {name = "Kawasaki KX450F", costs = 8100, description = {}, model = "kx450f"},
			   -- {name = "Kawasaki Z1000", costs = 9100, description = {}, model = "z1000"},
				{name = "Kawasaki Z1000", costs = 10000, description = {}, model = "z1000"},
				{name = "Yamaha YZF R6", costs = 10000, description = {}, model = "r6"},
				{name = "Harvey Motoclicleta", costs = 10000, description = {}, model = "hvrod"},
				{name = "Harley Davidson", costs = 50000, description = {}, model = "hvrod"},
				{name = "Suzuki GSXR1000 2014", costs = 150000, description = {}, model = "gsxr"},
			}
		},
		["bikes"] = {
			title = "bikes",
			name = "bikes",
			buttons = {
				{name = "BMX", costs = 5000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "bmx"},
				{name = "Fixter", costs = 2000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "Fixter"},
				{name = "TRIBIKE", costs = 50000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "tribike"},
				{name = "TRIBIKE2", costs = 50000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "tribike2"},
				{name = "TRIBIKE3", costs = 50000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "tribike3"},
				{name = "Mountain Bike", costs = 100000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "scorcher"},
			}
		},
		["suv-offroad"] = {
			title = "suv-offroad",
			name = "suv-offroad",
			buttons = {
			    {name = "Dubsta 6x6", costs = 800000, speed = 40, acce = 20, brake = 40, trac = 20, description = {}, model = "dubsta3"},
			    {name = "Jeep Trailcat", costs = 1000000, speed = 30, acce = 20, brake = 40, trac = 20, description = {}, model = "trailcat"},
			    {name = "Jeep Qiugejpa", costs = 200000, speed = 40, acce = 40, brake = 40, trac = 50, description = {}, model = "qiugejpa"},
				{name = "Mercedes-Benz G65", costs = 200000, speed = 65, acce = 40, brake = 50, trac = 60, description = {}, model = "G65"},
				{name = "Audi SQ7 2016", costs = 500000, speed = 40, acce = 40, brake = 40, trac = 20, description = {}, model = "SQ72016"},
				{name = "BMW X5 E53", costs = 300000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "x5e53"},
				{name = "Lamborghini Urus", costs = 6500000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "urus2018"},
				{name = "Range Rover", costs = 500000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "evoq"},
				{name = "Bentley Bentayga", costs = 650000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "urus"},
				{name = "Volvo V60", costs = 8000000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "vb60"},
				{name = "Nissan Patrol", costs = 200000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "patrold"},
				{name = "Nissan Titan", costs = 3000000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "nissantitan17"},
				{name = "Porche Cayenne S", costs = 500000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "pcs18"},
				{name = "Dubsta", costs = 400000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "dubsta"},
			}
		},
		["Mafie"] = {
			title = "Mafie",
			name = "Mafie",
			buttons = {
			    {name = "Maybach", costs = 1, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "exelero"},
				{name = "Jeep", costs = 1, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "demonhawk"},
				{name = "RR Sport", costs = 1, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "rsvr16"},
				{name = "Dodge", costs = 1, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "durango"},
				{name = "Phantom", costs = 1, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "rrphantom"},
			}
		},
		["Hitman"] = {
			title = "Hitman",
			name = "Hitman",
			buttons = {
			    {name = "Mercedes Limousine", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "alpha"},
				{name = "Cadillac Limousine", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "limoxts"},
				{name = "Hermes", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "hermes"},
				{name = "Hustler", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "hustler"},
				{name = "Z-type", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "ztype"},
				{name = "Havok", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "havok"},
				{name = "RollsRoyce Phantom", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "rrphantom"},
				{name = "Volatus", costs = 25000000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "volatus"},
			}
		},
		["Tiruri"] = {
			title = "Tiruri",
			name = "Tiruri",
			buttons = {
			    -- {name = "Kamaz 2012", costs = 200000, speed = 35, acce = 20, brake = 40, trac = 20, description = {}, model = "kamaz"},
				-- {name = "Kamaz 2017", costs = 1000000, speed = 40, acce = 30, brake = 40, trac = 30, description = {}, model = "k54115"},
				{name = "Camion Daf", costs = 3500, speed = 45, acce = 30, brake = 40, trac = 40, description = {}, model = "daf"},
				-- {name = "Man 2017", costs = 2800000, speed = 50, acce = 30, brake = 40, trac = 50, description = {}, model = "man"},
				-- {name = "Haul Master", costs = 5000000, speed = 55, acce = 30, brake = 40, trac = 60, description = {}, model = "haulmaster2"},
				-- {name = "Nav America", costs = 6000000, speed = 60, acce = 30, brake = 40, trac = 70, description = {}, model = "nav9800"},
				-- {name = "Phantom", costs = 6500000, speed = 65, acce = 30, brake = 40, trac = 80, description = {}, model = "phantom3"},
				-- {name = "MTL 2018", costs = 7000000, speed = 70, acce = 30, brake = 40, trac = 90, description = {}, model = "ramvan"},
			}
		},
		["thelostmc"] = {
			title = "The Lost Mc",
			name = "The Lost Mc",
			buttons = {
			    {name = "Deamon 1", costs = 85000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "deamon"},
				{name = "Deamon 2", costs = 90000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "deamon2"},
				{name = "Ruffian", costs = 74000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "ruffian"},
				{name = "Innovation", costs = 300000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "innovation"},
				{name = "Chimera", costs = 40000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "chimera"},
				{name = "Hexer", costs = 300000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "hexer"},
			}
		},
		["Masini Factiuni"] = {
			title = "Masini Factiuni",
			name = "Masini Factiuni",
			buttons = {
				{name = "Jandarmerie", description = ''},
				{name = "Politie", description = ''},
				-- {name = "Mafie", description = ""},
				{name = "Hitman", description = ''},
				--{name = "fisher", description = ''},
				--{name = "weazelnews", description = ''},
				{name = "ems", description = ''},
				{name = "Cartel Di Medellin", description = ''},
				--{name = "lawyer", description = ''},
				--{name = "delivery", description = ''},
				--{name = "repair", description = ''},
				--{name = "bankdriver", description = ''},
				--{name = "medicalweed", description = ''},
			}
		},
		["Politie"] = {
			title = "Politie",
			name = "Politie",
			buttons = {
				{name = "Duster", costs = 1, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "polduster"},
				{name = "Lexus", costs = 1, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "polgs350"},
				{name = "Maserati", costs = 1, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "ghispo2"},
				{name = "Bugatti Chiron", costs = 1, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "polchiron"},
			}
		},
		["Cartel Di Medellin"] = {
			title = "Cartel Di Medellin",
			name = "Cartel Di Medellin",
			buttons = {
			    {name = "Chevrolet K5", costs = 1, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "k5blazer"},
				{name = "Porsche Moby Dick", costs = 1, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "maj935"},
				{name = "Elicopter", costs = 1, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "maverick2"},
			}
		},
		["Jandarmerie"] = {
			title = "Jandarmerie",
			name = "Jandarmerie",
			buttons = {
				{name = "Nissan", costs = 1, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "sef_pfinder"},
				{name = "BMW", costs = 1, speed = 65, acce = 55, brake = 35, trac = 40, description = {}, model = "hwaycarstan"},
			}
		},
		
		["fisher"] = {
			title = "fisher",
			name = "fisher",
			buttons = {
				{name = "fisherboat", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "suntrap"},
			}
		},
		
		["weazelnews"] = {
			title = "weazelnews",
			name = "weazelnews",
			buttons = {
			{name = "Rumpo", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "rumpo"},
			{name = "News Van", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "newsvan"},
			{name = "News Maverick", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "maverick2"},
			}
		},
		
		["Hitman"] = {
			title = "Hitman",
			name = "Hitman",
			buttons = {
			    {name = "Bmw Hitman", costs = 1, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "m82020"},
				{name = "Ferrari Hitman", costs = 1, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "ferrari812"},
			--	{name = "Elicopter Hitman", costs = 1, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "airwolf"},
			}
		},
		["ems"] = {
			title = "ems",
			name = "ems",
			buttons = {
			    {name = "Ambulanta", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "ambulance"},
			}
		},
		
		["uber"] = {
			title = "uber",
			name = "uber",
			buttons = {
				{name = "Tesla", costs = 200000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "teslax"},
			}
		},
		
		["lawyer"] = {
			title = "lawyer",
			name = "lawyer",
			buttons = {
				{name = "lawyercar1", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "panto"},
			}
		},
		
		["delivery"] = {
			title = "delivery",
			name = "delivery",
			buttons = {
				{name = "deliverycar1", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "faggio3"},
				{name = "deliverycar2", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "c10custom"},
			}
		},
		
		["repair"] = {
			title = "repair",
			name = "repair",
			buttons = {
				{name = "repaircar1", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "towtruck"},
				{name = "repaircar2", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "utillitruck3"},
				{name = "Masina Tractare", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "flatbed"},
			}
		},
		
		["bankdriver"] = {
			title = "bankdriver",
			name = "bankdriver",
			buttons = {
				{name = "bankdrivercar1", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "stockade"},
			}
		},
		
		["medicalweed"] = {
			title = "medicalweed",
			name = "medicalweed",
			buttons = {
				{name = "medicalweedcar1", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "pony2"},
			}
		},
		["vip"] = {
			title = "vip",
			name = "vip",
			buttons = {
				{name = "Maybach Exelero", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "exelero"},
				{name = "Porsche 918", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "918"},
				{name = "Bugati Chiron", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "chiron17"},
				{name = "Devel Sixteen", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "develSix"},
				{name = "Chevrolet 1996", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "stingray66"},
				{name = "Jaguar C-X75", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "cx75"},
				{name = "Ferrari XXK", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "fxxk16"},
				{name = "Lamborghini Veneno", costs = 11000000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "veneno"},
				{name = "Dodge Charger", costs = 15000000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "rt70"},
				{name = "Alpine A110-50", costs = 3000000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "a11050"},
				{name = "Promod Stallion", costs = 5000000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "promod_stallion"},
				{name = "Shotaro", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "shotaro"},
				{name = "Swift Deluxe Gold", costs = 5000000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "swift2"},
				{name = "Luxor Deluxe Gold", costs = 5000000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "luxor2"},
				{name = "Ford 350 D", costs = 0, speed = 50, acce = 20, brake = 40, trac = 20,description = {}, model = "18f350d"},
			}
		},
		-----------------------------------------
		["aviation"] = {
			title = "aviation",
			name = "aviation",
			buttons = {
				{name = "avivip", description = ''},
				{name = "helivip", description = ''},
			}
		},
		["avivip"] = {
			title = "avivip",
			name = "avivip",
			buttons = {
				{name = "Besra", costs = 30000000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "besra"},
			}
		},
		["helivip"] = {
			title = "helivip",
			name = "helivip",
			buttons = {
				{name = "Swift Deluxe Gold", costs = 5000000, speed = 50, acce = 20, brake = 40, trac = 20, description = {}, model = "swift2"},
			}
		},

	}
}

local fakecar = {model = '', car = nil}
local vehshop_locations = {
{entering = {106.16832733154,6436.31640625,37.956546783448}, inside = {142.6277923584,6461.8432617188,31.763578414916}, outside = {134.8189086914,6444.3442382812,31.69010925293}},
}

local vehshop_blips ={}
local inrangeofvehshop = false
local currentlocation = nil
local boughtcar = false


function vehPrs_drawTxt(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function vehSR_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

function vehSR_IsPlayerInRangeOfVehshop()
	return inrangeofvehshop
end

local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
if firstspawn == 0 then
	--326 car blip 227 225
	vehSR_ShowVehshopBlips(true)
	firstspawn = 1
end
end)

function drawScreenText(x,y ,width,height,scale, text, r,g,b,a, outline, font, center)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
	SetTextCentre(center)
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function vehSR_ShowVehshopBlips(bool)
	if bool and #vehshop_blips == 0 then
		for station,pos in pairs(vehshop_locations) do
			local loc = pos
			pos = pos.entering
			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
			-- 60 58 137
			SetBlipSprite(blip,596)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("DealerShip")
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip,true)
			SetBlipAsMissionCreatorBlip(blip,true)
			table.insert(vehshop_blips, {blip = blip, pos = loc})
		end
		Citizen.CreateThread(function()
			while #vehshop_blips > 0 do
				Citizen.Wait(0)
				local inrange = false
				for i,b in ipairs(vehshop_blips) do
					if IsPlayerWantedLevelGreater(GetPlayerIndex(),0) == false and vehshop.opened == false and IsPedInAnyVehicle(vehSR_LocalPed(), true) == false and  GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(vehSR_LocalPed())) < 2.0 then
						drawScreenText(0.5, 0.93, 0,0, 0.7, "~w~Press ~r~[E] ~w~to enter the Delaership", 255, 255, 255, 230, 1, 4, 1)
						currentlocation = b
						inrange = true
					end
				end
				inrangeofvehshop = inrange
			end
		end)
	elseif bool == false and #vehshop_blips > 0 then
		for i,b in ipairs(vehshop_blips) do
			if DoesBlipExist(b.blip) then
				SetBlipAsMissionCreatorBlip(b.blip,false)
				Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
			end
		end
		vehshop_blips = {}
	end
end

vehSR_ShowVehshopBlips(true)

function vehSR_f(n)
	return n + 0.0001
end

function vehSR_LocalPed()
	return GetPlayerPed(-1)
end

function vehSR_try(f, catch_f)
	local status, exception = pcall(f)
	if not status then
		catch_f(exception)
	end
end
function vehSR_firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end
--local veh = nil
function vehSR_OpenCreator()
	boughtcar = false
	local ped = vehSR_LocalPed()
	local pos = currentlocation.pos.inside
	FreezeEntityPosition(ped,true)
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	SetEntityCoords(ped,pos[1],pos[2],g)
	SetEntityHeading(ped,pos[4])
	SetEntityVisible(ped,false)
	vehshop.currentmenu = "main"
	vehshop.opened = true
	vehshop.selectedbutton = 0
end

local vehicle_price = 0
function vehSR_CloseCreator(vehicle,veh_type)
	Citizen.CreateThread(function()
		local ped = vehSR_LocalPed()
		if not boughtcar then
			local pos = currentlocation.pos.entering
			SetEntityCoords(ped,pos[1],pos[2],pos[3])
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true)
			vRP.teleport({106.45190429688,6435.3681640625,37.956531524658})
			SetEntityHeading(ped, 180.0)
			scaleform = nil
		else
			deleteVehiclePedIsIn()
			vRP.teleport({106.45190429688,6435.3681640625,37.956531524658})
			SetEntityHeading(ped, 180.0)
			--vRPg.spawnBoughtVehicle({veh_type, vehicle})
			SetEntityVisible(ped,true)
			FreezeEntityPosition(ped,false)
		end
		vehshop.opened = false
		vehshop.menu.from = 1
		vehshop.menu.to = 10
	end)
end

function vehSR_drawMenuButton(button,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function vehSR_drawMenuTitle(txt,x,y)
local menu = vehshop.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	DrawText(x - menu.width/2 + 0.008, y - menu.height/2 + 0.0028)
end

simeonX, simeonY, simeonZ = 105.25566864014,6437.4545898438,37.956539154052


function DrawText3D(x,y,z, text, scl) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*scl
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end


Citizen.CreateThread(function()
	simeon = 1283141381
	RequestModel( simeon )
	while ( not HasModelLoaded( simeon ) ) do
		Citizen.Wait( 1 )
	end
	theSimeon = CreatePed(4, simeon, simeonX, simeonY, simeonZ-1, 90, false, false)
	SetModelAsNoLongerNeeded(simeon)
	SetEntityHeading(theSimeon, -140.0)
	FreezeEntityPosition(theSimeon, true)
	SetEntityInvincible(theSimeon, true)
	SetBlockingOfNonTemporaryEvents(theSimeon, true)
end)

Citizen.CreateThread(function()
	while true do
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		if(GetDistanceBetweenCoords(pos.x, pos.y, pos.z, simeonX, simeonY, simeonZ) < 5.5)then
			DrawText3D(simeonX, simeonY, simeonZ+1.15+0.20, "Simeon", 1.2)
			DrawText3D(simeonX, simeonY, simeonZ+1.15, "~w~[~g~Car Dealer~w~]", 1.2)
		end
		Citizen.Wait(0)
	end
end)


function vehSR_tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
function vehSR_Notify(text)
SetNotificationTextEntry('STRING')
AddTextComponentString(text)
DrawNotification(false, false)
end

function vehSR_drawMenuRight(txt,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 - 0.06, y - menu.height/2 + 0.0028)
end
scaleform = nil
function Initialize(scaleform, price, vehName, speed, acce, brake, trac)
	scaleform = RequestScaleformMovie(scaleform)
	while not HasScaleformMovieLoaded(scaleform) do
		Citizen.Wait(0)
	end
	PushScaleformMovieFunction(scaleform, "SET_VEHICLE_INFOR_AND_STATS")
	PushScaleformMovieFunctionParameterString(vehName)
	PushScaleformMovieFunctionParameterString(price)
	PushScaleformMovieFunctionParameterString("MPCarHUD")
	PushScaleformMovieFunctionParameterString("Benefactor")
	PushScaleformMovieFunctionParameterString("Speed")
	PushScaleformMovieFunctionParameterString("Acceleration")
	PushScaleformMovieFunctionParameterString("Brakes")
	PushScaleformMovieFunctionParameterString("Traction")
	PushScaleformMovieFunctionParameterInt(speed or 100)
	PushScaleformMovieFunctionParameterInt(acce or 100)
	PushScaleformMovieFunctionParameterInt(brake or 100)
	PushScaleformMovieFunctionParameterInt(trac or 100)
	PopScaleformMovieFunctionVoid()
	return scaleform
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if(fakecar.model ~= nil) and (scaleform ~= nil)then
			local x = 0.67
			local y = 0.52
			local width = 0.65
			local height = width / 0.68
			DrawScaleformMovie(scaleform, x, y, width, height)
		end
	end
end)

function showroom_drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

testDriveCar = nil
testDriveSeconds = 60
isInTestDrive = false
isInCar = false

function destroyTestDriveCar()
	if(testDriveCar ~= nil)then
		if(DoesEntityExist(testDriveCar))then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(testDriveCar))
		end
		testDriveCar = nil
		isInTestDrive = false
	end
	testDriveSeconds = 60
	vRP.teleport({134.8189086914,6444.3442382812,31.69010925293}) --Terminare drive
	SetEntityHeading(GetPlayerPed(-1), 180.0)
	vRP.notify({"~r~The test drive is over!"})
end

AddEventHandler("playerDropped", function()
	if(testDriveCar ~= nil)then
		destroyTestDriveCar()
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1100)
		if(testDriveCar ~= nil) and (isInTestDrive == false) then
			isInTestDrive = true
		else
			isInTestDrive = false
		end
		if(testDriveCar ~= nil)then
			local IsInVehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			if(IsInVehicle ~= nil)then
				if(testDriveCar == IsInVehicle)then
					if(testDriveSeconds > 0)then
						testDriveSeconds = testDriveSeconds - 1
					else
						destroyTestDriveCar()
					end
					isInCar = true
				else
					isInCar = false
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if(testDriveSeconds < 60)then
			showroom_drawTxt(1.30, 1.40, 1.0,1.0,0.35, "~g~TestDrive: ~r~"..testDriveSeconds.." ~y~Seconds", 255, 255, 255, 255)
		end
		if(isInTestDrive) then
			if(isInCar == false)then
				destroyTestDriveCar()
			end
		end
	end
end)

carPrice = "$0"
local backlock = false
Citizen.CreateThread(function()
	local last_dir
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1,46) and vehSR_IsPlayerInRangeOfVehshop() then
			if vehshop.opened then
				vehSR_CloseCreator("","")
			else
				vehSR_OpenCreator()
			end
		end
		if vehshop.opened then
			showroom_drawTxt(0.5, 1.073, 1.0,1.0,0.4, "~r~[ENTER] ~p~-> ~b~Cumpara Masina", 255, 255, 255, 255)
			showroom_drawTxt(0.5, 1.1, 1.0,1.0,0.4, "~r~[E] ~p~-> ~g~Arata Textura Masinii", 255, 255, 255, 255)
			showroom_drawTxt(0.5, 1.13, 1.0,1.0,0.4, "~r~[F] ~p~-> ~y~Testeaza Masina", 255, 255, 255, 255)
			local ped = vehSR_LocalPed()
			local menu = vehshop.menu[vehshop.currentmenu]
			vehSR_drawTxt(vehshop.title,1,1,vehshop.menu.x,vehshop.menu.y,1.0, 255,255,255,255)
			vehSR_drawMenuTitle(menu.title, vehshop.menu.x,vehshop.menu.y + 0.08)
			vehSR_drawTxt(vehshop.selectedbutton.."/"..vehSR_tablelength(menu.buttons),0,0,vehshop.menu.x + vehshop.menu.width/2 - 0.0385,vehshop.menu.y + 0.067,0.4, 255,255,255,255)
			local y = vehshop.menu.y + 0.12
			buttoncount = vehSR_tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= vehshop.menu.from and i <= vehshop.menu.to then

					if i == vehshop.selectedbutton then
						selected = true
					else
						selected = false
					end
					vehSR_drawMenuButton(button,vehshop.menu.x,y,selected)
					if button.costs ~= nil then
						if vehshop.currentmenu == "Audi" or vehshop.currentmenu == "BMW" or vehshop.currentmenu == "suv-offroad" or vehshop.currentmenu == "Mafie" or vehshop.currentmenu == "Hitman" or vehshop.currentmenu == "Tiruri" or vehshop.currentmenu == "thelostmc" or vehshop.currentmenu == "Mercede-Benz" or vehshop.currentmenu == "ferrari" or vehshop.currentmenu == "fast-and-furios" or vehshop.currentmenu == "Dacia" or vehshop.currentmenu == "lamborghini" or vehshop.currentmenu == "Aston Martin" or vehshop.currentmenu == "Porche" or vehshop.currentmenu == "Toyota" or vehshop.currentmenu == "Masini" or vehshop.currentmenu == "bikes" or vehshop.currentmenu == "Masini Scumpe" or vehshop.currentmenu == "Motociclete" or vehshop.currentmenu == "Politie" or vehshop.currentmenu == "Hitman" or vehshop.currentmenu == "fisher" or vehshop.currentmenu == "weazelnews" or vehshop.currentmenu == "ems" or vehshop.currentmenu == "Cartel Di Medellin" or vehshop.currentmenu == "lawyer" or vehshop.currentmenu == "delivery" or vehshop.currentmenu == "repair" or vehshop.currentmenu == "bankdriver" or vehshop.currentmenu == "medicalweed" or vehshop.currentmenu == "vip" or vehshop.currentmenu == "avivip" or vehshop.currentmenu == "helivip" or vehshop.currentmenu == "Jandarmerie" then
							vehSR_drawMenuRight("$"..button.costs,vehshop.menu.x,y,selected)
							carPrice = "$"..button.costs
						else
							vehSR_drawMenuButton(button,vehshop.menu.x,y,selected)
						end
					end
					y = y + 0.04
					if vehshop.currentmenu == "Audi" or vehshop.currentmenu == "BMW" or vehshop.currentmenu == "suv-offroad" or vehshop.currentmenu == "Mafie" or vehshop.currentmenu == "Hitman" or vehshop.currentmenu == "Tiruri" or vehshop.currentmenu == "thelostmc" or vehshop.currentmenu == "Mercede-Benz" or vehshop.currentmenu == "ferrari" or vehshop.currentmenu == "fast-and-furios" or vehshop.currentmenu == "Dacia" or vehshop.currentmenu == "lamborghini" or vehshop.currentmenu == "Aston Martin" or vehshop.currentmenu == "Porche" or vehshop.currentmenu == "Toyota" or vehshop.currentmenu == "Masini" or vehshop.currentmenu == "bikes" or vehshop.currentmenu == "Masini Scumpe" or vehshop.currentmenu == "Motociclete" or vehshop.currentmenu == "Politie" or vehshop.currentmenu == "Hitman" or vehshop.currentmenu == "fisher" or vehshop.currentmenu == "weazelnews" or vehshop.currentmenu == "ems" or vehshop.currentmenu == "Cartel Di Medellin" or vehshop.currentmenu == "lawyer" or vehshop.currentmenu == "delivery" or vehshop.currentmenu == "repair" or vehshop.currentmenu == "bankdriver" or vehshop.currentmenu == "medicalweed" or vehshop.currentmenu == "vip" or vehshop.currentmenu == "avivip" or vehshop.currentmenu == "helivip" or vehshop.currentmenu == "Jandarmerie"  then
						if selected then
							hash = GetHashKey(button.model)
							if IsControlJustPressed(1,23) then
								if(testDriveCar == nil)then
									if DoesEntityExist(fakecar.car) then
										Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
										scaleform = nil
									end
									fakecar = {model = '', car = nil}
									while not HasModelLoaded(hash) do
										RequestModel(hash)
										Citizen.Wait(10)
										showroom_drawTxt(0.935, 0.575, 1.0,1.0,0.4, "~r~LOADING VEHICLE TEXTURE", 255, 255, 255, 255)
									end
									if HasModelLoaded(hash) then
										testDriveCar = CreateVehicle(hash,-914.83026123046,-3287.1538085938,13.521618843078,60.962993621826,false,false)
										SetModelAsNoLongerNeeded(hash)
										TaskWarpPedIntoVehicle(GetPlayerPed(-1),testDriveCar,-1)
										vRP.notify({"~g~You have ~r~1 Minute~g~ to test drive this vehicle!"})
										for i = 0,24 do
											SetVehicleModKit(testDriveCar,0)
											RemoveVehicleMod(testDriveCar,i)
										end
										if(testDriveCar)then
											vehshop.opened = false
											vehshop.menu.from = 1
											vehshop.menu.to = 10
											SetEntityVisible(GetPlayerPed(-1),true)
											FreezeEntityPosition(GetPlayerPed(-1),false)
											scaleform = nil
										end
									end
								end
							end
							if fakecar.model ~= button.model then
								if IsControlJustPressed(1,38) then
									if DoesEntityExist(fakecar.car) then
										Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
										scaleform = nil
									end
									local pos = currentlocation.pos.inside									
									local i = 0
									while not HasModelLoaded(hash) and i < 500 do
										RequestModel(hash)
										Citizen.Wait(10)
										i = i+1
										showroom_drawTxt(0.935, 0.575, 1.0,1.0,0.4, "~r~LOADING VEHICLE TEXTURE", 255, 255, 255, 255)
									end

									-- spawn car
									if HasModelLoaded(hash) then
									--if timer < 255 then
										veh = CreateVehicle(hash,pos[1],pos[2],pos[3],pos[4],false,false)
										FreezeEntityPosition(veh,true)
										SetEntityInvincible(veh,true)
										SetVehicleDoorsLocked(veh,4)
										SetModelAsNoLongerNeeded(hash)
										--SetEntityCollision(veh,false,false)
										TaskWarpPedIntoVehicle(vehSR_LocalPed(),veh,-1)
										for i = 0,24 do
											SetVehicleModKit(veh,0)
											RemoveVehicleMod(veh,i)
										end
										fakecar = { model = button.model, car = veh}
										Citizen.CreateThread(function()
											while DoesEntityExist(veh) do
												Citizen.Wait(25)
												SetEntityHeading(veh, GetEntityHeading(veh)+1 %360)
											end
										end)

										scaleform = Initialize("mp_car_stats_01", carPrice, button.name, button.speed, button.acce, button.brake, button.trac)
									else
										if last_dir then
											if vehshop.selectedbutton < buttoncount then
												vehshop.selectedbutton = vehshop.selectedbutton +1
												if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
													vehshop.menu.to = vehshop.menu.to + 1
													vehshop.menu.from = vehshop.menu.from + 1
												end
											else
												last_dir = false
												vehshop.selectedbutton = vehshop.selectedbutton -1
												if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
													vehshop.menu.from = vehshop.menu.from -1
													vehshop.menu.to = vehshop.menu.to - 1
												end
											end
										else
											if vehshop.selectedbutton > 1 then
												vehshop.selectedbutton = vehshop.selectedbutton -1
												if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
													vehshop.menu.from = vehshop.menu.from -1
													vehshop.menu.to = vehshop.menu.to - 1
												end
											else
												last_dir = true
												vehshop.selectedbutton = vehshop.selectedbutton +1
												if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
													vehshop.menu.to = vehshop.menu.to + 1
													vehshop.menu.from = vehshop.menu.from + 1
												end
											end
										end
									end
								end
							end
						end
					end
					if selected and IsControlJustPressed(1,201) then
						vehSR_ButtonSelected(button)
					end
				end
			end
			if IsControlJustPressed(1,202) then
				vehSR_Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				last_dir = false
				if vehshop.selectedbutton > 1 then
					vehshop.selectedbutton = vehshop.selectedbutton -1
					if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
						vehshop.menu.from = vehshop.menu.from -1
						vehshop.menu.to = vehshop.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				last_dir = true
				if vehshop.selectedbutton < buttoncount then
					vehshop.selectedbutton = vehshop.selectedbutton +1
					if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
						vehshop.menu.to = vehshop.menu.to + 1
						vehshop.menu.from = vehshop.menu.from + 1
					end
				end
			end
		end

	end
end)


function drawscreentext(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(8)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

function vehSR_round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end

function vehSR_ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = vehshop.currentmenu
	local btn = button.name
	if this == "main" then
		if btn == "Masini" then
			vehSR_OpenMenu('Masini')
		elseif btn == "suv-offroad" then
			vehSR_OpenMenu('suv-offroad')
		elseif btn == "bikes" then
			vehSR_OpenMenu('bikes')
		elseif btn == "Motociclete" then
			vehSR_OpenMenu('Motociclete')
		elseif btn == "Masini Factiuni" then
			vehSR_OpenMenu('Masini Factiuni')
		elseif btn == "Mafie" then
			vehSR_OpenMenu('Mafie')
		elseif btn == "Hitman" then
			vehSR_OpenMenu('Hitman')
		elseif btn == "Tiruri" then
			vehSR_OpenMenu('Tiruri')
	    elseif btn == "thelostmc" then
		    vehSR_OpenMenu('thelostmc')
		elseif btn == "vip" then
			vehSR_OpenMenu('vip')
		elseif btn == "aviation" then
			vehSR_OpenMenu('aviation')
		elseif btn == "Masini Scumpe" then
			vehSR_OpenMenu('Masini Scumpe')
		end
	elseif this == "Masini" then
		if btn == "Audi" then
			vehSR_OpenMenu('Audi')
		elseif btn == "BMW" then
			vehSR_OpenMenu('BMW')
		elseif btn == "Mercede-Benz" then
			vehSR_OpenMenu('Mercede-Benz')
		elseif btn == "ferrari" then
			vehSR_OpenMenu('ferrari')
		elseif btn == "fast-and-furios" then
			vehSR_OpenMenu('fast-and-furios')
		elseif btn == "Dacia" then
			vehSR_OpenMenu("Dacia")
		elseif btn == "Mafie" then
			vehSR_OpenMenu('Mafie')
		elseif btn == "lamborghini" then
			vehSR_OpenMenu('lamborghini')
		elseif btn == "Aston Martin" then
			vehSR_OpenMenu('Aston Martin')
		elseif btn == "Porche" then
			vehSR_OpenMenu('Porche')
		elseif btn == "Toyota" then
			vehSR_OpenMenu('Toyota')
		elseif btn == "Masini" then
			vehSR_OpenMenu('Masini')
		elseif btn == "Masini Scumpe" then
			vehSR_OpenMenu('Masini Scumpe')
		end
	elseif this == "Masini Factiuni" then
		if btn == "Jandarmerie" then
			vehSR_OpenMenu('Jandarmerie')
		elseif btn == "Politie" then
			vehSR_OpenMenu('Politie')
		elseif btn == "Mafie" then
			vehSR_OpenMenu('Mafie')
		elseif btn == "Hitman" then
			vehSR_OpenMenu('Hitman')
		elseif btn == "fisher" then
			vehSR_OpenMenu('fisher')
		elseif btn == "weazelnews" then
			vehSR_OpenMenu('weazelnews')
		elseif btn == "ems" then
			vehSR_OpenMenu('ems')
		elseif btn == "Cartel Di Medellin" then
			vehSR_OpenMenu('Cartel Di Medellin')
		elseif btn == "lawyer" then
			vehSR_OpenMenu('lawyer')
		elseif btn == "delivery" then
			vehSR_OpenMenu("delivery")
		elseif btn == "repair" then
			vehSR_OpenMenu('repair')
		elseif btn == "bankdriver" then
			vehSR_OpenMenu('bankdriver')
		elseif btn == "medicalweed" then
			vehSR_OpenMenu('medicalweed')
		end
	elseif this == "aviation" then
		if btn == "avivip" then
			vehSR_OpenMenu('avivip')
		elseif btn == "helivip" then
			vehSR_OpenMenu('helivip')
		end
	elseif this == "Audi" or this == "BMW" or this == "suv-offroad" or this == "Mercede-Benz" or this == "ferrari" or this == "Mafie" or this == "Hitman" or this == "Tiruri" or this == "thelostmc" or this == "fast-and-furios" or this == "Dacia" or this == "lamborghini" or this == "Aston Martin" or this == "Porche" or this == "Toyota" or this == "Masini" or this == "bikes" or this == "Masini Scumpe" or this == "Politie" or this == "Jandarmerie" or this == "Hitman" or this == "fisher" or this == "weazelnews" or this == "ems" or this == "Cartel Di Medellin" or this == "lawyer" or this == "delivery" or this == "repair" or this == "bankdriver" or this == "medicalweed" or this == "vip" or this == "avivip" or this == "helivip" or this == "Jandarmerie" then
		vehshop.opened = false
		
		if DoesEntityExist(fakecar.car) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
			scaleform = nil
		end
		local pos = currentlocation.pos.inside									
		local i = 0
		while not HasModelLoaded(hash) and i < 500 do
			RequestModel(hash)
			Citizen.Wait(10)
			i = i+1
			showroom_drawTxt(0.935, 0.575, 1.0,1.0,0.4, "~r~LOADING VEHICLE TEXTURE", 255, 255, 255, 255)
		end

		if HasModelLoaded(hash) then
			veh = CreateVehicle(hash,pos[1],pos[2],pos[3],pos[4],false,false)
			FreezeEntityPosition(veh,true)
			SetEntityInvincible(veh,true)
			SetVehicleDoorsLocked(veh,4)
			SetModelAsNoLongerNeeded(hash)
			TaskWarpPedIntoVehicle(vehSR_LocalPed(),veh,-1)
			for i = 0,24 do
				SetVehicleModKit(veh,0)
				RemoveVehicleMod(veh,i)
			end
			fakecar = { model = button.model, car = veh}
			Citizen.CreateThread(function()
				while DoesEntityExist(veh) do
					Citizen.Wait(25)
					SetEntityHeading(veh, GetEntityHeading(veh)+1 %360)
				end
			end)
			scaleform = Initialize("mp_car_stats_01", carPrice, button.name, button.speed, button.acce, button.brake, button.trac)
		else
			if last_dir then
				if vehshop.selectedbutton < buttoncount then
					vehshop.selectedbutton = vehshop.selectedbutton +1
					if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
						vehshop.menu.to = vehshop.menu.to + 1
						vehshop.menu.from = vehshop.menu.from + 1
					end
				else
					last_dir = false
					vehshop.selectedbutton = vehshop.selectedbutton -1
					if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
						vehshop.menu.from = vehshop.menu.from -1
						vehshop.menu.to = vehshop.menu.to - 1
					end
				end
			else
				if vehshop.selectedbutton > 1 then
					vehshop.selectedbutton = vehshop.selectedbutton -1
					if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
						vehshop.menu.from = vehshop.menu.from -1
						vehshop.menu.to = vehshop.menu.to - 1
					end
				else
					last_dir = true
					vehshop.selectedbutton = vehshop.selectedbutton +1
					if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
						vehshop.menu.to = vehshop.menu.to + 1
						vehshop.menu.from = vehshop.menu.from + 1
					end
				end
			end
		end


		Citizen.CreateThread(function()
			while true do
				ShowCursorThisFrame()
				DisableControlAction(0,24,true)
				DisableControlAction(0,47,true)
				DisableControlAction(0,58,true)
				DisableControlAction(0,263,true)
				DisableControlAction(0,264,true)
				DisableControlAction(0,257,true)
				DisableControlAction(0,140,true)
				DisableControlAction(0,141,true)
				DisableControlAction(0,142,true)
				DisableControlAction(0,143,true)
				DisableControlAction(0, 1, true)
				DisableControlAction(0, 2, true)
				DisableControlAction(0, 27, true)
				DisableControlAction(0, 172, true)
				DisableControlAction(0, 173, true)
				DisableControlAction(0, 174, true)
				DisableControlAction(0, 175, true)
				DisableControlAction(0, 176, true)
				DisableControlAction(0, 177, true)

				backlock = true

				local CuloareButoane = {
					OK = {68, 68, 68},
					NotOK = {68, 68, 68}
				}

				CuloareButoane.OK = {68, 68, 68}
				CuloareButoane.NotOK = {68, 68, 68}

				if isCursorInPosition(0.550,0.568,0.065,0.035) then
					SetCursorSprite(5)
					CuloareButoane.OK = {9, 114, 189}
					if(IsDisabledControlJustPressed(0, 24))then
						local ante = button.costs
						if button.reducere then
							button.costs = math.floor(button.costs / 2)
						end
						TriggerServerEvent('veh_SR:CheckMoneyForVeh',this,button.model,button.costs,"car",button.name,false,false)
						button.costs = ante
						break
					end
				elseif isCursorInPosition(0.430,0.568,0.065,0.035) then 
					SetCursorSprite(5)
					CuloareButoane.NotOK = {9, 114, 189}
					if(IsDisabledControlJustPressed(0, 24))then
						if DoesEntityExist(fakecar.car) then
							Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
							scaleform = nil
						end
						fakecar = {model = '', car = nil}

						vehshop.opened = true
						break
					end
				else
					SetCursorSprite(1)
				end

				DrawRect(0.49,0.45,0.30,0.30,0,0,0,150)
				DrawRect(0.49,0.30,0.30,0.03,9, 114, 189, 180)

				drawscreentext("Buy Vehicle",6,0,0.46,0.286,0.455,255,255,255,255)
				drawscreentext("Are you sure that you want to buy this vehicle ?",6,0,0.40,0.370,0.45,255,255,255,255)
				drawscreentext("~g~"..string.upper(button.name).." ~w~ for ~r~ "..vRP.formatMoney({button.costs}).. " $",6,0,0.427,0.445,0.45,255,255,255,255)

				DrawRect(0.430,0.568,0.065,0.035,CuloareButoane.NotOK[1],CuloareButoane.NotOK[2],CuloareButoane.NotOK[3], 180)
				drawscreentext("~r~NO",4,0,0.425,0.553,0.4,48,28,119, 255, 0)

				DrawRect(0.550,0.568,0.065,0.035,CuloareButoane.OK[1],CuloareButoane.OK[2],CuloareButoane.OK[3], 180)
				drawscreentext("~g~YES",4,0,0.545,0.553,0.4,48,28,119, 255, 0)
				Citizen.Wait(0)
			end
		end)
	elseif  this == "Motociclete" then
		vehshop.opened = false
		
		if DoesEntityExist(fakecar.car) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
			scaleform = nil
		end
		local pos = currentlocation.pos.inside									
		local i = 0
		while not HasModelLoaded(hash) and i < 500 do
			RequestModel(hash)
			Citizen.Wait(10)
			i = i+1
			showroom_drawTxt(0.935, 0.575, 1.0,1.0,0.4, "~r~LOADING VEHICLE TEXTURE", 255, 255, 255, 255)
		end

		if HasModelLoaded(hash) then
			veh = CreateVehicle(hash,pos[1],pos[2],pos[3],pos[4],false,false)
			FreezeEntityPosition(veh,true)
			SetEntityInvincible(veh,true)
			SetVehicleDoorsLocked(veh,4)
			SetModelAsNoLongerNeeded(hash)
			TaskWarpPedIntoVehicle(vehSR_LocalPed(),veh,-1)
			for i = 0,24 do
				SetVehicleModKit(veh,0)
				RemoveVehicleMod(veh,i)
			end
			fakecar = { model = button.model, car = veh}
			Citizen.CreateThread(function()
				while DoesEntityExist(veh) do
					Citizen.Wait(25)
					SetEntityHeading(veh, GetEntityHeading(veh)+1 %360)
				end
			end)
			scaleform = Initialize("mp_car_stats_01", carPrice, button.name, button.speed, button.acce, button.brake, button.trac)
		else
			if last_dir then
				if vehshop.selectedbutton < buttoncount then
					vehshop.selectedbutton = vehshop.selectedbutton +1
					if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
						vehshop.menu.to = vehshop.menu.to + 1
						vehshop.menu.from = vehshop.menu.from + 1
					end
				else
					last_dir = false
					vehshop.selectedbutton = vehshop.selectedbutton -1
					if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
						vehshop.menu.from = vehshop.menu.from -1
						vehshop.menu.to = vehshop.menu.to - 1
					end
				end
			else
				if vehshop.selectedbutton > 1 then
					vehshop.selectedbutton = vehshop.selectedbutton -1
					if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
						vehshop.menu.from = vehshop.menu.from -1
						vehshop.menu.to = vehshop.menu.to - 1
					end
				else
					last_dir = true
					vehshop.selectedbutton = vehshop.selectedbutton +1
					if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
						vehshop.menu.to = vehshop.menu.to + 1
						vehshop.menu.from = vehshop.menu.from + 1
					end
				end
			end
		end


		Citizen.CreateThread(function()
			while true do
				ShowCursorThisFrame()
				DisableControlAction(0,24,true)
				DisableControlAction(0,47,true)
				DisableControlAction(0,58,true)
				DisableControlAction(0,263,true)
				DisableControlAction(0,264,true)
				DisableControlAction(0,257,true)
				DisableControlAction(0,140,true)
				DisableControlAction(0,141,true)
				DisableControlAction(0,142,true)
				DisableControlAction(0,143,true)
				DisableControlAction(0, 1, true)
				DisableControlAction(0, 2, true)
				DisableControlAction(0, 27, true)
				DisableControlAction(0, 172, true)
				DisableControlAction(0, 173, true)
				DisableControlAction(0, 174, true)
				DisableControlAction(0, 175, true)
				DisableControlAction(0, 176, true)
				DisableControlAction(0, 177, true)

				backlock = true

				local CuloriButon = {
					DA = {68, 68, 68},
					Anuleaza = {68, 68, 68}
				}

				CuloriButon.DA = {68, 68, 68}
				CuloriButon.Anuleaza = {68, 68, 68}

				if isCursorInPosition(0.550,0.568,0.065,0.035) then
					SetCursorSprite(5)
					CuloriButon.DA = {9, 114, 189}
					if(IsDisabledControlJustPressed(0, 24))then
						local ante = button.costs
						if button.reducere then
							button.costs = math.floor(button.costs / 2)
						end
						TriggerServerEvent('veh_SR:CheckMoneyForVeh',this,button.model,button.costs,"bike",false,false)
						button.costs = ante
						break
					end
				elseif isCursorInPosition(0.430,0.568,0.065,0.035) then 
					SetCursorSprite(5)
					CuloriButon.Anuleaza = {9, 114, 189}
					if(IsDisabledControlJustPressed(0, 24))then
						if DoesEntityExist(fakecar.car) then
							Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
							scaleform = nil
						end
						fakecar = {model = '', car = nil}

						vehshop.opened = true
						break
					end
				else
					SetCursorSprite(1)
				end

				DrawRect(0.49,0.45,0.30,0.30,0,0,0,150)
				DrawRect(0.49,0.30,0.30,0.03,9, 114, 189, 180)

				drawscreentext("Buy Vehicle",6,0,0.46,0.286,0.455,255,255,255,255)
				drawscreentext("Are you sure that you want to buy this vehicle ?",6,0,0.40,0.370,0.45,255,255,255,255)
				drawscreentext("~g~"..string.upper(button.name).." ~w~ for ~r~ "..vRP.formatMoney({button.costs}).. " $",6,0,0.427,0.445,0.45,255,255,255,255)

				DrawRect(0.430,0.568,0.065,0.035,CuloriButon.Anuleaza[1],CuloriButon.Anuleaza[2],CuloriButon.Anuleaza[3], 180)
				drawscreentext("~r~NO",4,0,0.425,0.553,0.4,48,28,119, 255, 0)

				DrawRect(0.550,0.568,0.065,0.035,CuloriButon.DA[1],CuloriButon.DA[2],CuloriButon.DA[3], 180)
				drawscreentext("~g~YES",4,0,0.545,0.553,0.4,48,28,119, 255, 0)
				Citizen.Wait(0)
			end
		end)
		
	end
end

RegisterNetEvent('veh_SR:CloseMenu')
AddEventHandler('veh_SR:CloseMenu', function(vehicle, veh_type)
	boughtcar = true
	vehSR_CloseCreator(vehicle,veh_type)
	scaleform = nil
end)

function vehSR_OpenMenu(menu)
	fakecar = {model = '', car = nil}
	vehshop.lastmenu = vehshop.currentmenu
	if menu == "Masini" then
		vehshop.lastmenu = "main"
	elseif menu == "suv-offroad"  then
		vehshop.lastmenu = "main"
	elseif menu == "Motociclete"  then
		vehshop.lastmenu = "main"
	elseif menu == "Mafie"  then
		vehshop.lastmenu = "main"
	elseif menu == "Hitman"  then
		vehshop.lastmenu = "main"
	elseif menu == "Tiruri"  then
		vehshop.lastmenu = "main"
	elseif menu == "thelostmc"  then
		vehshop.lastmenu = "main"
    elseif menu == "bikes"  then
		vehshop.lastmenu = "main"
	elseif menu == "Masini Factiuni"  then
		vehshop.lastmenu = "main"
	elseif menu == "vip"  then
		vehshop.lastmenu = "main"
	elseif menu == "aviation"  then
		vehshop.lastmenu = "main"
	elseif menu == 'race_create_objects' then
		vehshop.lastmenu = "main"
	elseif menu == "race_create_objects_spawn" then
		vehshop.lastmenu = "race_create_objects"
	end
	vehshop.menu.from = 1
	vehshop.menu.to = 10
	vehshop.selectedbutton = 0
	vehshop.currentmenu = menu
end


function vehSR_Back()
	if backlock then
		return
	end
	backlock = true
	if vehshop.currentmenu == "main" then
		vehSR_CloseCreator("","")
	elseif vehshop.currentmenu == "Audi" or vehshop.currentmenu == "BMW" or vehshop.currentmenu == "suv-offroad" or vehshop.currentmenu == "Mafie" or vehshop.currentmenu == "Hitman" or vehshop.currentmenu == "Tiruri" or vehshop.currentmenu == "thelostmc" or vehshop.currentmenu == "Mercede-Benz" or vehshop.currentmenu == "ferrari" or vehshop.currentmenu == "fast-and-furios" or vehshop.currentmenu == "Dacia" or vehshop.currentmenu == "lamborghini" or vehshop.currentmenu == "Aston Martin" or vehshop.currentmenu == "Porche" or vehshop.currentmenu == "Toyota" or vehshop.currentmenu == "Masini" or vehshop.currentmenu == "bikes" or vehshop.currentmenu == "Masini Scumpe" or vehshop.currentmenu == "Motociclete" or vehshop.currentmenu == "Politie" or vehshop.currentmenu == "Jandarmerie" or vehshop.currentmenu == "fisher" or vehshop.currentmenu == "weazelnews" or vehshop.currentmenu == "Hitman" or vehshop.currentmenu == "ems" or vehshop.currentmenu == "Cartel Di Medellin" or vehshop.currentmenu == "lawyer" or vehshop.currentmenu == "delivery" or vehshop.currentmenu == "repair" or vehshop.currentmenu == "bankdriver" or vehshop.currentmenu == "medicalweed" or vehshop.currentmenu == "vip" or vehshop.currentmenu == "aviation" then
		if DoesEntityExist(fakecar.car) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
			scaleform = nil
		end
		fakecar = {model = '', car = nil}
		vehSR_OpenMenu(vehshop.lastmenu)
	else
		vehSR_OpenMenu(vehshop.lastmenu)
	end

end


function vehSR_stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

RegisterNetEvent('meniu')
AddEventHandler('meniu', function()
	vehshop.opened = true
end)



function drawscreentext(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end


function info(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(0.45, 0.45)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end