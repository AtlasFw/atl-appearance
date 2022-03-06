<script setup>
import { NSelect } from 'naive-ui'
import { useStore } from 'vuex';

const store = useStore()
const change = (key, value) => store.commit('skinChange', { key: key, value: value })
</script>

<template>
  <div class="w-full h-10 rounded flex items-center bg-slate-800 text-sky-300 font-bold text-md">
    <span class="ml-4">Ped Model View</span>
  </div>
  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% mt-3 mb-2 flex justify-between items-center">
      <span class="w-90% text-blue-400 font-semibold">Model</span>
      <span class="text-sky-200 font-medium">{{ $store.state.skin.model }}</span>
    </div>
    <NSelect class="ml-2 mb-3 place-self-center mr-2.5 w-90%" v-model:value="$store.state.skin.model" @update:value="change('model', $store.state.skin.model)" :consistent-menu-width="false" :options="$store.state.data.models"></NSelect>
  </div>
</template>