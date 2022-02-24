<script setup>
import { NInputNumber, NSlider } from 'naive-ui'
</script>

<template>
  <div class="w-full h-10 rounded flex items-center bg-slate-800 text-sky-300 font-bold text-md">
    <span class="ml-4">Family Inheritance View</span>
  </div>
  <div class="w-full h-64 bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2">Face</span>
      <div class="w-full flex justify-between mb-2">
        <span class="text-blue-400 font-semibold">Father</span>
        <span class="text-sky-200 font-semibold">0</span>
      </div>
      <NInputNumber class="w-full mb-4" clearable />
      <div class="w-full flex justify-between mb-2">
        <span class="text-blue-400 font-semibold">Mother</span>
        <span class="text-sky-200 font-semibold">0</span>
      </div>
      <NInputNumber class="w-full" clearable />
      <div class="w-full flex justify-between mb-2 mt-2">
        <span class="text-blue-400 font-semibold">Mix</span>
        <span class="text-sky-200 font-semibold">0</span>
      </div>
      <NSlider :step="0.1" :min="0" :max="1"/>
    </div>
  </div>
  <div class="w-full h-64 bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2">Skin</span>
      <div class="w-full flex justify-between mb-2">
        <span class="text-blue-400 font-semibold">Father</span>
        <span class="text-sky-200 font-semibold">0</span>
      </div>
      <NInputNumber class="w-full mb-4" clearable />
      <div class="w-full flex justify-between mb-2">
        <span class="text-blue-400 font-semibold">Mother</span>
        <span class="text-sky-200 font-semibold">0</span>
      </div>
      <NInputNumber class="w-full" clearable />
      <div class="w-full flex justify-between mb-2 mt-2">
        <span class="text-blue-400 font-semibold">Mix</span>
        <span class="text-sky-200 font-semibold">0</span>
      </div>
      <NSlider :step="0.1" :min="0" :max="1"/>
    </div>
  </div>

</template>