<script setup>
import NumberInput from '../components/NumberInput.vue'
import ColorInput from '../components/ColorInput.vue'
import Slider from '../components/Slider.vue'
</script>

<template>
  <div class="w-full h-10 rounded flex items-center bg-slate-800 text-sky-300 font-bold text-md">
    <span class="ml-4">Head View</span>
  </div>

  <div v-if="$store.state.config.head.hair"  class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Hair</span>
      <NumberInput title="Style" type="hairUpStyle" :state="$store.state.skin.hairUpStyle"/>
      <ColorInput class="mb-3" title="Color" :colors="$store.state.data.colors.typeOne" type="hairUpColor" :state="$store.state.skin.hairUpColor"/>
      <ColorInput class="mb-3" title="Highlight" :colors="$store.state.data.colors.typeOne" type="hairUpHighlight" :state="$store.state.skin.hairUpHighlight"/>
    </div>
  </div>

  <div v-if="$store.state.config.head.eyebrows" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Eyebrows</span>
      <NumberInput title="Style" type="eyebrowsUpStyle" :state="$store.state.skin.eyebrowsUpStyle"/>
      <ColorInput title="Color" type="eyebrowsUpColor" :colors="$store.state.data.colors.typeOne" :state="$store.state.skin.eyebrowsUpColor"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" type="eyebrowsUpOpacity" :state="$store.state.skin.eyebrowsUpOpacity"/>
    </div>
  </div>

  <div v-if="$store.state.config.head.eyecolor" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Eye color</span>
      <Slider class="mb-3" title="Style" :min="1" :max="10" :step="1" type="eyeColor" :state="$store.state.skin.eyeColor"/>
    </div>
  </div>

  <div v-if="$store.state.config.head.makeup" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Make Up</span>
      <NumberInput title="Style" type="makeUpStyle" :state="$store.state.skin.makeUpStyle"/>
      <ColorInput title="Color" type="makeUpColor" :colors="$store.state.data.colors.typeTwo" :state="$store.state.skin.makeUpColor"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" type="makeUpOpacity" :state="$store.state.skin.makeUpOpacity"/>
    </div>
  </div>

  <div v-if="$store.state.config.head.blush" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Blush</span>
      <NumberInput title="Style" type="blushUpStyle" :state="$store.state.skin.blushUpStyle"/>
      <ColorInput title="Color" type="blushUpColor" :colors="$store.state.data.colors.typeTwo" :state="$store.state.skin.blushUpColor"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" type="blushUpOpacity" :state="$store.state.skin.blushUpOpacity"/>
    </div>
  </div>

  <div v-if="$store.state.config.head.beard" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Beard</span>
      <NumberInput title="Style" type="chestHairUpStyle" :state="$store.state.skin.chestHairUpStyle"/>
      <ColorInput title="Color" type="chestHairUpColor" :colors="$store.state.data.colors.typeOne" :state="$store.state.skin.chestHairUpColor"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" type="chestHairUpOpacity" :state="$store.state.skin.chestHairUpOpacity"/>
    </div>
  </div>

  <div v-if="$store.state.config.head.lipstick" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Lipstick</span>
      <NumberInput title="Style" type="lipstickUpStyle" :state="$store.state.skin.lipstickUpStyle"/>
      <ColorInput title="Color" type="lipstickUpColor" :colors="$store.state.data.colors.typeTwo" :state="$store.state.skin.lipstickUpColor"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" type="lipstickUpOpacity" :state="$store.state.skin.lipstickUpOpacity"/>
    </div>
  </div>

  <div v-if="$store.state.config.head.blemishes" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Blemishes</span>
      <NumberInput title="Style" type="blemishesUpStyle" :state="$store.state.skin.blemishesUpStyle"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" type="blemishesUpOpacity" :state="$store.state.skin.blemishesUpOpacity"/>
    </div>
  </div>

  <div v-if="$store.state.config.head.ageing" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Ageing</span>
      <NumberInput title="Style" type="ageingUpStyle" :state="$store.state.skin.ageingUpStyle"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" type="ageingUpOpacity" :state="$store.state.skin.ageingUpOpacity"/>
    </div>
  </div>

  <div v-if="$store.state.config.head.complexion" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Complexion</span>
      <NumberInput title="Style" type="complexionUpStyle" :state="$store.state.skin.complexionUpStyle"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" type="complexionUpOpacity" :state="$store.state.skin.complexionUpOpacity"/>
    </div>
  </div>

  <div v-if="$store.state.config.head.sundamage" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Sun Damage</span>
      <NumberInput title="Style" type="sunDamageUpStyle" :state="$store.state.skin.sunDamageUpStyle"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" type="sunDamageUpOpacity" :state="$store.state.skin.sunDamageUpOpacity"/>
    </div>
  </div>

  <div v-if="$store.state.config.head.moles" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Mole & Freckles</span>
      <NumberInput title="Style" type="moleAndFrecklesUpStyle" :state="$store.state.skin.moleAndFrecklesUpStyle"/>
      <Slider class="mb-3" title="Opacity" :min="1" :max="10" :step="1" type="moleAndFrecklesUpOpacity" :state="$store.state.skin.moleAndFrecklesUpOpacity"/>
    </div>
  </div>
</template>