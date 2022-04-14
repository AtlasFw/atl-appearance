local currentPoint

local function createBlip(shop)
  if not shop.blip or not shop.blip.enabled then
    return
  end

  local blip = AddBlipForCoord(shop.coords)

  SetBlipSprite(blip, shop.blip.sprite)
  SetBlipDisplay(blip, 2)
  SetBlipScale(blip, shop.blip.scale)
  SetBlipColour(blip, shop.blip.color)
  SetBlipAsShortRange(blip, true)

  BeginTextCommandSetBlipName 'STRING'
  AddTextComponentSubstringPlayerName(shop.name)
  EndTextCommandSetBlipName(blip)
end

local function onPoint()
  CreateThread(function()
    while currentPoint do
      if IsControlJustReleased(0, 38) then
        exports['atl-appearance']:startAppearance(currentPoint.data, function(changed, skin, oldSkin)
          if not changed then
            return
          end
          TriggerServerEvent('atl-appearance:server:buySkin', currentPoint, skin, oldSkin)
        end, false)
      end
      Wait(10)
    end
  end)
end

local function createShops()
  local shops = exports['atl-core']:Shops()
  local circleZones = {}

  for i = 1, #shops do
    local shop = shops[i]

    createBlip(shop)
    circleZones[#circleZones + 1] = CircleZone:Create(shop.coords, shop.range or 2.5, {
      name = shop.name,
      data = shop,
    })
  end

  local zones = ComboZone:Create(circleZones, { name = 'shops' })
  zones:onPlayerInOut(function(isPointInside, point, zone)
    if isPointInside then
      currentPoint = zone.data
      onPoint()
    else
      currentPoint = nil
    end
  end)
end
createShops()
