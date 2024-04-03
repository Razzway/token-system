--[[
    Copyright (c) 2022 Razzway - Tout droit réservé.
    Ce fichier a été crée pour Razzway- FiveM Store.
    Vous n'êtes pas autorisé à revendre/partager la ressource.
--]]

---@author Razzway

token = ""

RegisterNetEvent("rz-core:receiveToken")
AddEventHandler("rz-core:receiveToken", function(serverToken)
    if serverToken == nil then return end
    token = serverToken
end)

CreateThread(function()
    while true do
        Wait(0)
        if NetworkIsSessionStarted() then
            TriggerServerEvent('rz-core:initialization')
            return
        end
    end
end)