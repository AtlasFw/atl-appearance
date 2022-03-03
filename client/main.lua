local function loadData(resource)
  if resource == GetCurrentResourceName() then
    Wait(1500)
    local models <const> = exports['atl-core']:Models()
    SendNUIMessage({
      action = 'set_models',
      models = models
    })
  end
end

local function startAppearance(config)
  SetNuiFocus(true, true)
  SendNUIMessage({
    action = 'appearance_start',
    skin = GetSkin(PlayerPedId()),
    data = GetData(config)
  })
end

RegisterCommand('atl', function()
  startAppearance()
end)

exports('startAppearance', startAppearance)
AddEventHandler('onResourceStart', loadData)