import { createApp, h } from 'vue'
import App from './App.vue'
import store from './store/index.js'
import { NConfigProvider, NDialogProvider, NMessageProvider, darkTheme } from 'naive-ui'
import './index.css'

// Override default theme
const themeOverrides = {
    Select: {
      peers: {
        InternalSelection: {
          borderHover: `1px solid #178AD1`,
          borderActive: `1px solid #178AD1`,
          borderFocus: `1px solid #178AD1`,
        }
      }
    },
}

const app = createApp({
  render: () => h(NConfigProvider, {theme: darkTheme, themeOverrides: themeOverrides}, {
    default: () => h(NDialogProvider, {}, {
      default: () => h(NMessageProvider, {}, {
        default: () => h(App)
      })
    })
  })
})

app.use(store)
app.mount('#app')