<script setup>
import SmallInput from "../SmallInput.vue"
</script>

<template>
  <div class="w-full h-10 rounded flex items-center bg-slate-800 text-sky-300 font-bold text-md">
    <span class="ml-4">Lower Body View</span>
  </div>
  <div v-if="$store.state.config.lower.legs" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Legs</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" @updateS="setComponent" :type="{type: 'drawable', key: 4}" :state="$store.state.skin"/>
        <SmallInput class="ml-1" @updateS="setComponent" :type="{type: 'texture', key: 4}" :state="$store.state.skin"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.lower.shoes" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Shoes</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" @updateS="setComponent" :type="{type: 'drawable', key: 6}" :state="$store.state.skin"/>
        <SmallInput class="ml-1" @updateS="setComponent" :type="{type: 'texture', key: 6}" :state="$store.state.skin"/>
      </div>
    </div>
  </div>
</template>