local QBX = exports.qbx_core

RegisterNetEvent('storage_lockers:server:accessStorage', function(locationIndex)
    local src = source
    local Player = QBX:GetPlayer(src)
    if not Player then return end
    local citizenid = Player.PlayerData.citizenid
    local stashId = 'personal_storage_' .. citizenid
    exports.ox_inventory:RegisterStash(stashId, 'Personal Storage', Config.StorageSlots, Config.StorageWeight, citizenid)
    TriggerClientEvent('storage_lockers:client:notify', src, {
        title = 'Storage Access',
        description = 'Accessing your personal storage',
        type = 'success'
    })
end)

RegisterNetEvent('storage_lockers:server:addLocation', function(coords, heading)
    local src = source
    TriggerClientEvent('storage_lockers:client:notify', src, {
        title = 'Success',
        description = 'Storage location added (restart required)',
        type = 'success'
    })
end)

AddEventHandler('playerDropped', function(reason)
    local src = source
    local Player = QBX:GetPlayer(src)

    if Player then
        print('Player ' .. Player.PlayerData.name .. ' disconnected')
    end
end)
