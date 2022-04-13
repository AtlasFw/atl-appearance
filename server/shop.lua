local function getSkinChangesPrice(shop, skin, oldSkin)
  local changesCount = 0
  for k, v in pairs(skin) do
    if k == 'components' then
      for k2, v2 in pairs(v) do
        if v2[1] ~= oldSkin.components[k2][1] then
          changesCount = changesCount + 1
        end
        if v2[2] ~= oldSkin.components[k2][2] then
          changesCount = changesCount + 1
        end
      end
    else
      if v ~= oldSkin[k] then
        changesCount = changesCount + 1
      end
    end
  end
  if shop.pricePerChange then
    changesCount = changesCount * shop.pricePerChange
  else
    changesCount = changesCount * 100
  end

  return changesCount
end

local function buySkin(shop, skin, oldSkin)
  local source = source
  local player = ATL.GetPlayer(source)

  local playerMoney = player.getAccount 'cash'
  local price = getSkinChangesPrice(shop, skin, oldSkin)

  if playerMoney >= price then
    player.removeAccountMoney('cash', price)
    TriggerClientEvent('atl-appearance:client:setSkin', source, skin)
  else
    print 'Not enough money'
  end
end

RegisterNetEvent('atl-appearance:server:buySkin', buySkin)
