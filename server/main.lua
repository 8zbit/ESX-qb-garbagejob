-- For Help - ilAn#9613
-- For Help - ilAn#9613
-- For Help - ilAn#9613
-- For Help - ilAn#9613
-- For Help - ilAn#9613
-- For Help - ilAn#9613
-- For Help - ilAn#9613


ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local Bail = {}

ESX.RegisterServerCallback('qb-garbagejob:server:HasMoney', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)

    if Player.getMoney() >= Config.BailPrice then
        Player.removeMoney(Config.BailPrice)
        cb(true)
    elseif Player.getAccount('bank').money >= Config.BailPrice then
        Player.removeAccountMoney('bank', Config.BailPrice)
        cb(true)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('qb-garbagejob:server:CheckBail', function(source, cb)
    local Player = ESX.GetPlayerFromId(source)

    if Player ~= nil then
        Player.addMoney(Config.BailPrice)
        cb(true)
    else
        cb(false)
    end
end)

local Materials = {
    "metalscrap",
    "plastic",
    "copper",
    "iron",
    "aluminum",
    "steel",
    "glass",
}

RegisterServerEvent('qb-garbagejob:server:PayShit')
AddEventHandler('qb-garbagejob:server:PayShit', function(amount, location)
    local src = source
    local Player = ESX.GetPlayerFromId(source)

    if amount > 0 then
        Player.addAccountMoney('bank', amount)

        if location == #Config.Locations["vuilnisbakken"] then
            for i = 1, math.random(3, 5), 1 do
                local item = Materials[math.random(1, #Materials)]
                Player.addInventoryItem(item, math.random(40, 70))
                Citizen.Wait(500)
            end
        end
    else
    end
end)