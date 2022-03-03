<script setup>
import SmallInput from "../SmallInput.vue"
</script>

<template>
  <div v-if="$store.state.config.accessories.state" class="w-full h-10 rounded flex items-center bg-slate-800 text-sky-300 font-bold text-md">
    <span class="ml-4">Lower Body View</span>
  </div>
  <div v-if="$store.state.config.accessories.mask" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Mask</span>
      <div class="w-full flex space-between">
        <SmallInput title="Drawable" class="mr-1" @updateS="setComponent" :type="{type: 'drawable', key: 1}" :state="$store.state.skin"/>
        <SmallInput title="Texture" class="ml-1" @updateS="setComponent" :type="{type: 'texture', key: 1}" :state="$store.state.skin"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.accessories.bags" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Bags & Parachute</span>
      <div class="w-full flex space-between">
        <SmallInput title="Drawable" class="mr-1" @updateS="setComponent" :type="{type: 'drawable', key: 5}" :state="$store.state.skin"/>
        <SmallInput title="Texture" class="ml-1" @updateS="setComponent" :type="{type: 'texture', key: 5}" :state="$store.state.skin" />
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.accessories.chains" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Scarf & Chains</span>
      <div class="w-full flex space-between">
        <SmallInput title="Drawable" class="mr-1"/>
        <SmallInput title="Texture" class="ml-1"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.accessories.watches" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Watches</span>
      <div class="w-full flex space-between">
        <SmallInput title="Drawable" class="mr-1" @updateS="setAccessory" :type="{type: 'drawable', key: 3}" :state="$store.state.skin"/>
        <SmallInput title="Texture" class="ml-1"  @updateS="setAccessory" :type="{type: 'texture', key: 3}" :state="$store.state.skin"  />
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.accessories.bracelets" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Bracelets</span>
      <div class="w-full flex space-between">
        <SmallInput title="Drawable" class="mr-1" @updateS="setAccessory" :type="{type: 'drawable', key: 4}" :state="$store.state.skin"/>
        <SmallInput title="Texture" class="ml-1" @updateS="setAccessory" :type="{type: 'texture', key: 4}" :state="$store.state.skin"/>
      </div>
    </div>
  </div>

</template>