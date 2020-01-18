

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


RegisterNetEvent("adminWindow")
AddEventHandler("adminWindow", function()

	local Ticket = true
	
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
  
	  	if(Ticket)then
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

		  drawHudText(0.5, 0.401, 0.0, 0.0, 0.4, GetOnscreenKeyboardResult(), 255, 255, 255, 255, 1, 6, 1)
		  
		  local CuloriAdminTicket = {
			Raspunde = {68, 68, 68},
			Refuza = {68, 68, 68}
		}

		CuloriAdminTicket.Raspunde = {68, 68, 68}
		CuloriAdminTicket.Refuza = {68, 68, 68}
		

if(isCursorInPosition(0.5, 0.42, 0.25, 0.025))then
	SetCursorSprite(5)
	if(IsDisabledControlJustPressed(0, 24))then
		Citizen.CreateThread(function()
			while true do
				Citizen.Wait(0)
				DisplayOnscreenKeyboard(6, "FMMC_KEY_TIP8", "", "", "", "", "", 70)
				while UpdateOnscreenKeyboard() == 0 do
					DisableAllControlActions(0)
					Wait(0)
				end
				if  UpdateOnscreenKeyboard() == 1 then
					mesaj = true
					local descSituatie = GetOnscreenKeyboardResult()
						if(mesaj)then
						drawHudText(0.5, 0.401, 0.0, 0.0, 0.4, descSituatie, 255, 255, 255, 255, 1, 6, 1)
				while true do
					Citizen.Wait(0)
					
					if GetOnscreenKeyboardResult() then
						-- nu fa nimic curvo
						end
					end
				end
			end
		end
	end)
end
elseif(isCursorInPosition(0.55, 0.520, 0.05, 0.028))then
	SetCursorSprite(5)
	CuloriAdminTicket.Raspunde = {9, 114, 189}
	if(IsDisabledControlJustPressed(0, 24))then
		mesaj = false
		local descSituatie = GetOnscreenKeyboardResult()
		TriggerServerEvent("adminTicket", descSituatie)
		Ticket = false
	end
elseif(isCursorInPosition(0.45, 0.520, 0.05, 0.028))then
	SetCursorSprite(5)
	CuloriAdminTicket.Refuza = {9, 114, 189}
	if(IsDisabledControlJustPressed(0, 24))then
		mesaj = false
		Ticket = false
	end
end
				DrawRect(0.5, 0.45, 0.3, 0.21, 0, 0, 0, 200)
				DrawRect(0.5, 0.334, 0.3, 0.025, 9, 114, 189, 200)
				drawHudText(0.5, 0.312, 0.0, 0.0, 0.45, "Admin Ticket", 255, 255, 255, 255, 1, 4, 1)

				drawHudText(0.5, 0.37, 0.0, 0.0, 0.4, "Describe Your Problem", 255, 0, 0, 255, 1, 4, 1)
				DrawRect(0.5, 0.42, 0.25, 0.025, 9, 114, 189, 180)

				DrawRect(0.45, 0.520, 0.05, 0.028,CuloriAdminTicket.Refuza[1],CuloriAdminTicket.Refuza[2],CuloriAdminTicket.Refuza[3], 180)
				DrawRect(0.55, 0.520, 0.05, 0.028,CuloriAdminTicket.Raspunde[1],CuloriAdminTicket.Raspunde[2],CuloriAdminTicket.Raspunde[3], 180)
				drawHudText(0.45,0.50, 0.0, 0.0, 0.4, "CLOSE", 255, 0, 0, 255, 1, 4, 1)
				drawHudText(0.55,0.50, 0.0, 0.0, 0.4, "SEND", 0, 255, 0, 255, 1, 4, 1)
			end
		end
	end)
end)


