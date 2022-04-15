RegisterNetEvent('atl-appearance:server:saveSkin', function(skin)
  local source = source
  local player = ATL.GetPlayer(source)

  if player then
    print 'yes'
    print(json.encode(player))
    player.setAppearance(skin)
  end
end)
