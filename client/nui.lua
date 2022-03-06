local accessories <const> = {
  ['p_hat'] = 0,
  ['p_glass'] = 1,
  ['p_ear'] = 2,
  ['p_watch'] = 6,
  ['p_bracelet'] = 7
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
  ['badge'] =  10,
  ['torso2'] = 11
}

RegisterNUICallback('skin_change', function(data, cb)
  if not data or not data.skin then return cb({ freeMode = false }) end
  SetSkin(PlayerPedId(), data.skin, data.reload)

  -- New Ped because the old one is removed by SetSkin

  local ped = PlayerPedId()
  local freeMode = IsFreemode(GetEntityModel(ped))
  if data.component  then
    cb({ freeMode = freeMode, component = GetComponentSettings(ped, components[data.key]) })
  elseif data.prop then
    cb({ freeMode = freeMode, prop = GetAccessorySettings(ped, accessories[data.prop]) })
  else
    cb({ freeMode = freeMode })
  end
end)

RegisterNUICallback('skin_concluded', function(data, cb)
  if not data.skin then return cb({ skin = false }) end
  SetSkin(PlayerPedId(), data.skin, not IsFreemode(joaat(data.skin.model)))

  -- Use new ped because the model was changed, therefore needing a new ped.
  cb({ skin = GetSkin(PlayerPedId()) })
  SetNuiFocus(false, false)
end)