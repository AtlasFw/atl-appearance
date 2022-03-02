RegisterNUICallback('appearance_change', function(data, cb)
  if not data then return cb({false}) end
  Set.Skin(data.skin)
  cb({ isFreeModel = Get.IsFreemode(GetHashKey(data.model)) })
end)

RegisterNUICallback('appearance_concluded', function(data, cb)
  if not data  then return cb({false}) end
  local ped = PlayerPedId()
  Set.Skin(ped, data)
  cb({appearance = Get.Appearance(ped)})
end)