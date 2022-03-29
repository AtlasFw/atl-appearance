RegisterNetEvent('atl-core:client:onCharacterLoaded', function(character)
  ATL.Character = character
end)

RegisterNetEvent('atl-core:client:onAccountUpdate', function(accounts)
  ATL.Character.accounts = accounts
end)

local currentPoint

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
      debugPoly = true,
      data = shop,
    })
  end

  local zones = ComboZone:Create(circleZones, { name = 'shops', debugPoly = true })
  zones:onPlayerInOut(function(isPointInside, point, zone)
    if isPointInside then
      currentPoint = zone.data
      onPoint()
    else
      currentPoint = nil
    end
  end)
end

function getNumberOfChanges(skin)
  return 'changesNumber' --todo
end

function onPoint()
  CreateThread(function()
    while currentPoint do
      if IsControlJustReleased(0, 38) then
        local shop = currentPoint.data
        exports['atl-appearance']:startAppearance(shop, function(skin)
          if not skin then
            return
          end

          local changesNumber = getNumberOfChanges(skin)
          local price = changesNumber * 100

          if changesNumber < 1 then
            return
          end

          if ATL.Character.accounts.cash < price then
            return
          end

          --TriggerServerEvent('atl-appearance:server:pay', skin)
        end)
      end
      Wait(10)
    end
  end)
end

createShops()
