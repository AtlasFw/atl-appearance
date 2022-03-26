<template>
  <NButton class="flex items-center justify-center text-custom w-full h-10 cs:h-11 cm:h-12 cl:h-13 text-center bg-slate-800 rounded mt-2 mb-2" :type="type" secondary :focusable="false">
    <NTooltip trigger="hover" placement="right" :delay="1" :duration="25">
      <template #trigger>
        <NIcon :component="icon"/>
      </template>
      {{ label }}
    </NTooltip>
  </NButton>
</template>

<script>
import { NButton, NTooltip, NIcon } from 'naive-ui'
export default {
  name: 'SideButton ',
  components: { NButton, NTooltip, NIcon },
  props: {
    icon: {
      type: Object,
      required: true
    },
    type: {
      type: String,
      required: true
    },
    label: {
      type: String,
      required: true
    }
  }
}
</script>