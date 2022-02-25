Get = {}

local function round(number, decimalPlaces)
	return tonumber(string.format('%.' .. (decimalPlaces or 0) .. 'f', number))
end

Get.IsFreemode = function(model)
  return model == GetHashKey('mp_m_freemode_01') or model == GetHashKey('mp_f_freemode_01')
end

Get.Accessories = function(ped)
  local count = 0
  local size = #constants.PED_PROPS_IDS
  local props = table.create(size, 0)

  for i = 1, size do
    local propId = constants.PED_PROPS_IDS[i]
    count = count + 1
    props[count] = {
      prop_id = propId,
      drawable = GetPedPropIndex(ped, propId),
      texture = GetPedPropTextureIndex(ped, propId),
    }
  end
  return props
end

Get.Components = function(ped)
	local count = 0
	local size = #constants.PED_COMPONENTS_IDS
	local components = table.create(size, 0)

	for i = 1, size do
		local componentId = constants.PED_COMPONENTS_IDS[i]
		count += 1
		components[count] = {
			component_id = componentId,
			drawable = GetPedDrawableVariation(ped, componentId),
			texture = GetPedTextureVariation(ped, componentId),
		}
	end

	return components
end

Get.Overlays = function(ped)
	local size = #constants.HEAD_OVERLAYS
	local headOverlays = table.create(0, size)

	for i = 1, size do
		local overlay = constants.HEAD_OVERLAYS[i]
		local _, value, _, firstColor, secondColor, opacity = GetPedHeadOverlayData(ped, i - 1)

		if value ~= 255 then
			opacity = round(opacity, 1)
		else
			value = 0
			opacity = 0
		end

		headOverlays[overlay] = {style = value, opacity = opacity, color = firstColor, secondColor = secondColor}
	end
  local hair = {
    style = GetPedDrawableVariation(ped, 2),
		color = GetPedHairColor(ped),
		highlight = GetPedHairHighlightColor(ped)
  }

  return {
    hair = hair,
    headOverlays = headOverlays
  }
end

Get.Face = function(ped)
  local size = #constants.FACE_FEATURES
	local faceFeatures = table.create(0, size)

	for i = 1, size do
		local feature = constants.FACE_FEATURES[i]
		faceFeatures[feature] = round(GetPedFaceFeature(ped, i - 1), 1)
	end
	return faceFeatures
end

Get.Inheritance = function(ped)
  local shapeFather, shapeMother, _, skinFather, skinMother, _, shapeMix, skinMix, _ = Citizen.InvokeNative(0x2746BD9D88C5C5D0, ped, Citizen.PointerValueIntInitialized(0), Citizen.PointerValueIntInitialized(0), Citizen.PointerValueIntInitialized(0), Citizen.PointerValueIntInitialized(0), Citizen.PointerValueIntInitialized(0), Citizen.PointerValueIntInitialized(0), Citizen.PointerValueFloatInitialized(0), Citizen.PointerValueFloatInitialized(0), Citizen.PointerValueFloatInitialized(0))
  return {
    shapeFather,
    shapeMother,
    shapeMix,
    skinFather,
    skinMother,
    skinMix,
  }
end

Get.Appearance = function(ped)
  local eyeColor = GetPedEyeColor(ped)
  local overlays = Get.Overlays(ped)
  local appearance = {
    ped = GetEntityModel(ped) or `mp_m_freemode_01`,
		heritage = Get.Inheritance(ped),
		faceFeatures = Get.Face(ped),
		headOverlays = overlays.headOverlays,
		components = Get.Components(ped),
		accessories = Get.Accessories(ped),
		hair = overlays.hair,
		-- tattoos = tattoos,
		eyeColor = eyeColor < #constants.EYE_COLORS and eyeColor or 0
  }
  return appearance
end

exports('Get', function()
  return Get
end)
