<script setup>
import SmallInput from "../SmallInput.vue"
import NumberInput from '../NumberInput.vue'
import ColorInput from '../ColorInput.vue'
import Slider from '../Slider.vue'
import { useStore } from 'vuex';

const store = useStore()
const setComponent = (data, value) => store.commit('setComponent', { data: data, value: value })
const setAccessory = (data, value) => store.commit('setAccessory', { data: data, value: value })
const setHead = (key, value) => store.commit('setFace', { key: key, value: value })
</script>

<template>
  <div class="w-full h-10 rounded flex items-center bg-slate-800 text-sky-300 font-bold text-md">
    <span class="ml-4">Upper Body View</span>
  </div>
  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Chest hair</span>
      <NumberInput title="Style" v-model:value="val"/>
      <ColorInput title="Color" @updatecolor="updateColor"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" @updateS="setFace" type="eyeBrownHigh" :state="store.state.appearance.faceFeatures.eyeBrownHigh"/>
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Body Blemishes</span>
      <NumberInput title="Style" v-model:value="val"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" v-model:value="val"/>
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Ears</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" @updateS="setAccessory" :type="{type: 'drawable', key: 2}" :state="store.state.appearance.accessories[2].drawable"/>
        <SmallInput class="ml-1" @updateS="setAccessory" :type="{type: 'texture', key: 2}" :state="store.state.appearance.accessories[2].drawable"/>
      </div>
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Arms</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1"/>
        <SmallInput class="ml-1"/>
      </div>
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Hats & Helmets</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" @updateS="setAccessory" :type="{type: 'drawable', key: 0}" :state="store.state.appearance.accessories[0].drawable"/>
        <SmallInput class="ml-1" @updateS="setAccessory" :type="{type: 'texturetexture', key: 0}" :state="store.state.appearance.accessories[0].drawable"/>
      </div>
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Glasses</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" @updateS="setAccessory" :type="{type: 'drawable', key: 1}" :state="store.state.appearance.accessories[1].drawable"/>
        <SmallInput class="ml-1" @updateS="setAccessory" :type="{type: 'texture', key: 1}" :state="store.state.appearance.accessories[1].drawable"/>
      </div>
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">T-Shirt</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" @updateS="setComponent" :type="{type: 'drawable', key: 3}" :state="store.state.appearance.components[3].drawable"/>
        <SmallInput class="ml-1" @updateS="setComponent" :type="{type: 'texture', key: 3}" :state="store.state.appearance.components[3].drawable" />
      </div>
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Jackets</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" @updateS="setComponent" :type="{type: 'drawable', key: 11}" :state="store.state.appearance.components[11].drawable"/>
        <SmallInput class="ml-1" @updateS="setComponent" :type="{type: 'texture', key: 11}" :state="store.state.appearance.components[11].drawable"/>
      </div>
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Body Armor</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" @updateS="setComponent" :type="{type: 'drawable', key: 11}" :state="store.state.appearance.components[11].drawable"/>
        <SmallInput class="ml-1" @updateS="setComponent" :type="{type: 'texture', key: 11}" :state="store.state.appearance.components[11].drawable"/>
      </div>
    </div>
  </div>

  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Decals</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" />
        <SmallInput class="ml-1" />
      </div>
    </div>
  </div>
</template>