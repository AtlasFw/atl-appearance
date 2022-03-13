Cam = {
	Active = nil,
	IsNaked = false,
	Sets = {
		-- [1] = offset, [2] = point
		["default"] = {
			[1] = 0.2,
			[2] = 0.3,
		},
		["ped"] = {
			[1] = 1.2,
			[2] = 0.3,
		},
		["inheritance"] = {
			[1] = 2.2,
			[2] = 0.3,
		},
		["face"] = {
			[1] = 3.2,
			[2] = 0.3,
		},
		["head"] = {
			[1] = 4.2,
			[2] = 0.3,
		},
		["upper"] = {
			[1] = 5.2,
			[2] = 0.3,
		},
		["lower"] = {
			[1] = 6.2,
			[2] = 0.3,
		},
		["accessories"] = {
			[1] = 7.2,
			[2] = 0.3,
		},
		["tattoos"] = {
			[1] = 5.2,
			[2] = 0.3,
		},
	},
}

-- Most likely will be changed to interpolating camera for smooth transitions.
-- Plan is to have keys too so that the camera can be moved around.
Cam.Create = function(ped)
	if Cam.Active then
		return false
	end

	local coords, point =
		GetOffsetFromEntityInWorldCoords(ped, 0, 2.2, 0.3), GetOffsetFromEntityInWorldCoords(ped, 0, 0, -0.05)
	Cam.Active = CreateCamWithParams(
		"DEFAULT_SCRIPTED_CAMERA",
		coords.x,
		coords.y,
		coords.z,
		0.00,
		0.00,
		0.00,
		50.00,
		false,
		0
	)

	PointCamAtCoord(Cam.Active, point.x, point.y, point.z)
	SetCamActive(Cam.Active, true)
	RenderScriptCams(true, false, 0, true, true)
	return true
end

local camInterpolating
local camKey
local camHandle

Cam.MoveTo = function(key, data)
	if not camInterpolating then
		if not key then
			return false
		end

		if Cam.IsNaked then
			Cam.IsNaked = false
			SetNaked(false, data)
		end

		camKey = key

		if key == "tattoos" then
			if not Cam.IsNaked then
				Cam.IsNaked = true
				SetNaked(true)
			end
		end

		local ped = PlayerPedId()
		local set = Cam.Sets[camKey]
		local coords, point = GetOffsetFromEntityInWorldCoords(ped, 0, set[1], set[2]), GetOffsetFromEntityInWorldCoords(ped, 0, 0, -0.05)

		if camHandle then
			local tCam = CreateCameraWithParams('DEFAULT_SCRIPTED_CAMERA', coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 50.0, false, 0)
			PointCamAtCoord(tCam, point.x, point.y, point.z)
			SetCamActiveWithInterp(tCam, camHandle, 1000, 1, 1)

			camInterpolating = true

			CreateThread(function()
				repeat Wait(500)
				until not IsCamInterpolating(camHandle) and IsCamActive(tCam)
				DestroyCam(camHandle, false)
        camHandle = tCam
				camInterpolating = false
			end)
    else
			camHandle = CreateCameraWithParams('DEFAULT_SCRIPTED_CAMERA', coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 50.0, false, 0)

			PointCamAtCoord(camHandle, point.x, point.y, point.z)
			SetCamActive(camHandle, true)
		end
	end
end

Cam.Destroy = function()
	if Cam.Active then
		RenderScriptCams(false, false, 0, true, true)
		DestroyCam(Cam.Active, false)
		Cam.Active = nil
	end
end
