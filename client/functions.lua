Request = {}

Request.SetModel = function(model)
	if model and IsModelInCdimage(model) then
		RequestModel(model)

    local timeout = false
    SetTimeout(150, function() timeout = true end)
    repeat
      Wait(0)
    until HasModelLoaded(model) or timeout
		SetPlayerModel(PlayerId(), model)
		SetModelAsNoLongerNeeded(model)

		local ped = PlayerPedId()
		local model = GetEntityModel(ped)
		if model == `mp_m_freemode_01` or model == `mp_f_freemode_01` then
			SetPedDefaultComponentVariation(ped)
			SetPedHeadBlendData(ped, 0, 0, 0, 0, 0, 0, 0, 0, 0, false)
      -- Send to nui if ped is not a freemode ped
		end
	end
end

-- Request.SetInheritance = function()
-- end

Request.StartAppearance = function(config)
  SetNuiFocus(true, true)
  SendNUIMessage({
    action = 'appearance_start',
    config = {
      model = config.model,
      inheritance = config.inheritance,
      face = config.face,
      head = config.head,
      upper = config.upper,
      lower = config.lower,
      accessories = config.accessories,
      tattoos = config.tattoos,
    }
  })
end

exports('Request', function()
  return Request
end)
