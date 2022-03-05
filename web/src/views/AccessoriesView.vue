<script setup>
import SmallInput from "../components/SmallInput.vue"
</script>

<template>
  <div class="w-full h-10 rounded flex items-center bg-slate-800 text-sky-300 font-bold text-md">
    <span class="ml-4">Lower Body View</span>
  </div>
  <div v-if="$store.state.config.accessories.mask" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Mask</span>
      <div class="w-full flex space-between">
        <SmallInput title="Drawable" class="mr-1" type="mask" :state="$store.state.skin.components.mask[0]" :index="0"/>
        <SmallInput title="Texture" class="ml-1" type="mask" :state="$store.state.skin.components.mask[1]" :index="1"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.accessories.bags" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Bags & Parachute</span>
      <div class="w-full flex space-between">
        <SmallInput title="Drawable" class="mr-1" type="bag" :state="$store.state.skin.components.bag[0]" :index="0"/>
        <SmallInput title="Texture" class="ml-1" type="bag" :state="$store.state.skin.components.bag[0]" :index="0"/>
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
        <SmallInput title="Drawable" class="mr-1" type="p_watch_drawable" :state="$store.state.skin.p_watch_drawable"/>
        <SmallInput title="Texture" class="ml-1" type="p_watch_texture" :state="$store.state.skin.p_watch_texture"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.accessories.bracelets" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Bracelets</span>
      <div class="w-full flex space-between">
        <SmallInput title="Drawable" class="mr-1" type="p_bracelet_drawable" :state="$store.state.skin.p_bracelet_drawable"/>
        <SmallInput title="Texture" class="ml-1" type="p_bracelet_texture" :state="$store.state.skin.p_bracelet_texture"/>
      </div>
    </div>
  </div>
</template>