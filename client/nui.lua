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
  local freeMode = IsFreemode(GetEntityModel(ped))
  local skin = GetSkin(ped, true)
  if data.component then
    cb { freeMode = freeMode, component = GetComponentSettings(ped, components[data.key]), skin = skin }
  elseif data.prop then
    cb { freeMode = freeMode, prop = GetAccessorySettings(ped, accessories[data.key]), skin = skin }
  else
    cb { freeMode = freeMode, skin = skin }
  end
end)

RegisterNUICallback('skin_concluded', function(data, cb)
  local skin = OldSkin
  if data and data.skin then
    skin = data.skin
    OldSkin = data.skin
  end

  SetSkin(PlayerPedId(), skin, not IsFreemode(GetEntityModel(skin.model)))
  Cam.Destroy()
	FreezeEntityPosition(PlayerPedId(), false)
  SetNuiFocus(false, false)
  cb { skin = GetSkin(PlayerPedId()) }
end)
