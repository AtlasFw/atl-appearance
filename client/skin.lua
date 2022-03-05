local function requestModel(modelName)
  print(modelName)
	if type(modelName) ~= 'string' then return false end
	if IsModelValid(modelName) and IsModelInCdimage(modelName) then
		RequestModel(modelName)
    local time = GetGameTimer() + 1000
    while time > GetGameTimer() do
      Wait(5)
    end
    if HasModelLoaded(modelName) then
      return true
    end
    SetModelAsNoLongerNeeded(model)
	end
  return false
end

local function loadColors()
	local colors = {
		['hair'] = {},
		['makeUp'] = {}
	}

	for i=0, GetNumHairColors() do
		colors.hair[i + 1] = GetPedHairRgbColor(i)
	end

	for i=0, GetNumMakeupColors() do
		colors.makeUp[i + 1] = GetPedMakeupRgbColor(i)
	end

	return colors
end

local function loadOverlays(ped)
  return {
    ['blemishes'] = {GetPedHeadOverlayData(ped, 0)},
    ['beard'] = {GetPedHeadOverlayData(ped, 1)},
    ['eyebrows'] = {GetPedHeadOverlayData(ped, 2)},
    ['ageing'] = {GetPedHeadOverlayData(ped, 3)},
    ['makeUp'] = {GetPedHeadOverlayData(ped, 4)},
    ['blush'] = {GetPedHeadOverlayData(ped, 5)},
    ['complexion'] = {GetPedHeadOverlayData(ped, 6)},
    ['sunDamage'] = {GetPedHeadOverlayData(ped, 7)},
    ['lipstick'] = {GetPedHeadOverlayData(ped, 8)},
    ['moleAndFreckles'] = {GetPedHeadOverlayData(ped, 9)},
    ['chestHair'] = {GetPedHeadOverlayData(ped, 10)},
    ['bodyBlemishes'] = {GetPedHeadOverlayData(ped, 11)},
  }
end

local function loadConfig(data)
  local config = {
    ['ped'] = data?.ped or true,
    ['inheritance'] = {
      state = data?.inheritance?.state or true,
      face = data?.inheritance?.face or true,
      skin = data?.inheritance?.skin or true
    },
    ['face'] = {
      state = data?.face?.state or true,
      eyebrows = data?.face?.eyebrows or true,
      mouth = data?.face?.mouth or true,
      nose = data?.face?.nose or true,
      jaw = data?.face?.jaw or true,
      chin = data?.face?.chin or true,
      cheeks = data?.face?.cheeks or true,
      neck = data?.face?.neck or true
    },
    ['head'] = {
      state = data?.head?.state or true,
      hair = data?.head?.hair or true,
      eyebrows = data?.head?.eyebrows or true,
      eyecolor = data?.head?.eyecolor or true,
      makeup = data?.head?.makeup or true,
      blush = data?.head?.blush or true,
      beard = data?.head?.beard or true,
      lipstick = data?.head?.lipstick or true,
      blemishes = data?.head?.blemishes or true,
      ageing = data?.head?.ageing or true,
      complexion = data?.head?.complexion or true,
      sundamage = data?.head?.sundamage or true,
      moles = data?.head?.moles or true
    },
    ['upper'] = {
      state = data?.upper?.state or true,
      chesthair = data?.upper?.chesthair or true,
      bodyblemishes = data?.upper?.bodyblemishes or true,
      ears = data?.upper?.ears or true,
      arms = data?.upper?.arms or true,
      hats = data?.upper?.hats or true,
      glasses = data?.upper?.glasses or true,
      tshirt = data?.upper?.tshirt or true,
      jackets = data?.upper?.jackets or true,
      armor = data?.upper?.armor or true,
      decals = data?.upper?.decals or true
    },
    ['lower'] = {
      state = data?.lower?.state or true,
      legs = data?.lower?.legs or true,
      shoes = data?.lower?.shoes or true,
    },
    ['accessories'] = {
      state = data?.accessories?.state or true,
      mask = data?.accessories?.mask or true,
      bags = data?.accessories?.bags or true,
      chains = data?.accessories?.chains or true,
      watches = data?.accessories?.watches or true,
      bracelets = data?.accessories?.bracelets or true
    },
    ['tattoos'] = {
      state = data?.tattoos?.state or true,
      head = data?.tattoos?.head or true,
      torso = data?.tattoos?.torso or true,
      arm = data?.tattoos?.arm or true,
      legs = data?.tattoos?.legs or true
    },
    ['exit'] = {
      state = data?.exit or true
    },
    ['save'] = {
      state = data?.save or true
    }
  }
  return config
end

function GetData(config)
  return {
    config = loadConfig(config),
    colors = loadColors(),
  }
end

function IsFreemode(ped)
  local modelHash = GetEntityModel(ped)
  return modelHash == `mp_m_freemode_01` or modelHash == `mp_f_freemode_01`
end

function GetSkin(ped)
  local shapeFather, shapeMother, _, skinFather, skinMother, _, shapeMix, skinMix, _ = Citizen.InvokeNative(0x2746BD9D88C5C5D0, ped, Citizen.PointerValueIntInitialized(0), Citizen.PointerValueIntInitialized(0), Citizen.PointerValueIntInitialized(0), Citizen.PointerValueIntInitialized(0), Citizen.PointerValueIntInitialized(0), Citizen.PointerValueIntInitialized(0), Citizen.PointerValueFloatInitialized(0), Citizen.PointerValueFloatInitialized(0), Citizen.PointerValueFloatInitialized(0))
  local ov = loadOverlays(ped)

  local skin = {
    ['model'] = 'lorem_ipsum',

    -- Eye color
    ['eyeColor'] = GetPedEyeColor(ped),

    -- Heritage/Head Blend
    ['shapeMother'] =  shapeMother,
    ['shapeFather'] =  shapeFather,
    ['shapeMix'] =  shapeMix,
    ['skinMother'] =  skinMother,
    ['skinFather'] =  skinFather,
    ['skinMix'] = skinMix,

    -- Face Features (-1.0 - 1.0)
    ['noseWidth'] = GetPedFaceFeature(ped, 0),
    ['nosePeakHigh'] = GetPedFaceFeature(ped, 1),
    ['nosePeakSize'] = GetPedFaceFeature(ped, 2),
    ['noseBoneHigh'] = GetPedFaceFeature(ped, 3),
    ['nosePeakLowering'] = GetPedFaceFeature(ped, 4),
    ['noseBoneTwist'] = GetPedFaceFeature(ped, 5),
    ['eyeBrownHigh'] = GetPedFaceFeature(ped, 6),
    ['eyeBrownForward'] = GetPedFaceFeature(ped, 7),
    ['cheeksBoneHigh'] = GetPedFaceFeature(ped, 8),
    ['cheeksBoneWidth'] = GetPedFaceFeature(ped, 9),
    ['cheeksWidth'] = GetPedFaceFeature(ped, 10),
    ['eyesOpening'] = GetPedFaceFeature(ped, 11),
    ['lipsThickness'] = GetPedFaceFeature(ped, 12),
    ['jawBoneWidth'] = GetPedFaceFeature(ped, 13),
    ['jawBoneBackSize'] = GetPedFaceFeature(ped, 14),
    ['chinBoneLowering'] = GetPedFaceFeature(ped, 15),
    ['chinBoneLenght'] = GetPedFaceFeature(ped, 16),
    ['chinBoneSize'] = GetPedFaceFeature(ped, 17),
    ['chinHole'] = GetPedFaceFeature(ped, 18),
    ['neckThickness'] = GetPedFaceFeature(ped, 19),

    -- Accessories/Props
    ['p_hat_drawable'] = GetPedPropIndex(ped, 0),
    ['p_hat_texture'] = GetPedPropTextureIndex(ped, 0),
    ['p_glass_drawable'] = GetPedPropIndex(ped, 1),
    ['p_glass_texture'] = GetPedPropTextureIndex(ped, 1),
    ['p_ear_drawable'] = GetPedPropIndex(ped, 2),
    ['p_ear_texture'] = GetPedPropTextureIndex(ped, 2),
    ['p_watch_drawable'] = GetPedPropIndex(ped, 6),
    ['p_watch_texture'] = GetPedPropTextureIndex(ped, 6),
    ['p_bracelet_drawable'] = GetPedPropIndex(ped, 7),
    ['p_bracelet_texture'] = GetPedPropTextureIndex(ped, 7),

    -- Components
    ['components'] = {
      ['face'] = {GetPedDrawableVariation(ped, 0), 0}, -- Drawable, Texture
      ['mask'] = {GetPedDrawableVariation(ped, 1), 0},
      ['hair'] = {GetPedDrawableVariation(ped, 2), 0},
      ['torso'] = {GetPedDrawableVariation(ped, 3), 0}, -- TShirt
      ['leg'] = {GetPedDrawableVariation(ped, 4), 0},
      ['bag'] = {GetPedDrawableVariation(ped, 5), 0}, -- Also parachute
      ['shoes'] = {GetPedDrawableVariation(ped, 6), 0},
      ['accessory'] = {GetPedDrawableVariation(ped, 7), 0},
      ['undershirt'] = {GetPedDrawableVariation(ped, 8), 0},
      ['kevlar'] = {GetPedDrawableVariation(ped, 9), 0},
      ['badge'] = {GetPedDrawableVariation(ped, 10), 0},
      ['torso2'] = {GetPedDrawableVariation(ped, 11), 0}, -- Jackets?
    },

    -- Hair
    ['hairUpStyle'] = GetPedDrawableVariation(ped, 2),
    ['hairUpColor'] = GetPedHairColor(ped),
    ['hairUpHighlight'] = GetPedHairHighlightColor(ped),

    -- Head overlays
    ['makeUpStyle'] = ov['makeUp'][2],
    ['makeUpColor'] = ov['makeUp'][4],
    ['makeUpOpacity'] = ov['makeUp'][6],
    ['eyebrowsUpStyle'] = ov['eyebrows'][2],
    ['eyebrowsUpColor'] = ov['eyebrows'][4],
    ['eyebrowsUpOpacity'] = ov['eyebrows'][6],
    ['moleAndFrecklesUpStyle'] = ov['moleAndFreckles'][2],
    ['moleAndFrecklesUpOpacity'] = ov['moleAndFreckles'][6],
    ['blushUpStyle'] = ov['blush'][2],
    ['blushUpColor'] = ov['blush'][4],
    ['blushUpOpacity'] = ov['blush'][6],
    ['chestHairUpStyle'] = ov['chestHair'][2],
    ['chestHairUpColor'] = ov['chestHair'][4],
    ['chestHairUpOpacity'] = ov['chestHair'][6],
    ['lipstickUpStyle'] = ov['lipstick'][2],
    ['lipstickUpColor'] = ov['lipstick'][4],
    ['lipstickUpOpacity'] = ov['lipstick'][6],
    ['sunDamageUpStyle'] = ov['sunDamage'][2],
    ['sunDamageUpOpacity'] = ov['sunDamage'][6],
    ['bodyBlemishesUpStyle'] = ov['bodyBlemishes'][2],
    ['bodyBlemishesUpOpacity'] = ov['bodyBlemishes'][6],
    ['complexionUpStyle'] = ov['complexion'][2],
    ['complexionUpOpacity'] = ov['complexion'][6],
    ['ageingUpStyle'] = ov['ageing'][2],
    ['ageingUpOpacity'] = ov['ageing'][6],
    ['blemishesUpStyle'] = ov['blemishes'][2],
    ['blemishesUpOpacity'] = ov['blemishes'][6],
    ['beardUpStyle'] = ov['beard'][2],
    ['beardUpColor'] = ov['beard'][4],
    ['beardUpOpacity'] = ov['beard'][6],
  }
  return skin
end

function SetSkin(ped, skin, isFreeMode)
  if type(ped) == 'number' and type(skin) == 'table' and skin['model'] then
    if requestModel(skin['model']) then
      if not isFreeMode then

        return
      end
      return true
    end
  end
  print('Did not load')
  return skin
end

exports('setSkin', setSkin)
exports('getSkin', getSkin)