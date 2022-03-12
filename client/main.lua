ModelNames = {}

local function startAppearance(config)
  SetNuiFocus(true, true)
  local data = GetData(config)
  SendNUIMessage {
    action = 'skin_start',
    skin = GetSkin(PlayerPedId()),
    config = data.config,
    settings = data.settings,
    colors = data.colors,
    freeMode = IsFreemode(GetEntityModel(PlayerPedId())),
  }

  Cam.Create(PlayerPedId())
end

RegisterCommand('atl', function()
  startAppearance {}
end)

exports('startAppearance', startAppearance)
