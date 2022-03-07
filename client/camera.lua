Cam = {
  Active = nil,
  IsNaked = false,
  Sets = {
    -- [1] = offset, [2] = point
    ['default'] = {},
    ['inheritance'] = {},
    ['face'] = {},
    ['head'] = {},
    ['lower'] = {},
    ['accessories'] = {},
    ['tattoos'] = {},
  }
}

-- Most likely will be changed to interpolating camera for smooth transitions.
-- Plan is to have keys too so that the camera can be moved around.
Cam.Create = function(ped)
  if Cam.Active then return false end

  local coords, point = GetOffsetFromEntityInWorldCoords(ped, 0, 2.2, 0.3), GetOffsetFromEntityInWorldCoords(ped, 0, 0, -0.05)
  Cam.Active = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', coords.x, coords.y, coords.z, 0.00, 0.00, 0.00, 50.00, false, 0)

  PointCamAtCoord(Cam.Active, point.x, point.y, point.z)
  SetCamActive(Cam.Active, true)
  RenderScriptCams(true, false, 0, true, true)
  return true
end

Cam.MoveTo = function(key)
  if not key then return false end
  if Cam.IsNaked then
    Cam.IsNaked = false
    SetNaked(false)
  end

  if key == 'ped' then
    key = 'default'
  elseif key == 'tattoos' then
    if not Cam.IsNaked then
      Cam.IsNaked = true
      SetNaked(true)
    end
  end
  local coords, point = Cam.Sets[key][1], Cam.Sets[key][2]
end

Cam.Destroy = function()
  if Cam.Active then
    RenderScriptCams(false, false, 0, true, true)
    DestroyCam(Cam.Active, false)
  end
end