Cam = {
	Active = nil,
	IsNaked = false,
	Sets = {
		-- [1] = offset, [2] = point
		["default"] = {
			vector3(0.0, 2.2, 0.3),
			vector3(0.0, 0, -0.05),
		},
		["inheritance"] = {
			vec3(0, 0.8, 0.65),
			vec3(0, 0, 0.6),
		},
		["face"] = {
			vec3(0, 0.6, 0.65),
			vec3(0, 0, 0.6),
		},
		["head"] = {
			vec3(0, 0.8, 0.65),
			vec3(0, 0, 0.6),
		},
		["upper"] = {
			vector3(0, 1.6, 0.2),
			vector3(0, 0, 0.2),
		},
		["lower"] = {
			vector3(0, 1.38, -0.3),
			vector3(0, 0, -0.5),
		},
		["accessories"] = {
			vector3(0, 1.2, 0.55),
			vector3(0, 0, 0.5),
		},
	},
}

-- Most likely will be changed to interpolating camera for smooth transitions.
-- Plan is to have keys too so that the camera can be moved around.
Cam.Create = function(ped)
	if Cam.Active then
		return false
	end

	local coords = GetOffsetFromEntityInWorldCoords(ped, 0, 2.2, 0.3)
	local point = GetOffsetFromEntityInWorldCoords(ped, 0, 0, -0.05)
	Cam.Active = CreateCamWithParams( "DEFAULT_SCRIPTED_CAMERA", coords.x, coords.y, coords.z, 0.00, 0.00, 0.00, 50.00, false, 0)

	PointCamAtCoord(Cam.Active, point.x, point.y, point.z)
	SetCamActive(Cam.Active, true)
	RenderScriptCams(true, false, 0, true, true)
	return true
end

Cam.MoveTo = function(key, data)
	if Cam.Active and not IsCamInterpolating(Cam.Active) then
		if not key then
			return false
		end

		if Cam.IsNaked then
			Cam.IsNaked = false
			SetNaked(false, data)
		end

		if key == "ped" or key == "save" or key == "exit" then
			key = "default"
		elseif key == "tattoos" then
			key = "default"
			if not Cam.IsNaked then
				Cam.IsNaked = true
				SetNaked(true)
			end
		end

		local ped = PlayerPedId()
		local set = Cam.Sets[key]
		local coords = GetOffsetFromEntityInWorldCoords(ped, set[1].x, set[1].y, set[1].z)
		local point = GetOffsetFromEntityInWorldCoords(ped, set[2].x, set[2].y, set[2].z)

		local tempCam = CreateCameraWithParams(
			"DEFAULT_SCRIPTED_CAMERA",
			coords.x,
			coords.y,
			coords.z,
			0.0,
			0.0,
			0.0,
			50.0,
			false,
			0
		)
		PointCamAtCoord(tempCam, point.x, point.y, point.z)
		SetCamActiveWithInterp(tempCam, Cam.Active, 750, 1, 1)

		CreateThread(function()
			repeat
				Wait(100)
			until not IsCamInterpolating(Cam.Active) and IsCamActive(tempCam)
			DestroyCam(Cam.Active, false)
			Cam.Active = tempCam
		end)
	end
end

Cam.Destroy = function()
	if Cam.Active then
		RenderScriptCams(false, false, 0, true, true)
		DestroyCam(Cam.Active, false)
		Cam.Active = nil
	end
end
