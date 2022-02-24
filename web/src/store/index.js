import { createStore } from 'vuex'

export default createStore({
     state: {
       appearance: {
          model: 'mp_m_freemode_01'
       },
       models: [
          {label: 'mp_m_freemode_01', value: 'mp_m_freemode_01'},
          {label: 'mp_f_freemode_01', value: 'mp_f_freemode_01'},
       ],
     },
     mutations: {
       increment (state) {
         state.count++
       }
     }
})