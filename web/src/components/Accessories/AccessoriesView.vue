<script setup>
import SmallInput from "../SmallInput.vue"
import { useStore } from 'vuex';

const store = useStore()
const setAccessory = (data, value) => store.commit('setAccessories', { data: data, value: value })
</script>

<template>
  <div class="w-full h-10 rounded flex items-center bg-slate-800 text-sky-300 font-bold text-md">
    <span class="ml-4">Lower Body View</span>
  </div>
  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Mask</span>
      <div class="w-full flex space-between">
        <SmallInput title="Drawable" class="mr-1"/>
        <SmallInput title="Texture" class="ml-1"/>
      </div>
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Bags & Parachute</span>
      <div class="w-full flex space-between">
        <SmallInput title="Drawable" class="mr-1"/>
        <SmallInput title="Texture" class="ml-1"/>/>
      </div>
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Scarf & Chains</span>
      <div class="w-full flex space-between">
        <SmallInput title="Drawable" class="mr-1"/>
        <SmallInput title="Texture" class="ml-1"/>
      </div>
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Watches</span>
      <div class="w-full flex space-between">
        <SmallInput title="Drawable" class="mr-1" @updateS="setAccessory" :type="{type: 'drawable', key: 3}" :state="store.state.appearance.accessories[3].drawable"/>
        <SmallInput title="Texture" class="ml-1" @updateS="setAccessory" :type="{type: 'texture', key: 3}" :state="store.state.appearance.accessories[3].texture"/>
      </div>
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Bracelets</span>
      <div class="w-full flex space-between">
        <SmallInput title="Drawable" class="mr-1" @updateS="setAccessory" :type="{type: 'drawable', key: 4}" :state="store.state.appearance.accessories[4].drawable"/>
        <SmallInput title="Texture" class="ml-1" @updateS="setAccessory" :type="{type: 'texture', key: 4}" :state="store.state.appearance.accessories[4].texture"/>
      </div>
    </div>
  </div>

</template>