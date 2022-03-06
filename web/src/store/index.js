import { createStore } from 'vuex'
import { fetchNui } from '../utils/fetchNui.js'

export default createStore({
  state: {
    data: {
      colors: {},
      models: [],
      locales: {},
      settings: {}
    },
    old: null,
    skin: {},
    isFreeMode : true,
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
        glasses: true,
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
      // Old seems to be synchronized with skin. This needs to be fixed.
      state.old = skin
      state.isFreeMode = freeMode
    },
    setData(state, {config, colors, settings}) {
      colors ? state.data.colors = colors : null
      settings ? state.data.settings = settings : null
      config ? state.config = config : null
    },
    skinChange(state, { key, value, index }) {
      // console.log(key, value, index)
      index !== undefined ? state.skin['components'][key][index] = value : state.skin[key] = value
      fetchNui('skin_change', { skin: state.skin, reload: key === 'model', component: index !== undefined, prop: key.startsWith('p_'), key: key }).then((resp) => {
        if (resp?.freeMode !== undefined) {
          state.isFreeMode = resp.freeMode
        }
        console.log(`[Skin] ${key} changed to ${value}`)
        if (resp?.prop) {
          state.data.settings[key] = resp.prop
        } else if (resp?.component) {
          state.data.settings['components'][key] = resp.component
        }
      })
    },
  }
})