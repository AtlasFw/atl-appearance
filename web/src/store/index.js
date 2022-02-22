import { createStore } from 'vuex'

export default createStore({
     state: {
       appearance: {

       },
       count: 0
     },
     mutations: {
       increment (state) {
         state.count++
       }
     }
})