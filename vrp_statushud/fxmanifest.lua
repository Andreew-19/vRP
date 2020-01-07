  
fx_version 'adamant'
games { 'gta5' };

name 'vrp_statushud'
description ''


ui_page 'html/ui.html'

files {
    'html/ui.html',
    'html/script.js',
    'html/main.css'
}

client_scripts {
    'hud_client.lua'
}

server_script{
    '@vrp/lib/utils.lua',
    'hud_server.lua'
}