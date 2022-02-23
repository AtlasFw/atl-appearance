<script setup>
import PedView from './components/Ped/PedView.vue'
import InheritanceView from './components/Inheritance/InheritanceView.vue'
import FaceView from './components/Face/FaceView.vue'
import HeadView from './components/Head/HeadView.vue'
import UpperView from './components/Upper/UpperView.vue'
import LowerView from './components/Lower/LowerView.vue'
import AccessoriesView from './components/Accessories/AccessoriesView.vue'
import TattoosView from './components/Tattoos/TattoosView.vue'
import { reactive } from 'vue'
import { NButton, NIcon, NScrollbar, useDialog, useMessage, NTooltip } from 'naive-ui'
import { CheckroomRound, FamilyRestroomRound, FaceRetouchingNaturalRound, TagFacesOutlined, AccessibilityNewRound, AirlineSeatLegroomExtraRound, FilterVintageRound, GroupWorkRound, ExitToAppRound, SaveRound } from '@vicons/material'

const dialog = useDialog()
const message = useMessage()
const menuOptions = [
  {
    label: 'Ped Model',
    key: 'ped-id',
    icon: CheckroomRound,
    type: 'info',
  },
  {
    label: 'Family Inheritance',
    key: 'inheritance-id',
    icon: FamilyRestroomRound,
    type: 'info',
  },
  {
    label: 'Face Structure',
    key: 'face-id',
    icon: FaceRetouchingNaturalRound,
    type: 'info',
  },
  {
    label: 'Head Accessories',
    key: 'head-id',
    icon: TagFacesOutlined,
    type: 'info',
  },
  {
    label: 'Upper Body',
    key: 'upper-id',
    icon: AccessibilityNewRound,
    type: 'info',
  },
  {
    label: 'Lower Body',
    key: 'lower-id',
    icon: AirlineSeatLegroomExtraRound,
    type: 'info',
  },
  {
    label: 'Accessories',
    key: 'accessories-id',
    icon: GroupWorkRound,
    type: 'info',
  },
  {
    label: 'Tattoos',
    key: 'tattoos-id',
    icon: FilterVintageRound,
    type: 'info',
  },
  {
    label: 'Exit Appearance',
    key: 'exit-id',
    icon: ExitToAppRound,
    type: 'error',
  },
  {
    label: 'Save Appearance',
    key: 'save-id',
    icon: SaveRound,
    type: 'success',
  },
]

const state = reactive({
  activeKey: null,
  collapsed: true
})

const handleSave = () => {
  dialog.warning({
    title: 'Save Appearance',
    content: 'Are you sure you want to look this way? Your looks describe your personality.',
    positiveText: 'Sure',
    negativeText: 'Cancel',
    onPositiveClick: () => {
      message.success('Appearance saved!')
    },
    onNegativeClick: () => {
      message.info('Canceled.')
    }
  })
}
const handleExit = () => {
  dialog.error({
    title: 'Cancel Appearance',
    content: 'Are you sure you want to cancel your appearance? This will not be saved.',
    positiveText: 'Exit',
    negativeText: 'Cancel',
    onPositiveClick: () => {
      message.success('Cancelled appearance.')
    },
    onNegativeClick: () => {
      message.info('Canceled.')
    }
  })
}

const updateSelector = (key) => {
  switch (key) {
    case 'save-id':
      state.activeKey = null
      state.collapsed = true
      handleSave()
      return
    case 'exit-id':
      state.activeKey = null
      state.collapsed = true
      handleExit()
      return
    default:
      if (key === state.activeKey) {
        state.activeKey = null
        state.collapsed = true
        return
      }
      if (state.collapsed) {
        state.collapsed = false
      }
      state.activeKey = key
      return null
  }
}
</script>

<template>
  <div class="absolute w-full h-full">
    <div class="absolute flex justify-start items-center bg-black w-full h-full overflow-hidden">
      <div class="w-10 rounded-md ml-5">
        <NButton class="flex items-center justify-center text-custom w-full h-10 text-center bg-slate-800 rounded mt-2 mb-2" v-for="(btn, index) in menuOptions" :key="index" :type="btn.type" strong secondary  :focusable="false" @click="updateSelector(btn.key)">
          <NTooltip trigger="hover" placement="right" :delay="1" :duration="25">
            <template #trigger>
              <NIcon :component="btn.icon"/>
            </template>
            {{ btn.label }}
          </NTooltip>
        </NButton>
      </div>
      <transition name="slide-fade">
        <div v-if="!state.collapsed" class="ml-5 w-80 min-h-116 bg-slate-800 rounded-md">
          <NScrollbar>
            <PedView v-if="state.activeKey === 'ped-id'"/>
            <InheritanceView v-else-if="state.activeKey === 'inheritance-id'"/>
            <HeadView v-else-if="state.activeKey === 'head-id'"/>
            <FaceView v-else-if="state.activeKey === 'face-id'"/>
            <UpperView v-else-if="state.activeKey === 'upper-id'"/>
            <LowerView v-else-if="state.activeKey === 'lower-id'"/>
            <AccessoriesView v-else-if="state.activeKey === 'accessories-id'"/>
            <TattoosView v-else-if="state.activeKey === 'tattoos-id'"/>
          </NScrollbar>
        </div>
      </transition>
    </div>
  </div>
</template>

<style>
.body {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen',
  'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue',
  sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  font-size: 20px;
  margin: 0;
  padding: 0;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
}

#app {
  height: 100%;
  width: 100%;
}

.mask {
  mask-image: linear-gradient(to bottom, #000000 95%, transparent 100%);
}

.slide-fade-enter-active {
  transition: all 0.15s ease-out;
}
.slide-fade-leave-active {
  transition: all 0.15s cubic-bezier(1, 0.5, 0.8, 1);
}
.slide-fade-enter-from {
  transform: translateX(-40px);
  opacity: 0;
}

.slide-fade-leave-to {
  transform: translateX(-40px);
  opacity: 0;
}
</style>