Config = {
    Prefix = "Atlas Development",

    Time = 5,  -- Time in minutes between each auto message

    Notify = 0,  -- Notification system to use: 0 = chat message, 1 = okokNotify, 2 = codem, 3 = mythic, 4 = ox_lib

    NotifyDuration = 8000,  -- Duration for notifications (only relevant for certain notification systems like okokNotify or codem)

    JoinEnabled = true,  -- Should a welcome message be sent to players when they join?

    JoinMessage = "Welcome to Our Server!",  -- Message to send when a player joins

    Enabled = true,  -- Should auto messages be sent?

    Messages = {  -- List of auto messages
        'Join Our Discord Today! discord.gg/atlaslabs',
        'Want to Purchase Something? Use Our Tebex!',
        'Looking to Apply for a Department? Join our Discord!'
    }
}
