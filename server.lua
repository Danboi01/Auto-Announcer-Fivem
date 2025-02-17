Citizen.CreateThread(function()
    while true do
        if Config.Enabled and #Config.Messages > 0 then
            for _, message in ipairs(Config.Messages) do
                SendNoti(-1, message, 'success')
                Citizen.Wait(Config.Time * 60000)  
            end
        else
            Citizen.Wait(5000)  
        end
    end
end)

AddEventHandler('playerJoining', function()
    local playerid = source
    local name = GetPlayerName(playerid)
    if Config.JoinEnabled and Config.JoinMessage ~= "" then
        SendNoti(playerid, name .. " " .. Config.JoinMessage, 'success')
    end
end)

function SendNoti(recipient, message, type)
    if not message or message == "" then return end 

    local messageType, color
    if type == "success" then 
        messageType = "SYSTEM"
        color = "~g~"
    elseif type == "error" then 
        messageType = "ERROR"
        color = "~r~"
    else
        messageType = "INFO"
        color = "~b~"
    end

    local formattedMessage = string.format("%s[%s] ~w~%s", color, messageType, message)

    if Config.Notify == 0 then
        TriggerClientEvent('chat:addMessage', recipient, {
            template = '<div class="chat-message ooc"><b><span style="color: #7d7d7d">{1}: </span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{2}</span></b></div>',
            args = { messageType, message }
        })
    elseif Config.Notify == 1 then
        TriggerClientEvent('okokNotify:Alert', recipient, string.upper(type), message, Config.NotifyDuration, type, true)
    elseif Config.Notify == 2 then
        TriggerClientEvent('codem-notification', recipient, message, 8000, type == 'success' and 'check' or 'error')
    elseif Config.Notify == 3 then
        TriggerClientEvent('mythic_notify:client:SendAlert', recipient, { 
            type = type, 
            text = message, 
            style = { ['background-color'] = '#000000', ['color'] = '#ffff' } 
        })
    elseif Config.Notify == 4 then
        TriggerClientEvent('ox_lib:notify', recipient, {
            title = Config.Prefix or 'Server Announcement',
            description = message,
            type = type,
            position = 'center-right'
        })
    end
end

