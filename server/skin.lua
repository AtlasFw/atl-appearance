RegisterNetEvent('atl-appearance:server:saveSkin', function(skin)
  local source = source
  local player = ATL.GetPlayer(source)

  player.setAppearance(skin)
end)
