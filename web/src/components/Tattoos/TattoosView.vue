<script setup>
import SmallInput from "../SmallInput.vue"
import NumberInput from "../NumberInput.vue"
</script>

<template>
  <div class="w-full h-10 rounded flex items-center bg-slate-800 text-sky-300 font-bold text-md">
    <span class="ml-4">Tattoos View</span>
  </div>

  <div v-if="$store.state.config.tattoos.head" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Head</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" title="Hair fade"/>
        <SmallInput class="ml-1" title="Other"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.tattoos.torso" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Torso</span>
      <div class="w-full flex space-between">
        <NumberInput class="mb-2" title="Style"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.tattoos.arm" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Arm</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" title="Left"/>
        <SmallInput class="ml-1" title="Right"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.tattoos.legs" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Legs</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" title="Left"/>
        <SmallInput class="ml-1" title="Right"/>
      </div>
    </div>
  </div>

</template>