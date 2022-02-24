import { createStore } from 'vuex'

export default createStore({
  state: {
    appearance: {
      model: 'mp_m_freemode_01',
      components: {},
      eyeColor: 0,
      hair: {
        style: 0,
        colors: {},
        highlight: {}
      }
    },
    models: [
      {label: 'mp_m_freemode_01', value: 'mp_m_freemode_01'},
      {label: 'mp_f_freemode_01', value: 'mp_f_freemode_01'},
      {label: 'player_one', value: 'player_one'},
    ],
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
    increment (state) {
      state.count++
    }
  }
})