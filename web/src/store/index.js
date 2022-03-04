import { createStore } from 'vuex'
import { fetchNui } from '../components/fetchNui.js'

export default createStore({
  state: {
    data: {
      colors: [],
      models: [
        {label: 'test', value: 'test'},
        {label: 'test2', value: 'test2'}
      ],
    },
    oldSkin: {},
    skin: {
      model: 'model'
    },
    config: {
      ped: true,
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
    }
  },
  mutations: {
    setModels(state, models) {
      state.models = models
    },
    setConfig(state, config) {
      state.config = config
    },
    setSkin(state, skin) {
      state.oldSkin = skin
      state.skin = skin
    },
    setData(state, data) {

    },
    skinChange(state, { key, value, index }) {
      console.log(key, value, index)
      if (index !== undefined) {
        state.skin['components'][key][index] = value
      } else {
        state.skin[key] = value
      }
      // fetchNui('skin_change', { skin: state.skin })
    },
  }
})