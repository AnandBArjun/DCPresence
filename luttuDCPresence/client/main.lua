---Custom Advanced Discord Rich Presence By RD Luttu#5198---


local playerOnline, playerMax, playerStatus = 0, 0, ''

Citizen.CreateThread(function()
    local playerName = GetPlayerName(PlayerId())
    local playerId = GetPlayerServerId(PlayerId())

    while true do
		SetDiscordAppId(Config['application_id'])
		SetDiscordRichPresenceAsset(Config['assets_logo'])
        SetDiscordRichPresenceAssetText(Config['assets_text'])
        SetDiscordRichPresenceAssetSmall(Config['assets_logo_small'])
        SetDiscordRichPresenceAssetSmallText(Config['assets_text_small'])
        SetDiscordRichPresenceAction(0, Config['button_discord_text'], Config['button_discord_invite'])
        SetDiscordRichPresenceAction(1, Config['button_server_text'], 'fivem://connect/' .. Config['button_server_ip'])

        if playerOnline == 0 or playerMax == 0 then 
            playerStatus = 'Connecting.!!'
        else
            playerStatus = string.format('%d/%d Players', playerOnline, playerMax)
        end

        SetRichPresence(string.format('[%s] - %s | %s', playerId, playerName, playerStatus))

        Citizen.Wait(Config['update_time'] * 60 * 1000)
	end
end)

RegisterNetEvent('LuttuRichPresence:setPlayerData')
AddEventHandler('LuttuRichPresence:setPlayerData', function(data)
    playerOnline = data.AllPlayers
    playerMax = data.MaxPlayers
end)
