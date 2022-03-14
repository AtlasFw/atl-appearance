<template>
  <div class="w-full flex flex-col justify-evenly items-center mb-3 mt-1 ">
    <div class="w-[95%] flex justify-between">
      <span class="text-blue-400 font-semibold">{{ title }}</span>
      <span class="text-sky-200 font-semibold">{{ state }}</span>
    </div>
    <NInputNumber class="mt-1 w-full" :min="min" :max="max" v-model:value="state" @update:value="change(type, state, index)"></NInputNumber>
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