fx_version 'cerulean'
game 'gta5'
use_fxv2_oal 'yes'
lua54 'yes'

name 'atl-appearance'
author 'Atlas Framework Developers'

version '0.0.1'

ui_page 'dist/index.html'

files {
  'dist/**/*'
}

client_scripts {
  'client/*.lua'
}

provide 'appearance'