RegisterNUICallback('appearance_model', function(data, cb)
  if not data then return cb({false}) end
  Set.Model(data.model)
  cb({ isFreeModel = Get.IsFreemode(GetHashKey(data.model)) })
end)

RegisterNUICallback('appearance_component', function(data, cb)
  if not data then return cb({false}) end
  Set.Component(PlayerPedId(), data)
  cb({true})
end)

RegisterNUICallback('appearance_accessory', function(data, cb)
  if not data then return cb({false}) end
  Set.Accessory(PlayerPedId(), data)
  cb({true})
end)

RegisterNUICallback('appearance_heritage', function(data, cb)
  if not data then return cb({false}) end
  Set.Heritage(PlayerPedId(), data)
  cb({true})
end)

RegisterNUICallback('appearance_face_feature', function(data, cb)
  if not data then return cb({false}) end
  Set.Face(PlayerPedId(), data)
  cb({true})
end)

RegisterNUICallback('appearance_hair', function(data, cb)
  if not data then return cb({false}) end
  local ped = PlayerPedId()
  Set.Overlays(PlayerPedId(), data.style, data)
  cb({true})
end)

RegisterNUICallback('appearance_eye_color', function(data, cb)
  if not data then return cb({false}) end
  Set.EyeColor(PlayerPedId(), data)
  cb({true})
end)


RegisterNUICallback('appearance_concluded', function(data, cb)
  if not data then return cb({false}) end
  print("finish")
  cb({true})
end)