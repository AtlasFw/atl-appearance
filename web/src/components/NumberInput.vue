<template>
  <div class="w-full flex flex-col justify-between items-start">
    <div class="w-full flex justify-between mb-2 mt-1">
      <span class="text-blue-400 font-semibold">{{ title }}</span>
      <span class="text-sky-200 font-semibold">{{ modelValue }}</span>
    </div>
    <NInputNumber class="w-full mb-3" clearable v-model:value="modelValue"/>
  </div>
</template>

<script>
import { NInputNumber } from 'naive-ui'
export default {
  name: 'NumberInput',
  components: { NInputNumber },
  props: {
    title: {
      type: String,
      default: 'Number Input',
    },
    modelValue: {
      type: Number,
      default: 0,
    }
  }
}
</script>