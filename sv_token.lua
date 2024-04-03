--[[
    Copyright (c) 2022 Razzway - Tout droit réservé.
    Ce fichier a été crée pour Razzway - FiveM Store.
    Vous n'êtes pas autorisé à revendre/partager la ressource.
--]]

---@author Razzway

serverToken = ""

local arguments, playerCount, playerList = {"$","/","*","-","+","*","ù","%"}, 0, {}
function GenerateToken()
    local nwToken = "token:"
    for i = 1, 20 do
        if math.random(1,30) > 15 then
            nwToken = nwToken .. string.upper(string.char(math.random(97, 122))) .. math.random(1,20) .. arguments[math.random(1,#arguments)]
        else
            nwToken = nwToken .. string.char(math.random(97, 122)) .. math.random(1,20)
        end
    end
    return nwToken
end

function GetToken(id, oldToken)
    if (serverToken) == (oldToken) then
        return true
    else
        return false
    end
end

CreateThread(function()
    serverToken = GenerateToken()
    print("======================================================================")
    print("[^2INITIALISATION^0]")
    print("[^4GENERATION D'UN NOUVEAU TOKEN...^0]")
    print("======================================================================")
    print("[^1TOKEN DU SERVEUR^0] -> (^3"..serverToken.."^0)")
    tokenKickMessage = "Une erreur est survenue, désynchronisation avec le serveur."
end)

RegisterServerEvent('rz-core:initialization')
AddEventHandler('rz-core:initialization', function()
    if not playerList[source] then
        playerCount = playerCount + 1
        playerList[source] = true
    end
    print(("[^3TOKEN JOUEUR^0] -> [^6%s^0] (^5%s^0)"):format(GetPlayerName(source), serverToken))
    TriggerClientEvent("rz-core:receiveToken", source, serverToken)
end)

-- if not GetToken(source, serverToken) then return DropPlayer(source, tokenKickMessage) end
