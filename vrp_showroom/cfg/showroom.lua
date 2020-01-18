vehshop = {
	opened = false,
	title = "Vehicle Shop",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
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
				{name = "Harley Motocicleta", costs = 10000, description = {}, model = "hvrod"},
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

return vehshop