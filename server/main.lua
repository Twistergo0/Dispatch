ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local jobDispatchMap = {
    ['police'] = 'Polizei Dispatch',
    ['ambulance'] = 'Rettungsdienst Dispatch',
    ['mechanic'] = 'Mechaniker Dispatch',
    ['taxi'] = 'Taxi Dispatch'
}

RegisterCommand('dispatch', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if #args < 2 then
        TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Nutzung: /dispatch [job] [message]' } })
        return
    end
    
    local job = args[1]
    local message = table.concat(args, ' ', 2)
    
    if not jobDispatchMap[job] then
        TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Ungültiger Job!' } })
        return
    end

    TriggerClientEvent('venndettadispatch:sendDispatch', -1, job, message, xPlayer.getCoords())
end, false)
