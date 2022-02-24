<script setup>
import { NSelect } from 'naive-ui'
import { fetchNui } from '../fetchNui'
// Deprecated: Change later
const updateModel = (model) => {
  fetchNui('appearance_model', { model: model }).then((resp) => {
    if (resp) {
      console.log('Updated model')
    } else {
      console.log('Failed to update model')
    }
  })
}
</script>

<template>
  <div class="w-full h-10 rounded flex items-center bg-slate-800 text-sky-300 font-bold text-md">
    <span class="ml-4">Ped Model View</span>
  </div>
  <div class="w-full h-24 bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex justify-between items-center">
      <span class="w-90% text-blue-400 font-semibold">Model</span>
      <span class="text-sky-200 font-medium">{{ $store.state.appearance.model }}</span>
    </div>
    <NSelect class="ml-2 place-self-center mr-2.5 w-90%" @change="updateModel" v-model:value="$store.state.appearance.model" :consistent-menu-width="false" :options="$store.state.models"></NSelect>
  </div>
</template>