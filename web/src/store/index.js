import { createStore } from 'vuex'
import { fetchNui } from '../utils/fetchNui.js'

export default createStore({
  state: {
    data: {
      colors: {},
      models: [],
      locales: {},
      settings: {},
      isFreeMode: true
    },
    skin: {},
    config: {
      ped: {
        state: true
      },
      inheritance: {
        state: true,
        face: true,
        skin: true
      },
      face: {
        state: true,
        eyebrows: true,
        mouth: true,
        nose: true,
        jaw: true,
        chin: true,
        cheeks: true,
        neck: true
      },
      head: {
        state: true,
        hair: true,
        eyebrows: true,
        eyecolor: true,
        makeup: true,
        blush: true,
        beard: true,
        lipstick: true,
        blemishes: true,
        ageing: true,
        complexion: true,
        sundamage: true,
        moles: true
      },
      upper: {
        state: true,
        chesthair: true,
        bodyblemishes: true,
        ears: true,
        arms: true,
        hats: true,
        tshirt: true,
        jackets: true,
        armor: true,
        decals: true
      },
      lower: {
        state: true,
        legs: true,
        shoes: true
      },
      accessories: {
        state: true,
        glasses: true,
        mask: true,
        bags: true,
        chains: true,
        watches: true,
        bracelets: true
      },
      tattoos: {
        state: true,
        head: true,
        torso: true,
        arm: true,
        legs: true
      },
      exit: {
        state: true
      },
      save: {
        state: true
      }
    }
  },
  mutations: {
    setModels(state, models) {
      state.data.models = models
    },
    setLocales(state, locales) {
      state.data.locales = locales
    },
    setSkin(state, { skin, freeMode }) {
      state.skin = skin
      state.data.isFreeMode = freeMode
    },
    setData(state, { config, colors, settings }) {
      colors ? state.data.colors = colors : null
      settings ? state.data.settings = settings : null
      config ? state.config = config : null
    },
    skinChange(state, { key, value, index }) {
      index !== undefined ? state.skin['components'][key][index] = value : state.skin[key] = value
      fetchNui('skin_change', { skin: state.skin, reload: key === 'model', component: index !== undefined, prop: key.startsWith('p_'), key: key }).then((resp) => {
        if (resp?.freeMode !== undefined) {
          state.data.isFreeMode = resp.freeMode
          if (resp.freeMode && key === 'model') {
            state.skin = resp.skin
            resp.settings !== undefined ? state.data.settings = resp.settings : null
          }
        }
        if (resp?.prop) {
          state.data.settings[key] = resp.prop
          if (key.includes('drawable')) {
            const textureKey = key.replace('drawable', 'texture')
            state.skin[textureKey] = 0
          }
        } else if (resp?.component) {
          if (index !== 1) {
            state.skin['components'][key][1] = 0
          }
          state.data.settings['components'][key] = resp.component
        }
      })
    },
  }
})