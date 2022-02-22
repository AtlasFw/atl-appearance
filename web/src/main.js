import { createApp, h } from 'vue'
import App from './App.vue'
import store from './store/index.js'
import { NConfigProvider, NDialogProvider, NMessageProvider, darkTheme } from 'naive-ui'
import './index.css'

const app = createApp({
  render: () => h(NConfigProvider, {theme: darkTheme}, {
    default: () => h(NDialogProvider, {}, {
      default: () => h(NMessageProvider, {}, {
        default: () => h(App)
      })
    })
  })
})

app.use(store)
app.mount('#app')