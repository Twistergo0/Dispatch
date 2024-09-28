local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('venndettadispatch:sendDispatch')
AddEventHandler('venndettadispatch:sendDispatch', function(job, message, coords)
    local playerJob = ESX.GetPlayerData().job.name

    if playerJob == job then
        -- Nachricht an den Spieler senden
        ESX.ShowNotification('Neuer Dispatch: ' .. message)

        -- Blip und Route auf der Karte setzen
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 66)
        SetBlipColour(blip, 1)
        SetBlipRoute(blip, true)
        SetBlipRouteColour(blip, 1)

        -- Blip nach einer Weile entfernen
        Citizen.CreateThread(function()
            Citizen.Wait(600000) -- 10 Minuten, bevor der Blip verschwindet
            RemoveBlip(blip)
        end)
    end
end)
