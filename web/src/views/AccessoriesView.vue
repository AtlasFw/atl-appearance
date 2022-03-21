<script setup>
import SmallInput from "../components/SmallInput.vue"
</script>

<template>
  <div class="w-full h-10 cs:h-11 cm:h-12 cl:h-13 rounded flex items-center bg-slate-800 text-sky-300 font-bold text-md">
    <span class="ml-4">Accessories View</span>
  </div>

  <div v-if="$store.state.config.accessories.glasses" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Glasses</span>
      <div class="w-full flex space-between">
        <SmallInput title="Drawable" class="mr-1" :min="$store.state.data.settings.p_glass.drawable.min" :max="$store.state.data.settings.p_glass.drawable.max" type="p_glass_drawable" :state="$store.state.skin.p_glass_drawable"/>
        <SmallInput title="Texture" class="ml-1" :min="$store.state.data.settings.p_glass.texture.min" :max="$store.state.data.settings.p_glass.texture.max" type="p_glass_texture" :state="$store.state.skin.p_glass_texture"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.accessories.mask" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Mask</span>
      <div class="w-full flex space-between">
        <SmallInput title="Drawable" class="mr-1" :min="$store.state.data.settings.components.mask.drawable.min" :max="$store.state.data.settings.components.mask.drawable.max" type="mask" :state="$store.state.skin.components.mask[0]" :index="0"/>
        <SmallInput title="Texture" class="ml-1" :min="$store.state.data.settings.components.mask.texture.min" :max="$store.state.data.settings.components.mask.texture.max" type="mask" :state="$store.state.skin.components.mask[1]" :index="1"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.accessories.bags" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Bags & Parachute</span>
      <div class="w-full flex space-between">
        <SmallInput title="Drawable" class="mr-1" :min="$store.state.data.settings.components.bag.drawable.min" :max="$store.state.data.settings.components.bag.drawable.max" type="bag" :state="$store.state.skin.components.bag[0]" :index="0"/>
        <SmallInput title="Texture" class="ml-1" :min="$store.state.data.settings.components.bag.texture.min" :max="$store.state.data.settings.components.bag.texture.max" type="bag" :state="$store.state.skin.components.bag[1]" :index="1"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.accessories.chains" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Scarf & Chains</span>
      <div class="w-full flex space-between">
        <SmallInput title="Drawable" class="mr-1" :min="$store.state.data.settings.components.accessory.drawable.min" :max="$store.state.data.settings.components.accessory.drawable.max" type="accessory" :state="$store.state.skin.components.accessory[0]" :index="0"/>
        <SmallInput title="Texture" class="ml-1" :min="$store.state.data.settings.components.accessory.texture.min" :max="$store.state.data.settings.components.accessory.texture.max" type="accessory" :state="$store.state.skin.components.accessory[1]" :index="1"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.accessories.watches" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Watches</span>
      <div class="w-full flex space-between">
        <SmallInput title="Drawable" class="mr-1" :min="$store.state.data.settings.p_watch.drawable.min" :max="$store.state.data.settings.p_watch.drawable.max" type="p_watch_drawable" :state="$store.state.skin.p_watch_drawable"/>
        <SmallInput title="Texture" class="ml-1" :min="$store.state.data.settings.p_watch.texture.min" :max="$store.state.data.settings.p_watch.texture.max" type="p_watch_texture" :state="$store.state.skin.p_watch_texture"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.accessories.bracelets" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Bracelets</span>
      <div class="w-full flex space-between">
        <SmallInput title="Drawable" class="mr-1" :min="$store.state.data.settings.p_bracelet.drawable.min" :max="$store.state.data.settings.p_bracelet.drawable.max" type="p_bracelet_drawable" :state="$store.state.skin.p_bracelet_drawable"/>
        <SmallInput title="Texture" class="ml-1" :min="$store.state.data.settings.p_bracelet.texture.min" :max="$store.state.data.settings.p_bracelet.texture.max" type="p_bracelet_texture" :state="$store.state.skin.p_bracelet_texture"/>
      </div>
    </div>
  </div>
</template>