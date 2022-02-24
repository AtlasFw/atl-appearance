<template>
  <div class="w-full flex flex-col justify-between items-start">
    <div class="w-full flex justify-between mb-2 mt-2">
      <span class="text-blue-400 font-semibold">{{ title }}</span>
      <span class="text-sky-200 font-semibold">{{ modelValue }}</span>
    </div>
    <NSlider :step="step" :min="min" :max="max" v-model:value="modelValue"/>
  </div>
</template>

<script>
import { NSlider } from 'naive-ui'
export default {
  name: 'Slider',
  components: { NSlider },
  props: {
    title: {
      type: String,
      default: 'Slider'
    },
    modelValue: {
      type: Number,
      default: 0
    },
    min: {
      type: Number,
      default: 0
    },
    max: {
      type: Number,
      default: 100
    },
    step: {
      type: Number,
      default: 1
    }
  }
}
</script>