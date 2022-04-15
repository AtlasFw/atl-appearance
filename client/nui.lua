local accessories <const> = {
  ['p_hat'] = 0,
  ['p_glass'] = 1,
  ['p_ear'] = 2,
  ['p_watch'] = 6,
  ['p_bracelet'] = 7,
}

local components <const> = {
  ['face'] = 0,
  ['mask'] = 1,
  ['hair'] = 2,
  ['torso'] = 3,
  ['leg'] = 4,
  ['bag'] = 5,
  ['shoes'] = 6,
  ['accessory'] = 7,
  ['undershirt'] = 8,
  ['kevlar'] = 9,
  ['badge'] = 10,
  ['torso2'] = 11,
}

-- Ped rotation
local rot <const> = {
  ['left'] = -45.0,
  ['right'] = 45.0
}

RegisterNUICallback('app_loaded', function(_, cb)
  local models = exports['atl-core']:Models()
  local locale = exports['atl-core']:GetLocale()
  for i = 1, #models do
    ModelNames[joaat(models[i].value)] = models[i].label
  end

  cb {
    models = models,
    locales = locale 'appearance',
  }
end)

RegisterNUICallback('skin_rotate', function(data, cb)
  if not data.rotation then cb {} return end
  local ped = PlayerPedId()
  SetEntityHeading(ped, GetEntityHeading(ped) + rot[data.rotation])
  cb {}
end)

RegisterNUICallback('skin_camera', function(data, cb)
  if not data or not data.camera then
    return cb {}
  end
  Cam.MoveTo(data.camera, data.skin)
  cb { }
end)

RegisterNUICallback('skin_change', function(data, cb)
  if not data or not data.skin then
    return cb { freeMode = false }
  end
  SetSkin(PlayerPedId(), data.skin, data.reload)

  -- New Ped because the old one is removed by SetSkin
  local ped = PlayerPedId()
  local freeMode = IsFreemode(joaat(data.skin.model))
  local skin = GetSkin(ped, true)
  if data.component then
    cb { component = GetComponentSettings(ped, components[data.key]), skin = skin }
  elseif data.prop then
    cb { prop = GetAccessorySettings(ped, accessories[data.key]), skin = skin }
  else
    if data.key == 'model' then
      cb { freeMode = freeMode, skin = skin }
    end
    cb { freeMode = freeMode, skin = skin, settings = loadSettings() }
  end
end)

RegisterNUICallback('skin_concluded', function(data, cb)
  local skin = OldSkin
  if data.skin then
    skin = data.skin
    Callback(true, data.skin, OldSkin)
  else
    -- Returns nil if the skin is not changed + the old skin
    Callback(false, skin)
  end
  cb { skin = skin }
  if ReloadSkin then
    SetSkin(PlayerPedId(), skin, GetEntityModel(PlayerPedId()) == joaat(skin.model))
  else
    SetSkin(PlayerPedId(), OldSkin, GetEntityModel(PlayerPedId()) == joaat(OldSkin.model))
  end
  TriggerServerEvent("atl-appearance:server:saveSkin", skin)
  FreezeEntityPosition(PlayerPedId(), false)
  SetNuiFocus(false, false)
  Cam.Destroy()
  Callback, ReloadSkin = nil, false
  OldSkin = data.skin
end)
