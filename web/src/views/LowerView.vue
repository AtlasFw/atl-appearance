<script setup>
import SmallInput from "../components/SmallInput.vue"
</script>

<template>
  <div class="w-full h-10 cs:h-11 cm:h-12 cl:h-13 rounded flex items-center bg-slate-800 text-sky-300 font-bold text-md">
    <span class="ml-4">Lower Body View</span>
  </div>
  <div v-if="$store.state.config.lower.legs" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Legs</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" title="Drawable" :min="$store.state.data.settings.components.leg.drawable.min" :max="$store.state.data.settings.components.leg.drawable.max" type="leg" :state="$store.state.skin.components?.leg[0]" :index="0"/>
        <SmallInput class="ml-1" title="Texture" :min="$store.state.data.settings.components.leg.texture.min" :max="$store.state.data.settings.components.leg.texture.max" type="leg" :state="$store.state.skin.components?.leg[1]" :index="1"/>
      </div>
    </div>
  </div>

  <div v-if="$store.state.config.lower.shoes" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Shoes</span>
      <div class="w-full flex space-between">
        <SmallInput class="mr-1" title="Drawable" :min="$store.state.data.settings.components.shoes.drawable.min" :max="$store.state.data.settings.components.shoes.drawable.max" type="shoes" :state="$store.state.skin.components?.shoes[0]" :index="0"/>
        <SmallInput class="ml-1" title="Texture" :min="$store.state.data.settings.components.shoes.texture.min" :max="$store.state.data.settings.components.shoes.texture.max" type="shoes" :state="$store.state.skin.components?.shoes[1]" :index="1"/>
      </div>
    </div>
  </div>
</template>