vRPCmarkets = {}
Tunnel.bindInterface("vrp_market",vRPCmarkets)
Proxy.addInterface("vRP_market",vRPCmarkets)

vRPSmarkets = Tunnel.getInterface("vrp_market","vrp_market")

vRP = Proxy.getInterface("vRP")



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

produse = {
	[1] = {"Milk \n (~g~20 ~r~$~w~)", "item_milk", "milk", "Milk",20, 1, 0.737, 0.465},
	[2] = {"Bread \n (~g~20 ~r~$~w~)", "item_bread", "bread", "Bread",20, 1, 0.787, 0.465},
	[3] = {"Donut \n (~g~20 ~r~$~w~)", "item_donut", "donut", "Donut",20, 250, 0.837, 0.465},
	[4] = {"Kebab \n (~g~200 ~r~$~w~)", "item_kebab", "kebab", "Kebab",200, 300, 0.887, 0.465},
	[5] = {"Water \n (~g~20 ~r~$~w~)", "item_water", "water", "Water",20, 3, 0.737, 0.55},
	[6] = {"Vodka \n (~g~300 ~r~$~w~)", "item_vodka", "vodka","Vodka",300, 400, 0.787, 0.55},
	[7] = {"Redbull \n (~g~120 ~r~$~w~)", "item_redbull", "redbull","Redbull",120, 350, 0.837, 0.55},
	[8] = {"Coffe \n (~g~40 ~r~$~w~)", "item_coffee", "coffee", "Coffe",40,300, 0.887, 0.55},
	[9] = {"Limonade \n (~g~140 ~r~$~w~)","item_lemonade", "lemonade","Limonade",140, 1, 0.737, 0.633},
    [10] = {"Orange Juice \n (~g~80 ~r~$~w~)","item_orangejuice", "orangejuice","Juice",80, 400, 0.787, 0.633},
	[11] = {"Sandwich \n (~g~200 ~r~$~w~)","item_sandwich", "sandwich","Sandwich",200, 350, 0.837, 0.633},
	[12] = {"Coca-Cola \n (~g~120 ~r~$~w~)","item_cocacola", "cocacola","Coca-Cola",120, 300, 0.887, 0.633}
}


local Magazin = {
	{name="Magazin", x= 162.69128417968, y= 6642.0971679688, z= 31.71063041687},
	{name="Magazin", x= 1729.8275146484, y= 6416.2202148438, z= 35.037223815918},
	{name="Magazin", x= 1961.0104980469, y= 3740.9582519531, z= 42.0636749267582},
}	

function ZonaMagazin()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)
	
	for _, search in pairs(Magazin) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
		
		if distance <= 1 then
			return true
		end
	end
end



function KeyboardInput(TextEntry, ExampleText, MaxStringLenght, NoSpaces)
	AddTextEntry(GetCurrentResourceName() .. '_KeyboardHead', TextEntry)
	DisplayOnscreenKeyboard(1, GetCurrentResourceName() .. '_KeyboardHead', '', ExampleText, '', '', '', MaxStringLenght)

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		if NoSpaces == true then
			ShowNotification('~y~No Spaces!')
		end
		Citizen.Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		return result
	else
		Citizen.Wait(500)
		return nil
	end
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

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

inMagazin = false


function showToolTip(text, font, size)
	local sx, sy = GetActiveScreenResolution()
	local cx, cy = GetNuiCursorPosition()
	local cx, cy = ( cx / sx ) + 0.008, ( cy / sy ) + 0.027

	SetTextScale(size, size)
	SetTextFont(font)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(0, 0, 0, 0, 255)
	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextOutline()
	AddTextComponentString(text)
	DrawText(cx, cy + 0.007)
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
	local coords = GetEntityCoords(GetPlayerPed(-1))
	if ZonaMagazin() then	
		drawScreenText(0.5, 0.93, 0,0, 0.7, "Press ~g~[E] ~s~to acces the ~r~Food Store", 255, 255, 255, 230, 1, 4, 1)
		if(IsControlJustReleased(1, 51))then
			inMagazin = true
			FreezeEntityPosition(GetPlayerPed(-1), true)
	end
end
	
	if(inMagazin)then
		ShowCursorThisFrame()
		SetCursorSprite(0)
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
		
		drawHudText(0.81,0.35, 0.0, 0.0, 0.55, "Food Store", 255, 255, 255, 255, 1, 6, 1)
		
		culoareBackground = {
			[1] = {68, 68, 68},
			[2] = {68, 68, 68},
			[3] = {68, 68, 68},
			[4] = {68, 68, 68},
			[5] = {68, 68, 68},
			[6] = {68, 68, 68},
			[7] = {68, 68, 68},
			[8] = {68, 68, 68},
			[9] = {68, 68, 68},
			[10] = {68, 68, 68}
		}
		
		DrawRect(0.812, 0.549, 0.205, 0.27, 0, 0, 0, 180)
		
		for i, v in pairs(produse) do
			if(isCursorInPosition(v[7], v[8], 0.042, 0.072))then
				showToolTip(v[1], 4, 0.4)
				SetCursorSprite(5)
				if(IsDisabledControlJustPressed(0, 24))then
					local itemAmount = KeyboardInput("How much "..v[4].." do you want to buy?", "", 6, false)
					if(itemAmount ~= "" and itemAmount ~= nil)then
						if(tonumber(itemAmount) and (tonumber(itemAmount) > 0))then
							vRPSmarkets.market({v[3], tonumber(itemAmount),v[5],v[4]})
						end
					end
			end
		end
			DrawRect(v[7], v[8], 0.042, 0.072, 150,150,150, 180)
			DrawSprite(string.gsub(v[2],"item_", "").."Market", string.gsub(v[2],"item_", "").."Market", v[7], v[8], 0.042, 0.072, 0.0, 255, 255, 255, 255)
		end

		if(isCursorInPosition(0.81, 0.725, 0.045, 0.04))then
			culoareBackground[9] = {9, 114, 189}
			SetCursorSprite(5)
			if(IsDisabledControlJustPressed(0, 24))then
				inMagazin = false
				suma = nil
				FreezeEntityPosition(GetPlayerPed(-1), false)
			end
		end

		DrawRect(0.81, 0.725, 0.045, 0.04, culoareBackground[9][1], culoareBackground[9][2], culoareBackground[9][3], 180)
		drawHudText(0.81, 0.71, 0.0, 0.0, 0.33, "CLOSE", 255, 255, 255, 255, 0, 7, 1)
	end
	
    if handcuffed then
      SetPedStealthMovement(GetPlayerPed(-1),true,"")
      DisableControlAction(0,21,true) 
      DisableControlAction(0,24,true)
      DisableControlAction(0,25,true) 
      DisableControlAction(0,47,true)
      DisableControlAction(0,58,true) 
      DisableControlAction(0,263,true) 
      DisableControlAction(0,264,true) 
      DisableControlAction(0,257,true) 
      DisableControlAction(0,140,true) 
      DisableControlAction(0,141,true) 
      DisableControlAction(0,142,true) 
      DisableControlAction(0,143,true) 
      DisableControlAction(0,75,true) 
      DisableControlAction(27,75,true)
    end
  end
end)






