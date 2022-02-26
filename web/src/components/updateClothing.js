import { fetchNui } from '../fetchNui.js';
import { useStore } from 'vuex';

const store = useStore()
const setHeritage = (key, value) => {
  fetchNui('setHeritage', { heritage: store.state.heritage})
  store.commit('setHeritage', { key: key, value: value })
}