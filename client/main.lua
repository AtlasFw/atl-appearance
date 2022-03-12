ModelNames = {}
OldSkin = {}

local function startAppearance(config)
  SetNuiFocus(true, true)
  local data = GetData(config)
  local skin = GetSkin(PlayerPedId())
  SendNUIMessage {
    action = 'skin_start',
    skin = skin,
    config = data.config,
    settings = data.settings,
    colors = data.colors,
    freeMode = IsFreemode(GetEntityModel(PlayerPedId())),
  }
  OldSkin = skin
  Cam.Create(PlayerPedId())
end

RegisterCommand('atl', function()
  startAppearance {}
end)

exports('startAppearance', startAppearance)
