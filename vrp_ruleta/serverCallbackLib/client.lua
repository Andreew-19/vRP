vrpCR = {}
vrpCR.CurrentRequestId          = 0
vrpCR.ServerCallbacks           = {}

vrpCR.TriggerServerCallback = function(name, cb, ...)
	vrpCR.ServerCallbacks[vrpCR.CurrentRequestId] = cb

	TriggerServerEvent('vrpCR:triggerServerCallback', name, vrpCR.CurrentRequestId, ...)

	if vrpCR.CurrentRequestId < 65535 then
		vrpCR.CurrentRequestId = vrpCR.CurrentRequestId + 1
	else
		vrpCR.CurrentRequestId = 0
	end
end

RegisterNetEvent('vrpCR:serverCallback')
AddEventHandler('vrpCR:serverCallback', function(requestId, ...)
	vrpCR.ServerCallbacks[requestId](...)
	vrpCR.ServerCallbacks[requestId] = nil
end)