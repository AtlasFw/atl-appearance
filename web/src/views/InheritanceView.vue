<script setup>
import Slider from '../components/Slider.vue'
import NumberInput from '../components/NumberInput.vue';
</script>

<template>
  <div class="w-full h-10 cs:h-11 cm:h-12 cl:h-13 rounded flex items-center bg-slate-800 text-sky-300 font-bold text-md">
    <span class="ml-4">Family Inheritance View</span>
  </div>
  <div v-if="$store.state.config.inheritance.face" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 mt-3 font-bold text-custom-2">Face</span>
      <NumberInput title="Father" type="shapeFather" :min="0" :max="45" :state="$store.state.skin.shapeFather"/>
      <NumberInput title="Mother" type="shapeMother" :min="0" :max="45" :state="$store.state.skin.shapeMother"/>
      <Slider class="mb-3" title="Mix" :min="0" :max="1" :step="0.1" type="shapeMix" :state="$store.state.skin.shapeMix"/>
    </div>
  </div>
  <div v-if="$store.state.config.inheritance.skin" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 mt-3 font-bold text-custom-2">Skin</span>
      <NumberInput title="Father" type="skinFather" :min="0" :max="45" :state="$store.state.skin.skinFather"/>
      <NumberInput title="Mother" type="skinMother" :min="0" :max="45" :state="$store.state.skin.skinMother"/>
      <Slider class="mb-3" title="Mix" :min="0" :max="1" :step="0.1" type="skinMix" :state="$store.state.skinMix"/>
    </div>
  </div>
</template>