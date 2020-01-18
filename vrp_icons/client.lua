icons = {
	{"discordIcon", "discordIcon", "discordIcon"},
	{"ipIcon", "ipIcon", "ipIcon"},
	{"hideHud", "hideHud", "hideHud"},
	{"hideHudG", "hideHudG", "hideHudG"},
	{"vote", "vote", "vote"},
	{"vote-icon", "vote-icon", "vote-icon"},
	{"heart", "heart", "heart"},
	{"recoil", "recoil", "recoil"},
	{"profile", "profile", "profile"},

	{"buletin", "buletin", "buletin"},
	{"name", "name", "name"},

	{"talkingHud", "talking", "talking"},
	{"armour", "armour", "armour"},
	
	{"eaTest", "eaTest", "eaTest"},
	{"eaTestStart", "eaTestStart", "eaTestStart"},
	{"eatTestPass", "eatTestPass", "eatTestPass"},
	{"eaTestFail", "eaTestFail", "eaTestFail"},
	{"boxTickIcon", "boxTickIcon", "boxTickIcon"},
	{"boxTickedIcon", "boxTickedIcon", "boxTickedIcon"},
	{"licenseIcon", "licenseIcon", "licenseIcon"},

	{"milkMarket", "milkMarket", "milk"},
	{"breadMarket", "breadMarket", "bread"},
	{"donutMarket", "donutMarket", "donut"},
	{"kebabMarket", "kebabMarket", "kebab"},
	{"waterMarket", "waterMarket", "water"},
	{"vodkaMarket", "vodkaMarket", "vodka"},
	{"redbullMarket", "redbullMarket", "redbull"},
	{"coffeeMarket", "coffeeMarket", "coffee"},
	{"cocacolaMarket", "cocacolaMarket", "cocacola"},
	{"orangejuiceMarket", "orangejuiceMarket", "orangejuice"},
	{"sandwichMarket", "sandwichMarket", "sandwich"},
	{"lemonadeMarket", "lemonadeMarket", "lemonade"},

	{"assaultrifle_mk2Gun", "assaultrifle_mk2Gun", "assaultrifle_mk2"},
	{"specialcarbine_mk2Gun", "specialcarbine_mk2Gun", "specialcarbine_mk2"},
	{"smokegrenadeGun", "smokegrenadeGun", "smokegrenade"},
	{"nightstickGun", "nightstickGun", "nightstick"},
	{"pistol_mk2Gun", "pistol_mk2Gun", "pistol_mk2"},
	{"assaultsmgGun", "assaultsmgGun", "assaultsmg"},
	{"pumpshotGun", "pumpshotGun", "pumpshotgun"},
	{"stungunGun", "stungunGun", "stungun"},
	{"armourGun", "armourGun", "armour"}

}


icons2 = {
	{"alcohol", "alcohol", "alcohol"}
--	{"ipIcon", "ipIcon", "ipIcon"},


}

function loadAllIcons()
	for i, v in pairs(icons) do
		local txd = CreateRuntimeTxd(v[1])
		CreateRuntimeTextureFromImage(txd, v[2], "icons/"..v[3]..".png")
	end
end

function loadAllIcons2()
	for i, v in pairs(icons2) do
		local txd = CreateRuntimeTxd(v[1])
		CreateRuntimeTextureFromImage(txd, v[2], "icons/"..v[3]..".ai")
	end
end


Citizen.CreateThread(function()
	loadAllIcons()
	loadAllIcons2()
end)

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
