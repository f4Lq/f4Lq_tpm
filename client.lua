ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

----- Komenda

RegisterCommand("tpm", function(source)
    f4Lq_tpm()
end, false)

----- Kod

function f4Lq_tpm()
  
  ESX.TriggerServerCallback('f4Lq_tpm:getUsergroup', function(group)
    playergroup = group
    
    if playergroup == 'admin' or playergroup == 'superadmin' or playergroup == 'mod' or playergroup == '_dev' then
      local playerPed = GetPlayerPed(-1)
      local WaypointHandle = GetFirstBlipInfoId(8)
      if DoesBlipExist(WaypointHandle) then
        local coord = Citizen.InvokeNative(0xFA7C7F0AADF25D09, WaypointHandle, Citizen.ResultAsVector())
        --SetEntityCoordsNoOffset(playerPed, coord.x, coord.y, coord.z, false, false, false, true)
        SetEntityCoordsNoOffset(playerPed, coord.x, coord.y, -199.5, false, false, false, true)
        TriggerEvent('f4LqNotify:Alert', 'TPM', 'Teleport się udał', 5000, 'success') -- 5s = 5000 milisekund
      else
        TriggerEvent('f4LqNotify:Alert', 'TPM', 'Nie zaznaczyłeś znacznika!', 5000, 'error') -- 5s = 5000 milisekund
      end
    end
    
  end)
end