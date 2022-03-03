RegisterNUICallback('skin_change', function(data, cb)
  if not data or not data.skin then return cb({ freeMode = false }) end
  local ped = PlayerPedId()
  local freeMode = IsFreemode(ped)
  Set.Skin(ped, data.skin)
  cb({ freeMode = freeMode })
end)

RegisterNUICallback('skin_concluded', function(data, cb)
  if not data.skin then return cb({ skin = false }) end
  local ped = PlayerPedId()
  Set.Skin(ped, data.skin)
  cb({ skin = GetSkin(ped) })
end)