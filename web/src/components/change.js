import { useStore } from 'vuex';

const store = useStore()
export const change = (key, value, index) => store.commit('skinChange', { key: key, value: value, index: index })