<script setup>
import NumberInput from '../NumberInput.vue'
import { ref, watch } from 'vue'

const val = ref(0)
watch(val, (v) => {
  console.log(v)
})
</script>

<template>
  <div class="w-full h-10 rounded flex items-center bg-slate-800 text-sky-300 font-bold text-md">
    <span class="ml-4">Head View</span>
  </div>
  <div class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Hair</span>
      <NumberInput title="Style" v-model:value="val"/>
    </div>
  </div>
</template>