<script setup>
import PedView from './views/PedView.vue'
import InheritanceView from './views/InheritanceView.vue'
import FaceView from './views/FaceView.vue'
import HeadView from './views/HeadView.vue'
import UpperView from './views/UpperView.vue'
import LowerView from './views/LowerView.vue'
import AccessoriesView from './views/AccessoriesView.vue'
import TattoosView from './views/TattoosView.vue'
import SideButton from './components/SideButton.vue'
import { fetchNui } from './utils/fetchNui.js';
import { reactive, onMounted, onUnmounted } from 'vue'
import { NScrollbar, NIcon, useDialog, useMessage } from 'naive-ui'
import { CheckroomRound, FamilyRestroomRound, FaceRetouchingNaturalRound, TagFacesOutlined, AccessibilityNewRound, AirlineSeatLegroomExtraRound, FilterVintageRound, GroupWorkRound, ExitToAppRound, SaveRound, ChevronLeftRound, ChevronRightRound } from '@vicons/material'
import { useStore } from 'vuex';

const store = useStore()
const dialog = useDialog()
const message = useMessage()
const state = reactive({
  activeKey: null,
  collapsed: true,
  activeSidebar: false
})

const menu = [
  {
    label: 'Ped Model',
    key: 'ped',
    icon: CheckroomRound,
		type: 'text-sky-300 group-hover:text-sky-500',
  },
  {
    label: 'Family Inheritance',
    key: 'inheritance',
    icon: FamilyRestroomRound,
		type: 'text-sky-300 group-hover:text-sky-500',
  },
  {
    label: 'Face Structure',
    key: 'face',
    icon: FaceRetouchingNaturalRound,
		type: 'text-sky-300 group-hover:text-sky-500',
  },
  {
    label: 'Head Structure',
    key: 'head',
    icon: TagFacesOutlined,
		type: 'text-sky-300 group-hover:text-sky-500',
  },
  {
    label: 'Upper Body',
    key: 'upper',
    icon: AccessibilityNewRound,
		type: 'text-sky-300 group-hover:text-sky-500',
  },
  {
    label: 'Lower Body',
    key: 'lower',
    icon: AirlineSeatLegroomExtraRound,
		type: 'text-sky-300 group-hover:text-sky-500',
  },
  {
    label: 'Accessories',
    key: 'accessories',
    icon: GroupWorkRound,
		type: 'text-sky-300 group-hover:text-sky-500',
  },
  {
    label: 'Tattoos',
    key: 'tattoos',
    icon: FilterVintageRound,
    type: 'text-sky-300 group-hover:text-sky-500',
  },
  {
    status: true,
    label: 'Exit Appearance',
    key: 'exit',
    icon: ExitToAppRound,
    type: 'text-red-400 group-hover:text-red-500',
  },
  {
    label: 'Save Appearance',
    key: 'save',
    icon: SaveRound,
    type: 'text-emerald-300 group-hover:text-emerald-500',
  },
]

const handleSave = () => {
  dialog.warning({
    title: 'Save Appearance',
    content: 'Are you sure you want to look this way? Your looks describe your personality.',
    positiveText: 'Sure',
    negativeText: 'Cancel',
    onPositiveClick: () => {
      message.success('Appearance saved!')
      fetchNui('skin_concluded', { skin: store.state.skin }).then((resp) => {
        if (resp.skin) {
          store.commit('setSkin', resp.skin)
          state.collapsed = true
          state.activeSidebar = false
        } else {
          message.error('Something went wrong!')
        }
      })
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
      fetchNui('skin_concluded', {}).then((resp) => {
        if (resp.skin) {
          store.commit('setSkin', resp.skin)
          state.collapsed = true
          state.activeSidebar = false
        } else {
          message.error('Something went wrong!')
        }
      })
    },
    onNegativeClick: () => {
      message.info('Canceled.')
    }
  })
}

const updateSelector = (key) => {
  switch (key) {
    case 'save':
      state.activeKey = null
      state.collapsed = true
      handleSave()
      fetchNui('skin_camera', { camera: 'default', skin: store.state.skin })
      return
    case 'exit':
      state.activeKey = null
      state.collapsed = true
      handleExit()
      fetchNui('skin_camera', { camera: 'default', skin: store.state.skin })
      return
    default:
      if (key === state.activeKey) {
        state.activeKey = null
        state.collapsed = true
        fetchNui('skin_camera', { camera: 'default', skin: store.state.skin })
        return
      }
      if (state.collapsed) {
        state.collapsed = false
      }
      fetchNui('skin_camera', { camera: key, skin: store.state.skin })
      state.activeKey = key
      return null
  }
}

const handleMessage = e => {
  if (e.data.action === 'skin_start') {
    e.data.config !== undefined ? store.commit('setData', { config: e.data.config, colors: e.data.colors, settings: e.data.settings }) : null
    e.data.skin !== undefined ? store.commit('setSkin', { freeMode: e.data.freeMode, skin: e.data.skin }) : null
    state.activeSidebar = true
  }
}

const handlePress = e => {
  const key = e.key
  if (key === 'ArrowLeft') {
    fetchNui('skin_rotate', { rotation : 'left' })
  }
  if (key === 'ArrowRight') {
    fetchNui('skin_rotate', { rotation : 'right' })
  }
}

onMounted(() => {
  window.addEventListener('message', handleMessage)
  window.addEventListener('keyup', handlePress)
/*  fetchNui('app_loaded').then((resp) => {
    resp.models !== undefined ? store.commit('setModels', resp.models) : null
    resp.locales !== undefined ? store.commit('setLocales', resp.locales) : null
  })*/
})
onUnmounted(() => window.removeEventListener('message', handleMessage))
</script>

<template>
  <div class="absolute flex justify-start items-center w-full h-full overflow-hidden">
    <div class="w-10 cs:w-11 cm:w-12 cl:w-13 rounded-md ml-5" v-if="state.activeSidebar">
      <div v-for="(item, index) in menu" :index="index">
        <SideButton v-if="$store.state.config[item.key].state && item.key === 'ped'" :label="item.label" :icon="item.icon" :type="item.type" @click="updateSelector(item.key)"/>
        <SideButton v-else-if="$store.state.config[item.key].state && item.key === 'exit'" option="hover:bg-red-100" :label="item.label" :icon="item.icon" :type="item.type" @click="updateSelector(item.key)"/>
        <SideButton v-else-if="$store.state.config[item.key].state && item.key === 'save'" option="hover:bg-emerald-100" :label="item.label" :icon="item.icon" :type="item.type" @click="updateSelector(item.key)"/>
        <SideButton v-else-if="$store.state.config[item.key].state && $store.state.data.isFreeMode" :label="item.label" :icon="item.icon" :type="item.type" @click="updateSelector(item.key)"/>
      </div>
    </div>
    <transition name="slide-fade">
      <div v-if="!state.collapsed" class="flex items-center justify-center ml-5 w-80 cs:w-[24em] cm:w-[25em] cl:w-[26em] min-h-116 cs:min-h-[37em] cm:min-h-[39em] cl:min-h-[41em] rounded-md">
        <NScrollbar class="max-h-116 cs:max-h-cs cm:max-h-cm cl:max-h-cl overflow-hidden rounded">
          <PedView v-if="state.activeKey === 'ped'"/>
          <InheritanceView v-else-if="state.activeKey === 'inheritance' && $store.state.data.isFreeMode"/>
          <HeadView v-else-if="state.activeKey === 'head' && $store.state.data.isFreeMode"/>
          <FaceView v-else-if="state.activeKey === 'face' && $store.state.data.isFreeMode"/>
          <UpperView v-else-if="state.activeKey === 'upper' && $store.state.data.isFreeMode"/>
          <LowerView v-else-if="state.activeKey === 'lower' && $store.state.data.isFreeMode"/>
          <AccessoriesView v-else-if="state.activeKey === 'accessories' && $store.state.data.isFreeMode"/>
          <TattoosView v-else-if="state.activeKey === 'tattoos' && $store.state.data.isFreeMode"/>
        </NScrollbar>
      </div>
    </transition>
  </div>
    <div v-if="state.activeSidebar" class="absolute flex items-center justify-between bottom-5 left-[50%] transform translate-x-[-50%] w-48">
    <button @click.self="handlePress({key: 'ArrowLeft'})" class="w-9 cs:w-10 cm:w-11 cl:w-12 h-9 cs:h-10 cm:h-11 cl:h-12 flex items-center justify-center bg-slate-800 rounded text-xl font-bold text-sky-300 hover:text-sky-500 hover:bg-sky-100 transition duration-150 cursor-pointer">
      <NIcon size="3.8vh" :component="ChevronLeftRound"/>
    </button>
    <button @click.self="handlePress({key: 'ArrowRight'})" class="w-9 cs:w-10 cm:w-11 cl:w-12 h-9 cs:h-10 cm:h-11 cl:h-12 flex items-center justify-center bg-slate-800 rounded text-xl font-bold text-sky-300 hover:text-sky-500 hover:bg-sky-100 transition duration-150 cursor-pointer">
      <NIcon size="3.8vh" :component="ChevronRightRound"/>
    </button>
  </div>
</template>

<style>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@100;300;400;500;600;700;800;900&display=swap');

.body {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  margin: 0 auto;
  padding: 0;
  height: 100vh;
  overflow: hidden;
}

#app {
  height: 100%;
  width: 100%;
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