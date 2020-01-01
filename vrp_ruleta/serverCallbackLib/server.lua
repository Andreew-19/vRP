vrpCR={}
vrpCR.ServerCallbacks={}


RegisterServerEvent('vrpCR:triggerServerCallback')
AddEventHandler('vrpCR:triggerServerCallback',function(a,b,...)
    local c=source

    vrpCR.TriggerServerCallback(a,requestID,c,function(...)
        TriggerClientEvent('vrpCR:serverCallback',c,b,...)end,...)
    end)
        
        
    
    vrpCR.RegisterServerCallback = function(a,t)
        vrpCR.ServerCallbacks[a]=t 
end
                    
vrpCR.TriggerServerCallback = function(a,b,source,t,...)
    if vrpCR.ServerCallbacks[a]~=nil then 
        vrpCR.ServerCallbacks[a](source,t,...)
    else 
        print('TriggerServerCallback => ['..a..'] does not exist')
    end 
end