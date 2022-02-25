local function loadConfig(resource)
  if resource == GetCurrentResourceName() then
    Wait(1500)
    SendNUIMessage({
      action = 'set_models',
      models = constants.PED_MODELS
    })
  end
end

local function startAppearance()
  Wait(2000)
  SetNuiFocus(true, true)
  SendNUIMessage({
    action = 'set_appearance',
    appearance = Get.Appearance(PlayerPedId())
  })
end

AddEventHandler('onResourceStart', loadConfig)

RegisterCommand('atl', function()
  startAppearance()
end)

exports('startAppearance', startAppearance)