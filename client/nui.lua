RegisterNUICallback('skin_change', function(data, cb)
  if not data or not data.skin then return cb({ freeMode = false }) end
  local ped = PlayerPedId()
  local freeMode = IsFreemode(ped)
  SetSkin(ped, data.skin, freeMode)
  cb({ freeMode = freeMode })
end)

RegisterNUICallback('skin_concluded', function(data, cb)
  if not data.skin then return cb({ skin = false }) end
  local ped = PlayerPedId()
  SetSkin(ped, data.skin, freeMode)
  cb({ skin = GetSkin(ped) })
end)