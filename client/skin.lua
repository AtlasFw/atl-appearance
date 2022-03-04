local function requestModel(modelName)
	if type(modelName) ~= 'string' then return false end

	if IsModelValid(modelName) and IsModelInCdimage(modelName) then
		RequestModel(modelName)
    local time = GetGameTimer() + 1000
    repeat
      Wait(10)
    until time > GetGameTimer()

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

local function loadConfig(data)
  local config = {
    ['ped'] = data.ped or true,
    ['inheritance'] = {
      state = data.inheritance.state or true,
      face = data.inheritance.face or true,
      skin = data.inheritance.skin or true
    },
    ['face'] = {
      state = data.face.state or true,
      eyebrows = data.face.eyebrows or true,
      mouth = data.face.mouth or true,
      nose = data.face.nose or true,
      jaw = data.face.jaw or true,
      chin = data.face.chin or true,
      cheeks = data.face.cheeks or true,
      neck = data.face.neck or true
    },
    ['head'] = {
      state = data.head.state or true,
      hair = data.head.hair or true,
      eyebrows = data.head.eyebrows or true,
      eyecolor = data.head.eyecolor or true,
      makeup = data.head.makeup or true,
      blush = data.head.blush or true,
      beard = data.head.beard or true,
      lipstick = data.head.lipstick or true,
      blemishes = data.head.blemishes or true,
      ageing = data.head.ageing or true,
      complexion = data.head.complexion or true,
      sundamage = data.head.sundamage or true,
      moles = data.head.moles or true
    },
    ['upper'] = {
      state = data.upper.state or true,
      chesthair = data.upper.chesthair or true,
      bodyblemishes = data.upper.bodyblemishes or true,
      ears = data.upper.ears or true,
      arms = data.upper.arms or true,
      hats = data.upper.hats or true,
      glasses = data.upper.glasses or true,
      tshirt = data.upper.tshirt or true,
      jackets = data.upper.jackets or true,
      armor = data.upper.armor or true,
      decals = data.upper.decals or true
    },
    ['lower'] = {
      state = data.lower.state or true,
      legs = data.lower.legs or true,
      shoes = data.lower.shoes or true,
    },
    ['accessories'] = {
      state = data.accessories.state or true,
      mask = data.accessories.mask or true,
      bags = data.accessories.bags or true,
      chains = data.accessories.chains or true,
      watches = data.accessories.watches or true,
      bracelets = data.accessories.bracelets or true
    },
    ['tattoos'] = {
      state = data.tattoos.state or true,
      head = data.tattoos.head or true,
      torso = data.tattoos.torso or true,
      arm = data.tattoos.arm or true,
      legs = data.tattoos.legs or true
    },
    ['exit'] = {
      state = data.exit or true
    },
    ['save'] = {
      state = data.save or true
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
  if jooat(ped) == `mp_m_freemode_01` or joaat(ped) == `mp_f_freemode_01` then
    return true
  end
  return false
end

function GetSkin(ped)
  local skin = {
    ['model'] = 'lorem_ipsum',

    -- Eye color
    ['eyeColor'] = 0,

    -- Heritage/Head Blend
    ['shapeMother'] =  0,
    ['shapeFather'] =  0,
    ['shapeThird'] =  0,
    ['shapeMix'] =  0,
    ['skinMother'] =  0,
    ['skinFather'] =  0,
    ['skinThird'] =  0,
    ['skinMix'] = 0,
    ['thirdMix'] =  0,

    -- Face Features
    ['noseWidth'] = 0,
    ['nosePeakHigh'] = 0,
    ['nosePeakSize'] = 0,
    ['noseBoneHigh'] = 0,
    ['nosePeakLowering'] = 0,
    ['noseBoneTwist'] = 0,
    ['eyeBrownHigh'] = 0,
    ['eyeBrownForward'] = 0,
    ['cheeksBoneHigh'] = 0,
    ['cheeksBoneWidth'] = 0,
    ['cheeksWidth'] = 0,
    ['eyesOpening'] = 0,
    ['lipsThickness'] = 0,
    ['jawBoneWidth'] = 0,
    ['jawBoneBackSize'] = 0,
    ['chinBoneLowering'] = 0,
    ['chinBoneLenght'] = 0,
    ['chinBoneSize'] = 0,
    ['chinHole'] = 0,
    ['neckThickness'] = 0,

    -- Accessories
    ['p_hat_drawable'] = 0,
    ['p_hat_texture'] = 0,
    ['p_glass_drawable'] = 0,
    ['p_glass_texture'] = 0,
    ['p_ear_drawable'] = 0,
    ['p_ear_texture'] = 0,
    ['p_watch_drawable'] = 0,
    ['p_watch_texture'] = 0,
    ['p_bracelet_drawable'] = 0,
    ['p_bracelet_texture'] = 0,

    -- Components
    ['components'] = {
      ['face'] = {0, 0}, -- Drawable, Texture
      ['mask'] = {0, 0},
      ['hair'] = {0, 0},
      ['torso'] = {0, 0},
      ['torso2'] = {0, 0},
      ['leg'] = {0, 0},
      ['bag'] = {0, 0}, -- Also parachute
      ['shoes'] = {0, 0},
      ['accessory'] = {0, 0},
      ['kevlar'] = {0, 0},
      ['badge'] = {0, 0},
    },

    -- Hair
    ['hairUpStyle'] = 0,
    ['hairUpColor'] = 0,
    ['hairUpHighlight'] = 0,

    -- Head overlays
    ['makeUpStyle'] = 0,
    ['makeUpColor'] = 0,
    ['makeUpOpacity'] = 0,
    ['eyebrowsUpStyle'] = 0,
    ['eyebrowsUpColor'] = 0,
    ['eyebrowsUpOpacity'] = 0,
    ['moleAndFrecklesUpStyle'] = 0,
    ['moleAndFrecklesUpColor'] = 0,
    ['moleAndFrecklesUpOpacity'] = 0,
    ['blushUpStyle'] = 0,
    ['blushUpColor'] = 0,
    ['blushUpOpacity'] = 0,
    ['chestHairUpStyle'] = 0,
    ['chestHairUpColor'] = 0,
    ['chestHairUpOpacity'] = 0,
    ['lipstickUpStyle'] = 0,
    ['lipstickUpColor'] = 0,
    ['lipstickUpOpacity'] = 0,
    ['sunDamageUpStyle'] = 0,
    ['sunDamageUpColor'] = 0,
    ['sunDamageUpOpacity'] = 0,
    ['bodyBlemishesUpStyle'] = 0,
    ['bodyBlemishesUpColor'] = 0,
    ['bodyBlemishesUpOpacity'] = 0,
    ['complexionUpStyle'] = 0,
    ['complexionUpColor'] = 0,
    ['complexionUpOpacity'] = 0,
    ['ageingUpStyle'] = 0,
    ['ageingUpColor'] = 0,
    ['ageingUpOpacity'] = 0,
    ['blemishesUpStyle'] = 0,
    ['blemishesUpColor'] = 0,
    ['blemishesUpOpacity'] = 0,
    ['beardUpStyle'] = 0,
    ['beardUpColor'] = 0,
    ['beardUpOpacity'] = 0,
  }
  return skin
end

function SetSkin(ped, skin, isFreeMode)
  if type(ped) == 'number' and type(skin) == 'table' and skin['model'] then
    local modelHash = jooat(skin['model'])
    if requestModel(modelHash) then

    end
  end
  return skin
end

exports('setSkin', setSkin)
exports('getSkin', getSkin)