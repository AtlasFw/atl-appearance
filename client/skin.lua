local function requestModel(modelName)
	if type(modelName) ~= 'string' then return false end

	local count = 0

	if IsModelValid(modelName) and IsModelInCdimage(modelName) then
		RequestModel(modelName)
    local time = GetGameTimer() + 1000
    while time > GetGameTimer() do
      Wait(10)
    end

    if HasModelLoaded(modelName) then
      return true
    end
    SetModelAsNoLongerNeeded(model)
	end

  return false
end

function GetSkin(ped)
  local skin = {
    ['model'] = 'lorem_ipsum',

    -- Eye color
    ['eyeColor'] = 0,

    -- Heritage
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