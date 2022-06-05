---Custom Advanced Discord Rich Presence By RD Luttu#5198---

local playerCount = 0

local startPlayerCount = function()
    function getPlayerCount()
        local getPlayers = #GetPlayers()

        if getPlayers > 0 and getPlayers ~= playerCount then
            TriggerClientEvent('LuttuRichPresence:setPlayerData', -1, {
                AllPlayers = getPlayers,
                MaxPlayers = GetConvar('sv_luttuclients'),
            })

            playerCount = players
        end

        Citizen.SetTimeout(Config['update_time'] * 60 * 1000, function()
            getPlayerCount()
        end)
    end

    Citizen.SetTimeout(Config['update_time'] * 60 * 1000, function()
        getPlayerCount()
    end)
end

startPlayerCount()
