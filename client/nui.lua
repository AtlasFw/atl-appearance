RegisterNUICallback('skin_change', function(data, cb)
  if not data or not data.skin then return cb({ freeMode = false }) end
  SetSkin(PlayerPedId(), data.skin, data.reload)

  -- Use new ped because the model was changed, therefore needing a new ped.
  cb({ freeMode = IsFreemode(GetEntityModel(PlayerPedId())) })
end)

RegisterNUICallback('skin_concluded', function(data, cb)
  if not data.skin then return cb({ skin = false }) end
  local ped = PlayerPedId()
  SetSkin(ped, data.skin, freeMode, true)
  cb({ skin = GetSkin(ped) })
end)