local tattoos, fades = exports['atl-core']:Tattoos(), exports['atl-core']:Overlays()
local isNaked = false
local nakedClothes = {
  [`mp_m_freemode_01`] = {
    ['torso'] = {15, 0},
    ['leg'] = {14, 0},
    ['undershirt'] = {15, 0},
    ['torso2'] = {91, 0},
    ['shoes'] = {5, 0},
    ['p_glass_drawable'] = 0,
    ['p_glass_texture'] = 0
  },
  [`mp_f_freemode_01`] = {
    ['torso'] = {15, 0},
    ['leg'] = {16, 0},
    ['undershirt'] = {34, 0},
    ['torso2'] = {101, 1},
    ['shoes'] = {5, 0},
    ['p_glass_drawable'] = 5,
    ['p_glass_texture'] = 0
  },
}

local function requestModel(modelName)
  if type(modelName) ~= 'string' then return false end
	if IsModelValid(modelName) and IsModelInCdimage(modelName) then
		RequestModel(modelName)
    local time = GetGameTimer() + 1000
    while time > GetGameTimer() do
      if HasModelLoaded(modelName) then
        return true
      end
      Wait(5)
    end
    SetModelAsNoLongerNeeded(model)
	end
  return false
end

---Loads all the colors in rgba format.
---@return table
local function loadColors()
	local colors = {
		['typeOne'] = {},
		['typeTwo'] = {}
	}

	for i=1, GetNumHairColors() do
		local color = {GetPedHairRgbColor(i - 1)}
    colors.typeOne[i] = ('rgba(%s, %s, %s, 1.0)'):format(color[1], color[2], color[3])
	end

	for i=1, GetNumMakeupColors() do
    local color = {GetPedMakeupRgbColor(i - 1)}
    colors.typeTwo[i] = ('rgba(%s, %s, %s, 1.0)'):format(color[1], color[2], color[3])
	end

	return colors
end

---Loads all the overlays data.
---@param ped number
---@return table
local function loadOverlays(ped)
  local overlays = {
    ['blemishes'] = {},
    ['beard'] = {},
    ['eyebrows'] = {},
    ['ageing'] = {},
    ['makeUp'] = {},
    ['blush'] = {},
    ['complexion'] = {},
    ['sunDamage'] = {},
    ['lipstick'] = {},
    ['moleAndFreckles'] = {},
    ['chestHair'] =  {},
    ['bodyBlemishes'] =  {},
  }
  local count = 0
  for name, _ in pairs(overlays) do
    overlays[name] = {GetPedHeadOverlayData(ped, count)}
    if overlays[name][2] >= 255 then
      overlays[name][2] = 0
      overlays[name][6] = 0
    end
    if overlays[name][4] < 0 then
      overlays[name][4] = 0
    end
    count += 1
  end
  return overlays
end

---Config to be send to the UI
---@param data table - Your config specifications
---@return table
local function loadConfig(data)
  local config = {
    ['ped'] = {
      state = true,
    },
    ['inheritance'] = {
      state = true,
      face = true,
      skin = true
    },
    ['face'] = {
      state = true,
      eyebrows = true,
      mouth = true,
      nose = true,
      jaw = true,
      chin = true,
      cheeks = true,
      neck = true
    },
    ['head'] = {
      state = true,
      hair = true,
      eyebrows = true,
      eyecolor = true,
      makeup = true,
      blush = true,
      beard = true,
      lipstick = true,
      blemishes = true,
      ageing = true,
      complexion = true,
      sundamage = true,
      moles = true
    },
    ['upper'] = {
      state = true,
      chesthair = true,
      bodyblemishes = true,
      ears = true,
      arms = true,
      hats = true,
      tshirt = true,
      jackets = true,
      armor = true,
      decals = true
    },
    ['lower'] = {
      state = true,
      legs = true,
      shoes = true,
    },
    ['accessories'] = {
      state = true,
      glasses = true,
      mask = true,
      bags = true,
      chains = true,
      watches = true,
      bracelets = true
    },
    ['tattoos'] = {
      state = true,
      head = true,
      torso = true,
      arm = true,
      legs = true
    },
    ['exit'] = {
      state = true
    },
    ['save'] = {
      state = true
    }
  }

  for k, v in pairs(data) do
    if k == 'exit' or k == 'save' or k == 'ped' then
      config[k].state = v
    else
      for k2, v2 in pairs(v) do
        config[k][k2] = v2
      end
    end
  end
  return config
end

function loadSettings()
  local ped = PlayerPedId()
  local model = GetEntityModel(ped)
  SetEntityVisible(ped, true)

  -- Default: Step - 0.1 | Max - 1.0 | Min - 0.0 === SLIDER
  local settings = {
    -- Head overlays
    ['blemishes'] =  { min = 0, max = GetPedHeadOverlayNum(0) },
    ['beard'] = { min = 0, max = GetPedHeadOverlayNum(1) },
    ['eyebrows'] = { min = 0, max = GetPedHeadOverlayNum(2) },
    ['ageing'] = { min = 0, max = GetPedHeadOverlayNum(3) },
    ['makeUp'] = { min = 0, max = GetPedHeadOverlayNum(4) },
    ['blush'] = { min = 0, max = GetPedHeadOverlayNum(5) },
    ['complexion'] = { min = 0, max = GetPedHeadOverlayNum(6) },
    ['sunDamage'] = { min = 0, max = GetPedHeadOverlayNum(7) },
    ['lipstick'] = { min = 0, max = GetPedHeadOverlayNum(8) },
    ['moleAndFreckles'] = { min = 0, max = GetPedHeadOverlayNum(9) },
    ['chestHair'] = { min = 0, max = GetPedHeadOverlayNum(10) },
    ['bodyBlemishes'] = { min = 0, max = GetPedHeadOverlayNum(11) },

    -- Hair
    ['hairUpStyle'] = { min = 0, max = GetNumberOfPedDrawableVariations(ped, 2) - 1 }, -- -1?
    ['hairUpFade'] = { min = 0, max = fades[model] and #fades[model] or 1},

    -- Accessories/Props
    ['p_hat'] = GetAccessorySettings(ped, 0),
    ['p_glass'] = GetAccessorySettings(ped, 1),
    ['p_ear'] = GetAccessorySettings(ped, 2),
    ['p_watch'] = GetAccessorySettings(ped, 6),
    ['p_bracelet'] = GetAccessorySettings(ped, 7),

    -- Tattoos
    ['t_head'] = { min = 0, max = tattoos[model] and #tattoos[model]?.head or 0 },
    ['t_torso'] = { min = 0, max = tattoos[model] and #tattoos[model]?.torso or 0 },
    ['t_armRight'] = { min = 0, max = tattoos[model] and #tattoos[model]?.rightArm or 0 },
    ['t_armLeft'] = { min = 0, max = tattoos[model] and #tattoos[model]?.leftArm or 0 },
    ['t_legRight'] = { min = 0, max = tattoos[model] and #tattoos[model]?.rightLeg or 0 },
    ['t_legLeft'] = { min = 0, max = tattoos[model] and #tattoos[model]?.leftLeg or 0 },

    -- Components
    ['components'] = {
      ['face'] = GetComponentSettings(ped, 0),
      ['mask'] = GetComponentSettings(ped, 1),
      ['hair'] = GetComponentSettings(ped, 2),
      ['torso'] = GetComponentSettings(ped, 3), -- Arms
      ['leg'] = GetComponentSettings(ped, 4),
      ['bag'] = GetComponentSettings(ped, 5),
      ['shoes'] = GetComponentSettings(ped, 6),
      ['accessory'] = GetComponentSettings(ped, 7),
      ['undershirt'] = GetComponentSettings(ped, 8),
      ['kevlar'] = GetComponentSettings(ped, 9),
      ['badge'] = GetComponentSettings(ped, 10),
      ['torso2'] = GetComponentSettings(ped, 11)
    }
  }
  return settings
end

---Returns if the player has a freemode model
---@param modelHash number
---@return boolean
function IsFreemode(modelHash)
  return modelHash == `mp_m_freemode_01` or modelHash == `mp_f_freemode_01`
end

---Just a getter function to get the config and colors
---@param config table
---@return table
function GetData(config)
  return {
    config = loadConfig(config),
    colors = loadColors(),
    settings = loadSettings()
  }
end

---Returns the min/max values for props/accessory
---@param ped number
---@param id number
---@return table
function GetAccessorySettings(ped, id)
  local settings = {
    drawable = { min = -1, max = GetNumberOfPedPropDrawableVariations(ped, id) - 1 },
    texture = { min = -1, max = GetNumberOfPedPropTextureVariations(ped, id, GetPedPropIndex(ped, id)) - 1 }
  }
  return settings
end

---Returns the min/max values for component
---@param ped number
---@param id number
---@return table
function GetComponentSettings(ped, id)
  local settings = {
    drawable = { min = 0, max = GetNumberOfPedDrawableVariations(ped, id) - 1 },
    texture = { min = 0, max = GetNumberOfPedTextureVariations(ped, id, GetPedDrawableVariation(ped, id)) - 1 }
  }
  return settings
end

---Returns the ped's appearance/skin
---@param ped number
---@return table
function GetSkin(ped, ignore)
  if OldSkin and OldSkin.model and not ignore then
    return OldSkin
  end

  local shapeFather, shapeMother, _, skinFather, skinMother, _, shapeMix, skinMix, _ = Citizen.InvokeNative(0x2746BD9D88C5C5D0, ped, Citizen.PointerValueIntInitialized(0), Citizen.PointerValueIntInitialized(0), Citizen.PointerValueIntInitialized(0), Citizen.PointerValueIntInitialized(0), Citizen.PointerValueIntInitialized(0), Citizen.PointerValueIntInitialized(0), Citizen.PointerValueFloatInitialized(0), Citizen.PointerValueFloatInitialized(0), Citizen.PointerValueFloatInitialized(0))
  local ov = loadOverlays(ped)
  local eyeColor = GetPedEyeColor(ped)
  local hairUpColor, hairUpHighlight = GetPedHairColor(ped), GetPedHairHighlightColor(ped)
  local skin = {
    ['model'] = ModelNames[GetEntityModel(ped)],

    -- Eye color
    ['eyeColor'] = eyeColor < 30 and eyeColor or 0,

    -- Heritage/Head Blend
    ['shapeMother'] = shapeMother,
    ['shapeFather'] = shapeFather,
    ['shapeMix'] = tonumber(string.format("%.3f", shapeMix)),
    ['skinMother'] = skinMother,
    ['skinFather'] = skinFather,
    ['skinMix'] = tonumber(string.format("%.3f", skinMix)),

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

    -- Hair
    ['hairUpStyle'] = GetPedDrawableVariation(ped, 2),
    ['hairUpFade'] = 0, -- Overlays (OVERLAYS)
    ['hairUpColor'] = hairUpColor ~= 255 and hairUpColor or 0,
    ['hairUpHighlight'] = hairUpHighlight ~= 255 and hairUpHighlight or 0,

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

    -- Tattoos
    ['t_head'] = 0,
    ['t_torso'] = 0,
    ['t_armRight'] = 0,
    ['t_armLeft'] = 0,
    ['t_legRight'] = 0,
    ['t_legLeft'] = 0,

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
      ['torso'] = {GetPedDrawableVariation(ped, 3), GetPedTextureVariation(ped, 3)},  -- Arms
      ['leg'] = {GetPedDrawableVariation(ped, 4), GetPedTextureVariation(ped, 4)},
      ['bag'] = {GetPedDrawableVariation(ped, 5), GetPedTextureVariation(ped, 5)}, -- Also parachute
      ['shoes'] = {GetPedDrawableVariation(ped, 6), GetPedTextureVariation(ped, 6)},
      ['accessory'] = {GetPedDrawableVariation(ped, 7), GetPedTextureVariation(ped, 7)},
      ['undershirt'] = {GetPedDrawableVariation(ped, 8), GetPedTextureVariation(ped, 8)},
      ['kevlar'] = {GetPedDrawableVariation(ped, 9), GetPedTextureVariation(ped, 9)},
      ['badge'] = {GetPedDrawableVariation(ped, 10), GetPedTextureVariation(ped, 10)},
      ['torso2'] = {GetPedDrawableVariation(ped, 11), GetPedTextureVariation(ped, 11)}, -- Jackets?
    },
  }
  return skin
end

---Set the skin of a player.
---@param ped number
---@param skin table
---@param reload boolean
---@return boolean
function SetSkin(ped, skin, reload)
  if type(ped) == 'number' and type(skin) == 'table' and skin['model'] then
    if requestModel(skin['model']) then
      local model = joaat(skin['model'])
      if not IsFreemode(model) then
        SetPlayerModel(PlayerId(), model)
        return
      end
      if reload then
        SetPlayerModel(PlayerId(), model)
        SetPedDefaultComponentVariation(PlayerPedId())
        Wait(250)
      end

      local newPed = PlayerPedId()

      if not isNaked then
        -- Components
        local c = skin['components']
        SetPedComponentVariation(newPed, 0, c['face'][1], c['face'][2], 0)
        SetPedComponentVariation(newPed, 1, c['mask'][1], c['mask'][2], 0)
        SetPedComponentVariation(newPed, 2, c['hair'][1], c['hair'][2], 0)
        SetPedComponentVariation(newPed, 3, c['torso'][1], c['torso'][2], 0)
        SetPedComponentVariation(newPed, 4, c['leg'][1], c['leg'][2], 0)
        SetPedComponentVariation(newPed, 5, c['bag'][1], c['bag'][2], 0)
        SetPedComponentVariation(newPed, 6, c['shoes'][1], c['shoes'][2], 0)
        SetPedComponentVariation(newPed, 7, c['accessory'][1], c['accessory'][2], 0)
        SetPedComponentVariation(newPed, 8, c['undershirt'][1], c['undershirt'][2], 0)
        SetPedComponentVariation(newPed, 9, c['kevlar'][1], c['kevlar'][2], 0)
        SetPedComponentVariation(newPed, 10, c['badge'][1], c['badge'][2], 0)
        SetPedComponentVariation(newPed, 11, c['torso2'][1], c['torso2'][2], 0)

        -- Accessories/Props
        SetPedPropIndex(newPed, 0, skin['p_hat_drawable'], skin['p_hat_texture'], true)
        SetPedPropIndex(newPed, 1, skin['p_glass_drawable'], skin['p_glass_texture'], true)
        SetPedPropIndex(newPed, 2, skin['p_ear_drawable'], skin['p_ear_texture'], true)
        SetPedPropIndex(newPed, 6, skin['p_watch_drawable'], skin['p_watch_texture'], true)
        SetPedPropIndex(newPed, 7, skin['p_bracelet_drawable'], skin['p_bracelet_texture'], true)

        -- Heritage/Head Blend
        SetPedHeadBlendData(newPed, skin['shapeMother'], skin['shapeFather'], 0, skin['skinMother'], skin['skinFather'], 0, skin['shapeMix'], skin['skinMix'], 0, true)

        -- Face features
        SetPedFaceFeature(newPed, 0,  skin['noseWidth'])
        SetPedFaceFeature(newPed, 1,  skin['nosePeakHigh'])
        SetPedFaceFeature(newPed, 2,  skin['nosePeakSize'])
        SetPedFaceFeature(newPed, 3,  skin['noseBoneHigh'])
        SetPedFaceFeature(newPed, 4,  skin['nosePeakLowering'])
        SetPedFaceFeature(newPed, 5,  skin['noseBoneTwist'])
        SetPedFaceFeature(newPed, 6,  skin['eyeBrownHigh'])
        SetPedFaceFeature(newPed, 7,  skin['eyeBrownForward'])
        SetPedFaceFeature(newPed, 8,  skin['cheeksBoneHigh'])
        SetPedFaceFeature(newPed, 9,  skin['cheeksBoneWidth'])
        SetPedFaceFeature(newPed, 10, skin['cheeksWidth'])
        SetPedFaceFeature(newPed, 11, skin['eyesOpening'])
        SetPedFaceFeature(newPed, 12, skin['lipsThickness'])
        SetPedFaceFeature(newPed, 13, skin['jawBoneWidth'])
        SetPedFaceFeature(newPed, 14, skin['jawBoneBackSize'])
        SetPedFaceFeature(newPed, 15, skin['chinBoneLowering'])
        SetPedFaceFeature(newPed, 16, skin['chinBoneLength'])
        SetPedFaceFeature(newPed, 17, skin['chinBoneSize'])
        SetPedFaceFeature(newPed, 18, skin['chinHole'])
        SetPedFaceFeature(newPed, 19, skin['neckThickness'])

        -- Head overlays
        SetPedHeadOverlay(newPed, 0, skin['blemishesUpStyle'], skin['blemishesUpOpacity'])
        SetPedHeadOverlay(newPed, 1, skin['beardUpStyle'], skin['beardUpOpacity'])
        SetPedHeadOverlay(newPed, 2, skin['eyebrowsUpStyle'], skin['eyebrowsUpOpacity'])
        SetPedHeadOverlay(newPed, 3, skin['ageingUpStyle'], skin['ageingUpOpacity'])
        SetPedHeadOverlay(newPed, 4, skin['makeUpStyle'], skin['makeUpOpacity'])
        SetPedHeadOverlay(newPed, 5, skin['blushUpStyle'], skin['blushUpOpacity'])
        SetPedHeadOverlay(newPed, 6, skin['complexionUpStyle'], skin['complexionUpOpacity'])
        SetPedHeadOverlay(newPed, 7, skin['sunDamageUpStyle'], skin['sunDamageUpOpacity'])
        SetPedHeadOverlay(newPed, 8, skin['lipstickUpStyle'], skin['lipstickUpColor'])
        SetPedHeadOverlay(newPed, 9, skin['moleAndFrecklesUpStyle'], skin['moleAndFrecklesUpOpacity'])
        SetPedHeadOverlay(newPed, 10, skin['chestHairUpStyle'], skin['chestHairUpOpacity'])
        SetPedHeadOverlay(newPed, 11, skin['bodyBlemishesUpStyle'], skin['bodyBlemishesUpOpacity'])
        SetPedHeadOverlayColor(newPed, 1, 1, skin['beardUpColor'], 0)
        SetPedHeadOverlayColor(newPed, 2, 1, skin['eyebrowsUpColor'], 0)
        SetPedHeadOverlayColor(newPed, 4, 2, skin['makeupColor'], 0)
        SetPedHeadOverlayColor(newPed, 5, 2, skin['blushUpColor'], 0)
        SetPedHeadOverlayColor(newPed, 8, 2, skin['lipstickUpColor'], 0)
        SetPedHeadOverlayColor(newPed, 10, 1, skin['chestHairUpColor'], 0)

        -- Eye Color
        SetPedEyeColor(newPed, skin['eyeColor'])

        -- Hair
        SetPedComponentVariation(newPed, 2, skin['hairUpStyle'], 0, 0)
        SetPedHairColor(newPed, skin['hairUpColor'], skin['hairUpHighlight'])
      end

      -- Tattoos
      ClearPedDecorations(newPed)
      local t = {
        ['hairUpFade'] = fades[model][skin['hairUpFade']] or '',
        ['t_head'] = tattoos[model].head[skin['t_head']] or '',
        ['t_torso'] = tattoos[model].torso[skin['t_torso']] or '',
        ['t_armRight'] = tattoos[model].rightArm[skin['t_armRight']] or '',
        ['t_armLeft'] = tattoos[model].leftArm[skin['t_armLeft']] or '',
        ['t_legRight'] = tattoos[model].rightLeg[skin['t_legRight']] or '',
        ['t_legLeft'] = tattoos[model].leftLeg[skin['t_legLeft']] or '',
      }
      AddPedDecorationFromHashes(newPed, t['t_head'][1], t['t_head'][2])
      AddPedDecorationFromHashes(newPed, t['t_torso'][1], t['t_torso'][2])
      AddPedDecorationFromHashes(newPed, t['t_armRight'][1], t['t_armRight'][2])
      AddPedDecorationFromHashes(newPed, t['t_armLeft'][1], t['t_armLeft'][2])
      AddPedDecorationFromHashes(newPed, t['t_legRight'][1], t['t_legRight'][2])
      AddPedDecorationFromHashes(newPed, t['t_legLeft'][1], t['t_legLeft'][2])

      -- Fade
      AddPedDecorationFromHashes(newPed, t['hairUpFade'][1], t['hairUpFade'][2])

      SetModelAsNoLongerNeeded(skin['model'])
      return skin
    end
  end
  error('Did not load appearance in time. Restart the resource')
  return {}
end

---Sets the appearance of a ped to be naked
---@param state boolean - True to set naked, false to set other appearance
function SetNaked(state, data)
  local ped = PlayerPedId()
  if state then
    if not isNaked then
      local c = nakedClothes[GetEntityModel(ped)]
      isNaked = true

      SetPedComponentVariation(ped, 3, c['torso'][1], c['torso'][2], 0)
      SetPedComponentVariation(ped, 4, c['leg'][1], c['leg'][2], 0)
      SetPedComponentVariation(ped, 6, c['shoes'][1], c['shoes'][2], 0)
      SetPedComponentVariation(ped, 8, c['undershirt'][1], c['undershirt'][2], 0)
      SetPedComponentVariation(ped, 11, c['torso2'][1], c['torso2'][2], 0)
      SetPedPropIndex(ped, 1, c['p_glass_drawable'], c['p_glass_texture'], true)
    end
  else
    if isNaked then
      isNaked = false
      SetSkin(ped, data, false)
    end
  end
end

exports('setSkin', SetSkin)
exports('getSkin', GetSkin)
exports('isFreemode', IsFreemode)

