<script setup>
import Slider from '../Slider.vue'
import NumberInput from '../NumberInput.vue';
import { fetchNui } from '../fetchNui.js';

const updateBlend = (blend) => {
  console.log(blend)
  if (!blend) return
  // fetchNui('appearance_head_blend', { data: blend }).then((resp) => {
  //   if (resp) {
  //     // Remember to remove options if response is true
  //     console.log('Updated option')
  //   } else {
  //     console.log('Failed to update model')
  //   }
  // })
}
</script>

<template>
  <div class="w-full h-10 rounded flex items-center bg-slate-800 text-sky-300 font-bold text-md">
    <span class="ml-4">Family Inheritance View</span>
  </div>
  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 mt-3 font-bold text-custom-2">Face</span>
      <NumberInput title="Father" @updateVal="updateBlend" v-model:value="$store.state.appearance.heritage.shapeFather"/>
      <NumberInput title="Mother" v-model:value="$store.state.appearance.heritage.shapeMother"/>
      <Slider class="mb-3" title="Mix" :min="0" :max="1" :step="0.1" v-model:value="$store.state.appearance.heritage.shapeMix"/>
    </div>
  </div>
  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 mt-3 font-bold text-custom-2">Skin</span>
      <NumberInput title="Father" v-model:value="$store.state.appearance.heritage.skinFather"/>
      <NumberInput title="Mother" v-model:value="$store.state.appearance.heritage.skinMother"/>
      <Slider class="mb-3" title="Mix" :min="0" :max="1" :step="0.1" v-model:value="$store.state.appearance.heritage.skinMix"/>
    </div>
  </div>

</template>