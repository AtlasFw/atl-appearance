fx_version 'cerulean'
game 'gta5'
use_fxv2_oal 'yes'
lua54 'yes'

name 'atl-appearance'
author 'Atlas Framework Developers'

version '0.0.1'

ui_page 'dist/index.html'

files {
  'dist/**/*',
}

shared_scripts {
  '@atl-core/import.lua',
}

client_scripts {
  '@PolyZone/client.lua',
  '@PolyZone/CircleZone.lua',
  '@PolyZone/ComboZone.lua',
  'client/*.lua',
}

server_scripts {
  'server/skin.lua',
  'server/shop.lua',
}

dependencies {
  'PolyZone',
}

provide 'appearance'
