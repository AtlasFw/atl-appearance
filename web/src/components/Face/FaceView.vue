<script setup>
import Slider from '../Slider.vue'
</script>

<template>
  <div class="w-full h-10 rounded flex items-center bg-slate-800 text-sky-300 font-bold text-md">
    <span class="ml-4">Face View</span>
  </div>
  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Eyebrows</span>
      <Slider title="Height" :min="-1" :max="1" :step="0.1"/>
      <Slider class="mb-3" title="Width" :min="-1" :max="1" :step="0.1"/>
    </div>
  </div>
  <div class="w-full bg-slate-800 mt-2 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-3">Eyes & Mouth</span>
      <Slider title="Eyes Opening" :min="-1" :max="1" :step="0.1"/>
      <Slider class="mb-3" title="Lip Thickness" :min="-1" :max="1" :step="0.1"/>
    </div>
  </div>
  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Nose</span>
      <Slider title="Width" :min="-1" :max="1" :step="0.1"/>
      <Slider title="Height" :min="-1" :max="1" :step="0.1"/>
      <Slider title="Size" :min="-1" :max="1" :step="0.1"/>
      <Slider title="Bone Height" :min="-1" :max="1" :step="0.1"/>
      <Slider title="Peak Height" :min="-1" :max="1" :step="0.1"/>
      <Slider class="mb-3" title="Bone Twist" :min="-1" :max="1" :step="0.1"/>
    </div>
  </div>
  <div class="w-full bg-slate-800 mt-2 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-3">Jaw</span>
      <Slider title="Width" :min="-1" :max="1" :step="0.1"/>
      <Slider class="mb-3" title="Size" :min="-1" :max="1" :step="0.1"/>
    </div>
  </div>
  <div class="w-full bg-slate-800 mt-2 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-3">Chin</span>
      <Slider title="Lowering" :min="-1" :max="1" :step="0.1"/>
      <Slider title="Length" :min="-1" :max="1" :step="0.1"/>
      <Slider title="Size" :min="-1" :max="1" :step="0.1"/>
      <Slider class="mb-3" title="Dimple Size" :min="-1" :max="1" :step="0.1"/>
    </div>
  </div>
  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Cheeks</span>
      <Slider title="Bone Height" :min="-1" :max="1" :step="0.1"/>
      <Slider title="Bone Width" :min="-1" :max="1" :step="0.1"/>
      <Slider class="mb-3" title="Width" :min="-1" :max="1" :step="0.1"/>
    </div>
  </div>
  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Neck</span>
      <Slider class="mb-3" title="Thickness" :min="-1" :max="1" :step="0.1"/>
    </div>
  </div>
</template>