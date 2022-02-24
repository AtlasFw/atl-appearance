<template>
  <div class="w-full flex flex-col justify-between items-start">
    <div class="w-full flex justify-between mb-2 mt-1">
      <span class="text-blue-400 font-semibold">{{ title }}</span>
      <span class="text-sky-200 font-semibold">{{ currentColor }}</span>
    </div>
    <div class="w-full flex flex-wrap justify-start gap-0.5 mb-1">
        <button v-for="(color, index) in colors" class="w-6 h-6 shadow-xl" @click.self="updateIndex" :data-index="index" :style="{ backgroundColor: color, borderRadius: '1px' }" :key="index"></button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ColorInput',
  data () {
    return {
      selected: null
    }
  },
  props: {
    title: {
      type: String,
      default: 'Number Input',
    },
    currentColor: {
      type: Number,
      default: 0,
    },
    colors: {
      type: Array,
      default: [
        // Add random colors here
        '#f44336',
        '#e91e63',
        '#9c27b0',
        '#673ab7',
        '#3f51b5',
        '#2196f3',
        '#03a9f4',
        '#00bcd4',
        '#009688',
        '#4caf50',
        '#8bc34a',
        '#cddc39',
      ]
    }
  },
  methods: {
    updateIndex(val) {
      let index = val.target.getAttribute('data-index')
      if (this.selected) {
        this.selected.classList.remove('border-2', 'border-sky-200')
      }
      if (this.selected !== val.target) {
        this.selected = val.target
        this.selected.classList.add('border-2', 'border-sky-200')
      } else {
        this.selected = null
        index = 0
      }
      this.$emit('updatecolor', index)
    }
  },
}
</script>