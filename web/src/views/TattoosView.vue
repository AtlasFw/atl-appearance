<script setup>
import SmallInput from "../components/SmallInput.vue"
import NumberInput from "../components/NumberInput.vue"
</script>

<template>
  <div class="w-full h-10 cs:h-11 cm:h-12 cl:h-13 rounded flex items-center bg-slate-800 text-sky-300 font-bold text-md">
    <span class="ml-4">Tattoos View</span>
  </div>

  <div v-if="$store.state.config.tattoos.head" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Head</span>
      <div class="w-full flex space-between">
        <NumberInput class="mb-2" title="Style" type="t_head" :min="$store.state.data.settings.t_head.min" :max="$store.state.data.settings.t_head.max" :state="$store.state.skin.t_head"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.tattoos.torso" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Torso</span>
      <div class="w-full flex space-between">
        <NumberInput class="mb-2" title="Style" type="t_torso" :min="$store.state.data.settings.t_torso.min" :max="$store.state.data.settings.t_torso.max" :state="$store.state.skin.t_torso"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.tattoos.arm" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Arm</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" title="Left" type="t_armLeft" :min="$store.state.data.settings.t_armLeft.min" :max="$store.state.data.settings.t_armLeft.max" :state="$store.state.skin.t_armLeft"/>
        <SmallInput class="ml-1" title="Right" type="t_armRight" :min="$store.state.data.settings.t_armRight.min" :max="$store.state.data.settings.t_armRight.max" :state="$store.state.skin.t_armRight"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.tattoos.legs" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Legs</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" title="Left" type="t_legLeft" :min="$store.state.data.settings.t_legLeft.min" :max="$store.state.data.settings.t_legLeft.max" :state="$store.state.skin.t_legLeft"/>
        <SmallInput class="ml-1" title="Right" type="t_legRight" :min="$store.state.data.settings.t_legRight.min" :max="$store.state.data.settings.t_legRight.max" :state="$store.state.skin.t_legRight"/>
      </div>
    </div>
  </div>
</template>