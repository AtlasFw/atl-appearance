import { createStore } from 'vuex'

export default createStore({
  state: {
    appearance: {
      ped: '',
      heritage: {
        shapeMother: 0,
        shapeFather: 0,
        shapeThird: 0,
        shapeMix: 0,
        skinMother: 0,
        skinFather: 0,
        skinThird: 0,
        skinMix: 0,
        thirdMix: 0,
      }
    },
    models: [],
    config: {
      ped: false,
      inheritance: {
        state: true
      },
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
      console.log(JSON.stringify(state.appearance))
      console.log(JSON.stringify(state.appearance.heritage))
    },
    setHeritage (state, { key, value }) {
      console.log(key, value)
      state.appearance.heritage[key] = value
    },
    setFace(state, { key, value }) {
      console.log(key, value)
      //state.appearance = value
    }
  },
  getters: {
    appearance: state => state.appearance,
  }
})