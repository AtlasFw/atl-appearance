<template>
  <div class="w-full flex flex-col justify-between items-start">
    <div class="w-full flex justify-between mb-2">
      <span class="text-blue-400 font-semibold">{{ title }}</span>
      <span class="text-sky-200 font-semibold">{{ state }}</span>
    </div>
    <NInputNumber class="w-full mb-1" :max="max" :min="min" v-model:value="state" @update:value="change(type, state, index)"/>
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
    min: {
      type: Number,
      default: 0,
    },
    max: {
      type: Number,
      default: 100,
    },
    state: {
      type: Number,
      required: true,
      default: 0,
    },
    type: {
      type: String,
      required: true,
      default: '',
    },
    index: {
      type: Number
    },
  },
  methods: {
    change(key, value, index) {
      this.$store.commit('skinChange', { key: key, value: value, index: index })
    }
  }
}
</script>