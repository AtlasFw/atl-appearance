<template>
  <div class="w-full flex flex-col justify-between items-start">
    <div class="w-full flex justify-between mb-2 mt-1">
      <span class="text-blue-400 font-semibold">{{ title }}</span>
      <span class="text-sky-200 font-semibold">{{ state }}</span>
    </div>
    <div class="w-full flex flex-wrap justify-start gap-0.5 mb-1">
      <button v-for="(color, index) in colors" class="w-6 h-6 shadow-xl" @click.self="updateIndex" :data-index="index" :data-type="type" :style="{ backgroundColor: color, borderRadius: '1px' }" :key="index"></button>
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
    state: {
      type: Number,
      default: 0,
    },
    type: {
      type: String,
      required: false,
      default: '',
    },
    colors: {
      type: Array,
      default: []
    }
  },
  methods: {
    updateIndex(val) {
      let index = parseInt(val.target.getAttribute('data-index'))
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
      this.$store.commit('skinChange', { key: this.type, value: index })
    }
  },
}
</script>