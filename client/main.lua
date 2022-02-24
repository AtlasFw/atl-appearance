ATL = {}

RegisterCommand('atl', function()
  local config = {
    model = true,
    inheritance = true,
    face = true,
    head = true,
    upper = true,
    lower = true,
    accessories = true,
    tattoos = true,
  }
  Request.StartAppearance(config)
end)
