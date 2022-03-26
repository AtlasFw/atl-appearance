ModelNames = {}
OldSkin = {}
Callback = nil

local function startAppearance(config, cb)
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
  FreezeEntityPosition(PlayerPedId(), true)
  OldSkin = skin
  Callback = cb
  Cam.Create(PlayerPedId())
end

exports('startAppearance', startAppearance)
