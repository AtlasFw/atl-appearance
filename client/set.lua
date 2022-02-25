Set = {}

Set.Model = function(model)
	if model and IsModelInCdimage(model) then
		RequestModel(model)
		while not HasModelLoaded(model) do Wait(0) end

		SetPlayerModel(PlayerId(), model)
		SetModelAsNoLongerNeeded(model)
		local ped = PlayerPedId()

		if Get.IsFreemode(GetHashKey(model)) then
			SetPedDefaultComponentVariation(ped)
			SetPedHeadBlendData(ped, 0, 0, 0, 0, 0, 0, 0, 0, 0, false)
		end
	end
end

Set.Face = function(ped, faceFeatures)
  if ped and faceFeatures then
		for k, v in pairs(constants.FACE_FEATURES) do
			SetPedFaceFeature(ped, k - 1, faceFeatures[v])
		end
  end
end

Set.Component = function(ped, component)
  if ped and component then
    if Get.IsFreemode(GetEntityModel(ped)) and (component.component_id == 0 or component.component_id == 2) then
			return
		end

		SetPedComponentVariation(ped, component.component_id, component.drawable, component.texture, 0)
  end
end

Set.Components = function(ped, components)
  if ped and components then
    for _, v in pairs(components) do
      Set.Component(ped, v)
    end
  end
end

Set.Accessory = function(ped, accessory)
	if ped and accessory then
		if accessory.drawable == -1 then
			ClearPedProp(ped, accessory.prop_id)
		else
			SetPedPropIndex(ped, accessory.prop_id, accessory.drawable, accessory.texture, false)
		end
	end
end

Set.Accessories = function(ped, accessories)
  if ped and accessories then
		for _, v in pairs(accessories) do
			Set.Accessory(ped, v)
		end
  end
end

Set.Heritage = function(ped, heritage)
  if ped and heritage then
    SetPedHeadBlendData(ped, heritage.shapeFather, heritage.shapeMother, heritage.shapeThird, heritage.skinFather, heritage.skinMother, heritage.skinThird, heritage.shapeMix, heritage.skinMix, heritage.thirdMix, false)
  end
end

Set.EyeColor = function(ped, eyeColor)
  if ped and eyeColor then
    SetPedEyeColor(ped, eyeColor)
  end
end

Set.Overlays = function(ped, hair, headOverlays)
  if ped and hair and headOverlays then
    SetPedComponentVariation(ped, 2, hair.style, 0, 0)
    SetPedHairColor(ped, hair.color, hair.highlight)
    ClearPedDecorations(ped)
    for k, v in pairs(constants.HEAD_OVERLAYS) do
			local headOverlay = headOverlays[v]
			SetPedHeadOverlay(ped, k - 1, headOverlay.style, headOverlay.opacity)

			if headOverlay.color then
				local colorType = 1
				if v == 'blush' or v == 'lipstick' or v == 'makeUp' then
					colorType = 2
				end

				SetPedHeadOverlayColor(ped, k - 1, colorType, headOverlay.color, headOverlay.secondColor)
			end
		end
  end
end

Set.Appearance = function(ped, appearance)
  local p = promise.new()
  if appearance then
    Set.Face(ped, appearance.faceFeatures)
    Set.Components(ped, appearance.components)
		Set.Accessories(ped, appearance.accessories)
		Set.Heritage(ped, appearance.heritage)
		Set.EyeColor(ped, appearance.eyeColor)
		Set.Overlays(ped, appearance.hair, appearance.headOverlays)
    p:resolve(appearance)
  end
  return Citizen.Await(p)
end

exports('Set', function()
  return Set
end)