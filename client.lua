-- ███████╗██████╗ ██╗    ██╗██╗███╗   ██╗    ██████╗ ██╗      █████╗  ██████╗██╗  ██╗███╗   ███╗ █████╗ ██████╗ ██╗  ██╗███████╗████████╗
-- ██╔════╝██╔══██╗██║    ██║██║████╗  ██║    ██╔══██╗██║     ██╔══██╗██╔════╝██║ ██╔╝████╗ ████║██╔══██╗██╔══██╗██║ ██╔╝██╔════╝╚══██╔══╝
-- █████╗  ██║  ██║██║ █╗ ██║██║██╔██╗ ██║    ██████╔╝██║     ███████║██║     █████╔╝ ██╔████╔██║███████║██████╔╝█████╔╝ █████╗     ██║   
-- ██╔══╝  ██║  ██║██║███╗██║██║██║╚██╗██║    ██╔══██╗██║     ██╔══██║██║     ██╔═██╗ ██║╚██╔╝██║██╔══██║██╔══██╗██╔═██╗ ██╔══╝     ██║   
-- ███████╗██████╔╝╚███╔███╔╝██║██║ ╚████║    ██████╔╝███████╗██║  ██║╚██████╗██║  ██╗██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██╗███████╗   ██║   
-- ╚══════╝╚═════╝  ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝    ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   

QBCore = exports["qb-core"]:GetCoreObject()

CreateThread(function()
    local blackmarketLocations = {
        {name = "bmkart", coords = vector3(22.0, -1107.2, 29.8)},
        {name = "bmkart2", coords = vector3(-661.73, -934.92, 21.83)},
        {name = "bmkart3", coords = vector3(842.1, -1033.93, 28.19)}
    }

    for _, location in ipairs(blackmarketLocations) do
        exports["edwin-notify"]:addnotif("E", "Blackmarket", 2, 2, location.coords, false, false, false, false, false, "edwin-blackmopenmarket", location.name)
    end
end)

RegisterNetEvent("edwin-blackmopenmarket")
AddEventHandler("edwin-blackmopenmarket",function(tip)
    QBCore.Functions.TriggerCallback("QBCore:HasItem",function(zort)
        if zort then
            if tip == "bmkart" then
                TriggerServerEvent("inventory:server:OpenInventory", "shop", "Blackmarket", Config.Blackmarket["blackmarket"])
            elseif tip == "bmkart2" then
                TriggerServerEvent("inventory:server:OpenInventory", "shop", "Blackmarket2", Config.Blackmarket["blackmarket2"])
            elseif tip == "bmkart3" then
                TriggerServerEvent("inventory:server:OpenInventory", "shop", "Blackmarket3", Config.Blackmarket["blackmarket3"])
            end
        else
            QBCore.Functions.Notify(QBCore.Shared.Items[tip]["label"].. " `ın Yok")
        end
    end,tip)
end)

-- BLİP SİSTEMİ
Citizen.CreateThread(function()
    local blip = AddBlipForCoord(-661.63, -934.92, 21.83)
    SetBlipSprite(blip, 110)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.8)
    SetBlipColour(blip, 0)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Blackmarket V2")
    EndTextCommandSetBlipName(blip)

    local blip2 = AddBlipForCoord(22.0, -1107.2, 29.8)
    SetBlipSprite(blip2, 110)
    SetBlipDisplay(blip2, 4)
    SetBlipScale(blip2, 0.8)
    SetBlipColour(blip2, 0)
    SetBlipAsShortRange(blip2, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Blackmarket")
    EndTextCommandSetBlipName(blip2)

    local blip3 = AddBlipForCoord(842.1, -1033.93, 28.19)
    SetBlipSprite(blip3, 110)
    SetBlipDisplay(blip3, 4)
    SetBlipScale(blip3, 0.8)
    SetBlipColour(blip3, 0)
    SetBlipAsShortRange(blip3, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Blackmarket V3")
    EndTextCommandSetBlipName(blip3)
end)

-- NPC SİSTEMİ İSTERSENİZ KALDIRABİLİRSİNİZ!
Citizen.CreateThread(function()
    local npcCoords = vector3(21.815382003784, -1105.1182861328, 28.797008514404)
    local npcHeading = 157.5
    local npcHash = GetHashKey("s_m_y_blackops_01")
    RequestModel(npcHash)
    while not HasModelLoaded(npcHash) do
        Wait(500)
    end
    local npcPed = CreatePed(5, npcHash, npcCoords, npcHeading, false, false)
    SetEntityAsMissionEntity(npcPed, true, true)
    SetBlockingOfNonTemporaryEvents(npcPed, true)
    FreezeEntityPosition(npcPed, true)
end)

Citizen.CreateThread(function()
    local npcCoords = vector3(843.42785644531, -1035.3223876953, 27.194862365723)
    local npcHeading = 356.3
    local npcHash = GetHashKey("s_m_y_blackops_01")
    RequestModel(npcHash)
    while not HasModelLoaded(npcHash) do
        Wait(500)
    end
    local npcPed = CreatePed(5, npcHash, npcCoords, npcHeading, false, false)
    SetEntityAsMissionEntity(npcPed, true, true)
    SetBlockingOfNonTemporaryEvents(npcPed, true)
    FreezeEntityPosition(npcPed, true)
end)

Citizen.CreateThread(function()
    local npcCoords = vector3(-663.30010986328, -933.61590576172, 20.829217910767)
    local npcHeading = 180.2
    local npcHash = GetHashKey("s_m_y_blackops_01")
    RequestModel(npcHash)
    while not HasModelLoaded(npcHash) do
        Wait(500)
    end
    local npcPed = CreatePed(5, npcHash, npcCoords, npcHeading, false, false)
    SetEntityAsMissionEntity(npcPed, true, true)
    SetBlockingOfNonTemporaryEvents(npcPed, true)
    FreezeEntityPosition(npcPed, true)
end)

-- ███████╗██████╗ ██╗    ██╗██╗███╗   ██╗    ██████╗ ██╗      █████╗  ██████╗██╗  ██╗███╗   ███╗ █████╗ ██████╗ ██╗  ██╗███████╗████████╗
-- ██╔════╝██╔══██╗██║    ██║██║████╗  ██║    ██╔══██╗██║     ██╔══██╗██╔════╝██║ ██╔╝████╗ ████║██╔══██╗██╔══██╗██║ ██╔╝██╔════╝╚══██╔══╝
-- █████╗  ██║  ██║██║ █╗ ██║██║██╔██╗ ██║    ██████╔╝██║     ███████║██║     █████╔╝ ██╔████╔██║███████║██████╔╝█████╔╝ █████╗     ██║   
-- ██╔══╝  ██║  ██║██║███╗██║██║██║╚██╗██║    ██╔══██╗██║     ██╔══██║██║     ██╔═██╗ ██║╚██╔╝██║██╔══██║██╔══██╗██╔═██╗ ██╔══╝     ██║   
-- ███████╗██████╔╝╚███╔███╔╝██║██║ ╚████║    ██████╔╝███████╗██║  ██║╚██████╗██║  ██╗██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██╗███████╗   ██║   
-- ╚══════╝╚═════╝  ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝    ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   