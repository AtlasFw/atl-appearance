ModelNames = {}
OldSkin = {}
Callback = nil
ReloadSkin = false

local function startAppearance(config, cb, reloadSkin)
  SetNuiFocus(true, true)
  local ped = PlayerPedId()
  local data = GetData(config)
  local skin = GetSkin(ped)
  SendNUIMessage {
    action = 'skin_start',
    skin = skin,
    config = data.config,
    settings = data.settings,
    colors = data.colors,
    freeMode = IsFreemode(GetEntityModel(ped)),
  }
  FreezeEntityPosition(ped, true)
  Cam.Create(ped)
  OldSkin = skin
  Callback = cb
  ReloadSkin = reloadSkin
end

exports('startAppearance', startAppearance)
