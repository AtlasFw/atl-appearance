fx_version 'cerulean'
game 'gta5'
use_fxv2_oal 'yes'
lua54 'yes'

name 'atl-appearance'
author 'Atlas Framework Developers'

version '0.0.1'

client_scripts {
  'client/*.lua'
}

ui_page 'dist/index.html'

files {
  'dist/**/*'
}

provide 'appearance'