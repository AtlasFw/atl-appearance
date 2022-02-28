<script setup>
import NumberInput from '../NumberInput.vue'
import ColorInput from '../ColorInput.vue'
import Slider from '../Slider.vue'
import { ref, watch } from 'vue'
import { useStore } from 'vuex';

const store = useStore()
const setHead = (data, value) => store.commit('setHeadOverlays', { data: data, value: value })
const setEye = (key, value) => store.commit('setEyeColor', { key: key, value: value })

const val = ref(0)
const setHair = (index, type) => store.commit('setHair', { key: type, value: index })
</script>

<template>
  <div class="w-full h-10 rounded flex items-center bg-slate-800 text-sky-300 font-bold text-md">
    <span class="ml-4">Head View</span>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Hair</span>
      <NumberInput title="Style" @updateS="setHead" type="style" :state="store.state.appearance.hair.style"/>
      <ColorInput class="mb-3" title="Color" @updatecolor="setHair" type="color"/>
      <ColorInput class="mb-3" title="Highlight" @updatecolor="setHair" />
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Eyebrows</span>
      <NumberInput title="Style" v-model:value="val"/>
      <ColorInput title="Color" @updatecolor="updateColor"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" v-model:value="val"/>
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Eye color</span>
      <Slider class="mb-3" title="Style" :min="1" :max="10" :step="1" @updateS="setEye" :state="store.state.appearance.eyeColor" />
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Make Up</span>
      <NumberInput title="Style" v-model:value="val"/>
      <ColorInput title="Color" @updatecolor="updateColor"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" v-model:value="val"/>
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Blush</span>
      <NumberInput title="Style" v-model:value="val"/>
      <ColorInput title="Color" @updatecolor="updateColor"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" v-model:value="val"/>
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Beard</span>
      <NumberInput title="Style" v-model:value="val"/>
      <ColorInput title="Color" @updatecolor="updateColor"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" v-model:value="val"/>
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Lipstick</span>
      <NumberInput title="Style" v-model:value="val"/>
      <ColorInput title="Color" @updatecolor="updateColor"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" v-model:value="val"/>
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Blemishes</span>
      <NumberInput title="Style" v-model:value="val"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" v-model:value="val"/>
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Ageing</span>
      <NumberInput title="Style" v-model:value="val"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" v-model:value="val"/>
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Complexion</span>
      <NumberInput title="Style" v-model:value="val"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" v-model:value="val"/>
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Sun Damage</span>
      <NumberInput title="Style" v-model:value="val"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" v-model:value="val"/>
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Mole & Freckles</span>
      <NumberInput title="Style" v-model:value="val"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" v-model:value="val"/>
    </div>
  </div>
</template>