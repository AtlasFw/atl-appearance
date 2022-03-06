<script setup>
import SmallInput from "../components/SmallInput.vue"
import NumberInput from '../components/NumberInput.vue'
import ColorInput from '../components/ColorInput.vue'
import Slider from '../components/Slider.vue'
</script>

<template>
  <div class="w-full h-10 rounded flex items-center bg-slate-800 text-sky-300 font-bold text-md">
    <span class="ml-4">Upper Body View</span>
  </div>
  <div v-if="$store.state.config.upper.chesthair" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Chest hair</span>
      <NumberInput title="Style" type="chestHairUpStyle" :state="$store.state.skin.chestHairUpStyle"/>
      <ColorInput title="Color" type="chestHairUpColor" :state="$store.state.skin.chestHairUpColor"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" type="chestHairUpOpacity" :state="$store.state.skin.chestHairUpOpacity"/>
    </div>
  </div>

  <div v-if="$store.state.config.upper.bodyblemishes" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Body Blemishes</span>
      <NumberInput title="Style" type="bodyBlemishesUpStyle" :state="$store.state.skin.bodyBlemishesUpStyle"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" type="bodyBlemishesUpOpacity" :state="$store.state.skin.bodyBlemishesUpOpacity"/>
    </div>
  </div>

  <div v-if="$store.state.config.upper.ears" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Ears</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" type="p_ear_drawable" :state="$store.state.skin.p_ear_drawable"/>
        <SmallInput class="ml-1" type="p_ear_texture" :state="$store.state.skin.p_ear_texture"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.upper.arms" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Arms</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" type="undershirt" :state="$store.state.skin.components.undershirt[0]" :index="0"/>
        <SmallInput class="ml-1" type="undershirt" :state="$store.state.skin.components.undershirt[1]" :index="1"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.upper.hats" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Hats & Helmets</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" type="p_hat_drawable" :state="$store.state.skin.p_hat_drawable"/>
        <SmallInput class="ml-1" type="p_hat_texture" :state="$store.state.skin.p_hat_texture"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.upper.glasses" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Glasses</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" type="p_glass_drawable" :state="$store.state.skin.p_glass_drawable"/>
        <SmallInput class="ml-1" type="p_glass_texture" :state="$store.state.skin.p_glass_texture"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.upper.tshirt" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">T-Shirt</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" type="torso" :state="$store.state.skin.components?.torso[0]" :index="0"/>
        <SmallInput class="ml-1" type="torso" :state="$store.state.skin.components?.torso[1]" :index="1"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.upper.jackets" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Jackets</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" type="torso2" :state="$store.state.skin.components?.torso2[0]" :index="0"/>
        <SmallInput class="ml-1" type="torso2" :state="$store.state.skin.components?.torso2[1]" :index="1"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.upper.armor" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Body Armor</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" type="kevlar" :state="$store.state.skin.components?.kevlar[0]" :index="0"/>
        <SmallInput class="ml-1" type="kevlar" :state="$store.state.skin.components?.kevlar[1]" :index="1"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.upper.decals" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Decals</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" type="badge" :state="$store.state.skin.components?.badge[0]" :index="0"/>
        <SmallInput class="ml-1" type="badge" :state="$store.state.skin.components?.badge[1]" :index="1"/>
      </div>
    </div>
  </div>
</template>