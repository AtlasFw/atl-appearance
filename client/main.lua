local function loadData(resource)
  if resource == GetCurrentResourceName() then
    Wait(1500)
    local models <const> = exports['atl-core']:Models()
    local locale = exports['atl-core']:GetLocale()
    SendNUIMessage({
      action = 'start_up',
      models = models,
      locales = locale('appearance')
    })
  end
end

local function startAppearance(config)
  SetNuiFocus(true, true)
  local data = GetData(config)
  SendNUIMessage({
    action = 'skin_start',
    skin = GetSkin(PlayerPedId()),
    config = data.config,
    colors = data.colors
  })
end

RegisterCommand('atl', function()
  startAppearance({})
end)

exports('startAppearance', startAppearance)
AddEventHandler('onClientResourceStart', loadData)