resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page 'html/index.html'

client_scripts {
    "lib/Tunnel.lua",
	"lib/Proxy.lua",
	"cfg/config.lua",
    'client.lua'
} 

server_scripts{ 
	"@vrp/lib/utils.lua",
	"server.lua"
  }
  

files {
	'html/index.html',
	'html/jquery.js',
	'html/init.js',
}


