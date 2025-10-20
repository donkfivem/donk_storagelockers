local QBX = exports.qbx_core

CreateThread(function()
    setupStorageTargets()
end)

function setupStorageTargets()
    for i = 1, #Config.StorageLocations do
        pcall(function()
            exports.ox_target:removeZone('storage_location_' .. i)
        end)
    end
    for i, location in pairs(Config.StorageLocations) do
        exports.ox_target:addSphereZone({
            coords = location.coords,
            radius = 2.0,
            options = {
                {
                    name = 'access_storage_' .. i,
                    icon = 'fas fa-box-open',
                    label = 'Access Storage',
                    onSelect = function()
                        accessPersonalStorage(i)
                    end
                }
            },
            name = 'storage_location_' .. i
        })
    end
end

function accessPersonalStorage(locationIndex)
    local playerData = QBX:GetPlayerData()
    if not playerData or not playerData.citizenid then
        lib.notify({
            title = 'Error',
            description = 'Unable to access storage',
            type = 'error'
        })
        return
    end
    TriggerServerEvent('storage_lockers:server:accessStorage', locationIndex)
    local stashId = 'personal_storage_' .. playerData.citizenid
    exports.ox_inventory:openInventory('stash', stashId)
end

RegisterNetEvent('storage_lockers:client:showAddLockerMenu', function()
    local input = lib.inputDialog('Add Storage Location', {
        {
            type = 'select',
            label = 'Confirm Location',
            description = 'Add storage location at your current position?',
            required = true,
            options = {
                {value = 'confirm', label = 'Yes, add here'},
                {value = 'cancel', label = 'Cancel'}
            }
        }
    })
    if input and input[1] == 'confirm' then
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local heading = GetEntityHeading(playerPed)
        TriggerServerEvent('storage_lockers:server:addLocation', coords, heading)
    end
end)

RegisterNetEvent('storage_lockers:client:showRemoveLockerMenu', function()
    lib.notify({
        title = 'Information',
        description = 'Edit the config file to remove storage locations',
        type = 'inform'
    })
end)

RegisterNetEvent('storage_lockers:client:notify', function(data)
    lib.notify(data)
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    Wait(1000)
    setupStorageTargets()
end)