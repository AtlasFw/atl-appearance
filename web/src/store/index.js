import { createStore } from 'vuex'

export default createStore({
  state: {
    appearance: {
      heritage: {
        shapeFather: 0,
        shapeMother: 0,
        shapeMix:  0,
        skinFather: 0,
        skinMother: 0,
        skinMix:  0,
      }
    },
    models: [],
    config: {
      ped: false,
      model: true,
      inheritance: true,
      face: true,
      head: true,
      upper: true,
      lower: true,
      accessories: true,
      tattoos: true,
    }
  },
  mutations: {
    setModels (state, models) {
      state.models = models
    },
    setAppearance (state, appearance) {
      state.appearance = appearance
    }
  },
  getters: {
    appearance: state => state.appearance,
  }
})