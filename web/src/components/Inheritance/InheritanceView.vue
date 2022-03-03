<script setup>
import Slider from '../Slider.vue'
import NumberInput from '../NumberInput.vue';
</script>

<template>
  <div class="w-full h-10 rounded flex items-center bg-slate-800 text-sky-300 font-bold text-md">
    <span class="ml-4">Family Inheritance View</span>
  </div>
  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 mt-3 font-bold text-custom-2">Face</span>
      <NumberInput title="Father" @updateS="setHeritage" type="shapeFather" :state="$store.state.skin"/>
      <NumberInput title="Mother" @updateS="setHeritage" type="shapeMother" :state="$store.state.skin"/>
      <Slider class="mb-3" title="Mix" :min="0" :max="1" :step="0.1" @updateS="setHeritage" type="shapeMix" :state="$store.state.skin"/>
    </div>
  </div>
  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 mt-3 font-bold text-custom-2">Skin</span>
      <NumberInput title="Father" @updateS="setHeritage" type="skinFather" :state="$store.state.skin"/>
      <NumberInput title="Mother" @updateS="setHeritage" type="skinMother" :state="$store.state.skin"/>
      <Slider class="mb-3" title="Mix" :min="0" :max="1" :step="0.1" @updateS="setHeritage" type="skinMix" :state="$store.state.skin"/>
    </div>
  </div>
</template>