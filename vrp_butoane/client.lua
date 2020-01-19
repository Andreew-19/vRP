vRPN = {}
Tunnel.bindInterface("vrp_names",vRPN)
Proxy.addInterface("vrp_names",vRPN)
vRPserver = Tunnel.getInterface("vRP","vRP_names")
vRP = Proxy.getInterface("vRP")

local playerNames = {}
local names = {}
local permissions = {}
local groups = {}

local VeziNumeleTau = true
local thirst = 0
local hunger = 0

local arataHud = true
local recoilHud = false


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

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		drawScreenText(0.5, 0.976, 0,0, 0.25, "Apasa ~r~[virgula] ~w~pentru cursor", 255, 255, 255, 230, 1, 0, 1)
	end
end)

discordText = "Discord Fantasy"
ipText = "I.P Server"

isCursor = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local discordAlpha = 180
		local ipAlpha = 180
		
		if(arataHud)then
			ascundeHudAlpha = 255
		else
			ascundeHudAlpha = 180
		end
		if(VeziNumeleTau)then
			hideNameAlpha = 255
		else
			hideNameAlpha = 180
		end
		
		if(isCursor)then		
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
			
			if(arataHud)then
				if(vRP.isCursorInPosition({0.792, 0.02, 0.02, 0.03}))then
					SetCursorSprite(5)
					if(VeziNumeleTau)then
						vRP.showToolTip({"Ascunde numele jucatorilor"})
					else
						vRP.showToolTip({"Arata numele jucatorilor"})
					end
					if(IsDisabledControlJustPressed(0, 24))then
						VeziNumeleTau = not VeziNumeleTau
					end
				elseif(vRP.isCursorInPosition({0.867,0.02, 0.02,0.03}))then
					SetCursorSprite(5)
					if(arataHud)then
						vRP.showToolTip({"Ascunde HUD - UL"})
					else
						vRP.showToolTip({"Arata HUD - UL"})
					end
					if(IsDisabledControlJustPressed(0, 24))then
						arataHud = not arataHud
					end
				elseif(vRP.isCursorInPosition({0.844,0.020,0.017,0.026}))then
					SetCursorSprite(5)
					vRP.showToolTip({discordText})
					discordAlpha = 255
					if(IsDisabledControlJustPressed(0, 24))then
						discordText = "Invite Link Copiat!"
						vRP.SetClipboard("https://discord.io/fantasyrp")
						SetTimeout(1500, function()
							discordText = "Discord Fantasy"
						end)
					end
				elseif(vRP.isCursorInPosition({0.820,0.020,0.017,0.026}))then
					SetCursorSprite(5)
					vRP.showToolTip({ipText})
					ipAlpha = 255
					if(IsDisabledControlJustPressed(0, 24))then
						ipText = "I.P Server Copiat!"
						vRP.SetClipboard("185.244.151.16:30376")
						SetTimeout(1500, function()
							ipText = "I.P Server"
						end)
					end
				else
					SetCursorSprite(1)
				end
			else
				if(vRP.isCursorInPosition({0.867,0.02,0.02,0.03}))then
					SetCursorSprite(5)
					if(arataHud)then
						vRP.showToolTip({"Ascunde HUD - UL"})
					else
						vRP.showToolTip({"Arata HUD - UL"})
					end
					if(IsDisabledControlJustPressed(0, 24))then
						arataHud = not arataHud
					end
				else
					SetCursorSprite(1)
				end
			end
		end
		if(arataHud)then
			DrawSprite("alcohol", "alcohol", 0.795, 0.019, 0.022, 0.032, 0.0, 255, 255, 255, hideNameAlpha)
			DrawSprite("hideHudG", "hideHudG",0.867, 0.021, 0.02, 0.03, 0.0, 255, 255, 255, ascundeHudAlpha)
			DrawSprite("discordIcon", "discordIcon", 0.844, 0.021, 0.017, 0.024, 0.0, 255, 255, 255, discordAlpha)
			DrawSprite("ipIcon", "ipIcon", 0.820, 0.02, 0.017, 0.026, 0.0, 255, 255, 255, ipAlpha)
		else
			DrawSprite("hideHud", "hideHud",0.867, 0.02, 0.02, 0.03, 0.0, 255, 255, 255, ascundeHudAlpha)
		end
		
		if(IsControlJustPressed(1, 82))then
			isCursor = not isCursor
		end
	end
end)


function vRP.SetClipboard(text)	
	SendNUIMessage({
		text = text
	})
end



function drawHudText(x,y ,width,height,scale, text, r,g,b,a, outline, font, centre)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
	SetTextCentre(centre)
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end


RegisterNetEvent("showOwnName")
AddEventHandler("showOwnName", function()
	VeziNumeleTau = not VeziNumeleTau
end)

function vRPN.getHudStatus()
	return showHud
end


-- function vRPN.insertUser(user_id,source,name,admin,vip,thirst,show)
-- 	playerNames[user_id] = {thePlayer = GetPlayerFromServerId(source), theName = name, showName = show, adminRank = admin, vipRank = vip, thirst = thirst}
-- end

function vRPN.insertUser(user_id,source,name,permission,group)
 	playerNames[user_id] = {thePlayer = GetPlayerFromServerId(source), theName = name, showName = show, adminRank = admin, vipRank = vip, thirst = thirst}
    names[user_id] = name
    permissions[user_id] = permission
	groups[user_id] = group
end

function vRPN.removeUser(user_id)
    playerNames[user_id] = nil
end


function RGBRainbow(frequency)
    local result = {}
    local curtime = GetGameTimer() / 1000

    result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
    result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
    result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

    return result
end

function DrawImage3D(name1, name2, x, y, z, width, height, rot, r, g, b, alpha) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, true)
	
    if onScreen then
		local width = (1/dist)*width
		local height = (1/dist)*height
		local fov = (1/GetGameplayCamFov())*100
		local width = width*fov
		local height = height*fov
	
		local CoordFrom = GetEntityCoords(PlayerPedId(), true)
        local RayHandle = StartShapeTestRay(CoordFrom.x, CoordFrom.y, CoordFrom.z, x, y, z, -1, PlayerPedId(), 0)
        local _, _, _, _, object = GetShapeTestResult(RayHandle)
		if(object == 0) or (object == nil)then
			DrawSprite(name1, name2, _x, _y, width, height, rot, r, g, b, alpha)
		end
	end
end

function DrawText3D(x,y,z, text, r,g,b,a)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
   
    if onScreen then
		local CoordFrom = GetEntityCoords(PlayerPedId(), true)
        local RayHandle = StartShapeTestRay(CoordFrom.x, CoordFrom.y, CoordFrom.z, x, y, z, -1, PlayerPedId(), 0)
        local _, _, _, _, object = GetShapeTestResult(RayHandle)
		if(object == 0) or (object == nil)then
			SetTextScale(0.31, 0.31)
			SetTextFont(0)
			SetTextProportional(1)
			SetTextColour(r, g, b, a)
			SetTextDropshadow(0, 0, 0, 0, 100)
			SetTextEdge(2, 0, 0, 0, 150)
			SetTextEntry("STRING")
			SetTextOutline()
			SetTextCentre(1)
			AddTextComponentString(text)
			DrawText(_x,_y)
		end
    end
end



Citizen.CreateThread(function()
    while true do

        for k,v in pairs(playerNames) do
            local thePlayer = v.thePlayer
			local theName = v.theName
			local thePerm = v.thePerm
			local theGroup = v.theGroup
			local adminRank = v.adminRank
			local vipRank = v.vipRank
            
            local ped = GetPlayerPed(thePlayer)
            local ply = GetPlayerPed(-1)

	
				local x1, y1, z1 = table.unpack(GetEntityCoords(ply, true))
                local x2, y2, z2 = table.unpack(GetEntityCoords(ped, true))
                local x3, y3, z3 = table.unpack(GetEntityCoords(ped, true))
				local distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
                rgb = RGBRainbow(2.5)

				if ((distance < config.range)) then
					local text = ""

                    if NetworkIsPlayerTalking(thePlayer) and config.speaker then
					
                    end

                    if config.name then 
						text = text .. theName
                    end

                    if config.id and not config.name then text = text .. k
                    elseif config.id then text = '~b~[' .. k .. '] ~s~'..text
				end

                r,g,b,a = 255, 255, 255, 255
				offset = 0
				
				 if (VeziNumeleTau) then
			

                    local onScreen,_x,_y=World3dToScreen2d(x3, y3, z3+0.957)
                    local CoordFrom = GetEntityCoords(PlayerPedId(), true)
                    local RayHandle = StartShapeTestRay(CoordFrom.x, CoordFrom.y, CoordFrom.z, x3, y3, z3+1.1, -1, PlayerPedId(), 0)
                    local _, _, _, _, object = GetShapeTestResult(RayHandle)
                    if(object == 0) or (object == nil)then
                        if(onScreen)then
                            if((ply ~= ped) or arataHud) then
                                _x = _x - 0.060
                                local playerHP = GetEntityHealth(ped)
                                if(playerHP <= 150)then
                                    DrawSprite("heart", "heart", _x+offset, _y, 0.012, 0.022, 0.0, 255, 255, 255, 255)
                                    offset = offset + 0.015
                                end
                                local playerArmour = GetPedArmour(ped)
                                if(playerArmour > 0)then
                                    DrawSprite("armour", "armour", _x+offset, _y, 0.013, 0.0283, 0.0, 255, 255, 255, 255)
                                    offset = offset + 0.015
                                end
                                   
                                TriggerServerEvent("getBasics")

                                hunger = hunger
                             
                                if(hunger <= 25)then
                                    DrawSprite("kebabMarket", "kebabMarket", _x+offset, _y, 0.012, 0.022, 0.0, 255, 255, 255, 255)
                                    offset = offset + 0.015
                                end

                                 thirst = thirst
                                
                                if(thirst <= 25)then
                                    DrawSprite("waterMarket", "waterMarket", _x+offset, _y, 0.012, 0.022, 0.0, 255, 255, 255, 255)
                                    offset = offset + 0.015
								end
								DrawText3D(x2, y2, z2+0.92, text, r,g,b,a)
							end
                        end
                    end
                end
			end
		end
        Citizen.Wait(0)
    end
end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        TriggerServerEvent('reuploadgrade')
    end
end)

RegisterNetEvent("returnBasics")
AddEventHandler("returnBasics", function (rHunger, rThirst)
    hunger = rHunger
    thirst = rThirst
end)


RegisterCommand("name", function(source, args, rawCommand)
    VeziNumeleTau = true
end, false)


RegisterCommand("armura", function(source, args, rawCommand)
    SetPedArmour(GetPlayerPed(-1), 100)
end, false)