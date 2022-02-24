<template>
  <div class="w-full flex flex-col justify-evenly items-center mb-3 mt-1 ">
    <div class="w-[95%] flex justify-between">
      <span class="text-blue-400 font-semibold">{{ title }}</span>
      <span class="text-sky-200 font-semibold">{{ modelValue }}</span>
    </div>
    <NInputNumber class="mt-1 w-full" :min="min" :max="max" ></NInputNumber>
  </div>
</template>

<script>
import { NInputNumber } from 'naive-ui'
export default {
  name: 'SmallInput',
  components: { NInputNumber },
  props: {
    title: {
      type: String,
      default: 'Small Input',
    },
    min: {
      type: Number,
      default: 0,
    },
    max: {
      type: Number,
      default: 100,
    },
    modelValue: {
      type: Number,
      default: 0,
    }
  }
}
</script>