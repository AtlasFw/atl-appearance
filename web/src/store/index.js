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
    setModels(state, models) {
      state.models = models
    },
    setSkin(state, skin) {
      state.oldSkin = skin
      state.skin = skin
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