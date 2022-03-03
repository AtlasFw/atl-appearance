import { useStore } from 'vuex';

const store = useStore()
export const change = (key, value) => {
  store.commit('skinChange', { key: key, value: value })
}