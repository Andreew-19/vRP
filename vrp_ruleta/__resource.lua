
--client_script 'client.lua' --your NUI Lua File

client_script {
    "lib/Tunnel.lua",
    "lib/Proxy.lua",
    'serverCallbackLib/client.lua',
    'client.lua'
}

server_script "@mysql-async/lib/MySQL.lua"

--server_script 'server.lua'

server_script {
    
    "@vrp/lib/utils.lua",
    'serverCallbackLib/server.lua',
    'server.lua'
}

ui_page('html/index.html') --THIS IS IMPORTENT

--[[The following is for the files which are need for you UI (like, pictures, the HTML file, css and so on) ]]--
files {
    'html/index.html',
    'html/soundeffect.mp3',
    'html/less/style.less',
    'html/js/index.js',
    'html/img/lose.mp3',
    'html/img/spin.mp3',
    'html/img/win.mp3',
    'html/img/audioOn.png',
    'html/img/audioOff.png',
    'html/css/style.css'
}
