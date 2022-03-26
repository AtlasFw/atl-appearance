local currentPoint, zones

function createBlip(shop)
  local blip = AddBlipForCoord(shop.coords.x, shop.coords.y, shop.coords.z)

  SetBlipSprite(blip, shop.blip.sprite)
  SetBlipDisplay(blip, 2)
  SetBlipScale(blip, shop.blip.scale)
  SetBlipColour(blip, shop.blip.color)
  SetBlipAsShortRange(blip, true)

  BeginTextCommandSetBlipName 'STRING'
  AddTextComponentSubstringPlayerName(shop.name)
  EndTextCommandSetBlipName(blip)
end

function createShops()
  local shops = exports['atl-core']:Shops()
  local circleZones = {}
  for i = 1, #shops do
    local shop = shops[i]

    createBlip(shop)
    circleZones[#circleZones + 1] = CircleZone:Create(shop.coords, 1.5, {
      name = shop.name,
      debugPoly = false,
      data = shop,
    })
  end

  local combo = ComboZone:Create(circleZones, { name = 'combo', debugPoly = false })
  combo:onPlayerInOut(function(isPointInside, point, zone)
    if isPointInside then
      currentPoint = zone.data
      onPoint()
    else
      currentPoint = nil
    end
  end)
end

function onPoint()
  CreateThread(function()
    while currentPoint do
      if IsControlJustReleased(0, 38) then
        local shop = currentPoint.data
        exports['atl-appearance']:startAppearance(shop, function(skin)
          print(skin)
        end)
      end
      Wait(10)
    end
  end)
end

AddEventHandler('onResourceStart', function(resourceName)
  if resourceName == GetCurrentResourceName() then
    createShops()
  end
end)
