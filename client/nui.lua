RegisterNUICallback('skin_change', function(data, cb)
  if not data or not data.skin then return cb({ freeMode = false }) end
  print(json.encode(data.skin.components.mask))
  SetSkin(PlayerPedId(), data.skin, data.reload)

  -- Use new ped because the model was changed, therefore needing a new ped.
  cb({ freeMode = IsFreemode(GetEntityModel(PlayerPedId())) })
end)

RegisterNUICallback('skin_concluded', function(data, cb)
  if not data.skin then return cb({ skin = false }) end
  SetSkin(PlayerPedId(), data.skin, not IsFreemode(data.skin.model))

  -- Use new ped because the model was changed, therefore needing a new ped.
  cb({ skin = GetSkin(PlayerPedId()) })
  SetNuiFocus(false, false)
end)