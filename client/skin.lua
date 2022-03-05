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
    ['chinBoneLength'] = GetPedFaceFeature(ped, 16),
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
      ['face'] = {GetPedDrawableVariation(ped, 0), GetPedTextureVariation(ped, 0)}, -- Drawable, Texture
      ['mask'] = {GetPedDrawableVariation(ped, 1), GetPedTextureVariation(ped, 1)},
      ['hair'] = {GetPedDrawableVariation(ped, 2), GetPedTextureVariation(ped, 2)},
      ['torso'] = {GetPedDrawableVariation(ped, 3), GetPedTextureVariation(ped, 3)}, -- TShirt
      ['leg'] = {GetPedDrawableVariation(ped, 4), GetPedTextureVariation(ped, 4)},
      ['bag'] = {GetPedDrawableVariation(ped, 5), GetPedTextureVariation(ped, 5)}, -- Also parachute
      ['shoes'] = {GetPedDrawableVariation(ped, 6), GetPedTextureVariation(ped, 6)},
      ['accessory'] = {GetPedDrawableVariation(ped, 7), GetPedTextureVariation(ped, 7)},
      ['undershirt'] = {GetPedDrawableVariation(ped, 8), GetPedTextureVariation(ped, 8)},
      ['kevlar'] = {GetPedDrawableVariation(ped, 9), GetPedTextureVariation(ped, 9)},
      ['badge'] = {GetPedDrawableVariation(ped, 10), GetPedTextureVariation(ped, 10)},
      ['torso2'] = {GetPedDrawableVariation(ped, 11), GetPedTextureVariation(ped, 11)}, -- Jackets?
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

---Set the skin of a player.
---@param ped number
---@param skin table
---@param isFreeMode boolean
---@param reload boolean
---@return boolean
function SetSkin(ped, skin, isFreeMode, reload)
  if type(ped) == 'number' and type(skin) == 'table' and skin['model'] then
    if requestModel(skin['model']) then
      if not isFreeMode then
        SetPlayerModel(PlayerId(), GetEntityModel(skin['model']))
        SetPedDefaultComponentVariation(ped)
        return
      end

      if reload then
        SetPlayerModel(PlayerId(), GetEntityModel(skin['model']))
        Wait(150)
      end

      -- Eye Color
      SetPedEyeColor(ped, skin['eyeColor'])

      -- Heritage/Head Blend
      SetPedHeadBlendData(ped, skin['shapeMother'], skin['shapeFather'], 0, skin['skinMother'], skin['skinFather'], 0, skin['shapeMix'], skin['skinMix'], 0, true)

      -- Face features
      SetPedFaceFeature(ped, 0,  skin['noseWidth'])
      SetPedFaceFeature(ped, 1,  skin['nosePeakHigh'])
      SetPedFaceFeature(ped, 2,  skin['nosePeakSize'])
      SetPedFaceFeature(ped, 3,  skin['noseBoneHigh'])
      SetPedFaceFeature(ped, 4,  skin['nosePeakLowering'])
      SetPedFaceFeature(ped, 5,  skin['noseBoneTwist'])
      SetPedFaceFeature(ped, 6,  skin['eyeBrownHigh'])
      SetPedFaceFeature(ped, 7,  skin['eyeBrownForward'])
      SetPedFaceFeature(ped, 8,  skin['cheeksBoneHigh'])
      SetPedFaceFeature(ped, 9,  skin['cheeksBoneWidth'])
      SetPedFaceFeature(ped, 10, skin['cheeksWidth'])
      SetPedFaceFeature(ped, 11, skin['eyesOpening'])
      SetPedFaceFeature(ped, 12, skin['lipsThickness'])
      SetPedFaceFeature(ped, 13, skin['jawBoneWidth'])
      SetPedFaceFeature(ped, 14, skin['jawBoneBackSize'])
      SetPedFaceFeature(ped, 15, skin['chinBoneLowering'])
      SetPedFaceFeature(ped, 16, skin['chinBoneLength'])
      SetPedFaceFeature(ped, 17, skin['chinBoneSize'])
      SetPedFaceFeature(ped, 18, skin['chinHole'])
      SetPedFaceFeature(ped, 19, skin['neckThickness'])
      Wait(5)

      -- Hair
      SetPedComponentVariation(ped, 2, skin['hairUpStyle'], 0, 0)
      SetPedHairColor(ped, skin['hairUpColor'], skin['hairUpHighlight'])

      -- Head overlays
      SetPedHeadOverlay(ped, 0, skin['blemishesUpStyle'], skin['blemishesUpOpacity'])
      SetPedHeadOverlay(ped, 1, skin['beardUpStyle'], skin['beardUpOpacity'])
      SetPedHeadOverlay(ped, 2, skin['eyebrowsUpStyle'], skin['eyebrowsUpOpacity'])
      SetPedHeadOverlay(ped, 3, skin['ageingUpStyle'], skin['ageingUpOpacity'])
      SetPedHeadOverlay(ped, 4, skin['makeUpStyle'], skin['makeUpOpacity'])
      SetPedHeadOverlay(ped, 5, skin['blushUpStyle'], skin['blushUpOpacity'])
      SetPedHeadOverlay(ped, 6, skin['complexionUpStyle'], skin['complexionUpOpacity'])
      SetPedHeadOverlay(ped, 7, skin['sunDamageUpStyle'], skin['sunDamageUpOpacity'])
      SetPedHeadOverlay(ped, 8, skin['lipstickUpStyle'], skin['lipstickUpColor'])
      SetPedHeadOverlay(ped, 9, skin['moleAndFrecklesUpStyle'], skin['moleAndFrecklesUpOpacity'])
      SetPedHeadOverlay(ped, 10, skin['chestHairUpStyle'], skin['chestHairUpOpacity'])
      SetPedHeadOverlay(ped, 11, skin['bodyBlemishesUpStyle'], skin['bodyBlemishesUpOpacity'])

      SetPedHeadOverlayColor(ped, 1, 1, skin['beardUpColor'], 0)
      SetPedHeadOverlayColor(ped, 2, 1, skin['eyebrowsUpColor'], 0)
      SetPedHeadOverlayColor(ped, 4, 2, skin['makeupColor'], 0)
      SetPedHeadOverlayColor(ped, 5, 2, skin['blushUpColor'], 0)
      SetPedHeadOverlayColor(ped, 8, 2, skin['lipstickUpColor'], 0)
      SetPedHeadOverlayColor(ped, 10, 1, skin['chestHairUpColor'], 0)
      Wait(5)

      -- Components
      for i=1, #skin['components'] do
        SetPedComponentVariation(ped, (i - 1), skin['components'][i][1], skin['components'][i][2], 0)
      end

      -- Accessories/Props
      SetPedPropIndex(ped, 0, skin['p_hat_drawable'], skin['p_hat_texture'], true)
      SetPedPropIndex(ped, 1, skin['p_glass_drawable'], skin['p_glass_texture'], true)
      SetPedPropIndex(ped, 2, skin['p_ear_drawable'], skin['p_ear_texture'], true)
      SetPedPropIndex(ped, 6, skin['p_watch_drawable'], skin['p_watch_texture'], true)
      SetPedPropIndex(ped, 7, skin['p_bracelet_drawable'], skin['p_bracelet_texture'], true)
      print('New Skin')
      return true
    end
  end
  print('Did not load')
  return skin
end

exports('setSkin', setSkin)
exports('getSkin', getSkin)