<script setup>
import PedView from './components/Ped/PedView.vue'
import InheritanceView from './components/Inheritance/InheritanceView.vue'
import FaceView from './components/Face/FaceView.vue'
import HeadView from './components/Head/HeadView.vue'
import UpperView from './components/Upper/UpperView.vue'
import LowerView from './components/Lower/LowerView.vue'
import AccessoriesView from './components/Accessories/AccessoriesView.vue'
import TattoosView from './components/Tattoos/TattoosView.vue'
import { h, reactive, watch } from 'vue'
import { NLayout, NLayoutSider, NMenu, NIcon, NScrollbar, useDialog, useMessage } from 'naive-ui'
import { CheckroomRound, FamilyRestroomRound, FaceRetouchingNaturalRound, TagFacesOutlined, AccessibilityNewRound, AirlineSeatLegroomExtraRound, FilterVintageRound, GroupWorkRound, ExitToAppRound, SaveRound } from '@vicons/material'

function renderIcon(icon) {
  return () => h(NIcon, null, { default: () => h(icon) });
}

const dialog = useDialog()
const message = useMessage()
const menuOptions = [
  {
    label: 'Ped Model',
    key: 'ped-id',
    icon: renderIcon(CheckroomRound)
  },
  {
    label: 'Family Inheritance',
    key: 'inheritance-id',
    icon: renderIcon(FamilyRestroomRound)
  },
  {
    label: 'Face Structure',
    key: 'face-id',
    icon: renderIcon(FaceRetouchingNaturalRound)
  },
  {
    label: 'Head Accessories',
    key: 'head-id',
    icon: renderIcon(TagFacesOutlined)
  },
  {
    label: 'Upper Body',
    key: 'upper-id',
    icon: renderIcon(AccessibilityNewRound)
  },
  {
    label: 'Lower Body',
    key: 'lower-id',
    icon: renderIcon(AirlineSeatLegroomExtraRound)
  },
  {
    label: 'Accessories',
    key: 'accessories-id',
    icon: renderIcon(GroupWorkRound)
  },
  {
    label: 'Tattoos',
    key: 'tattoos-id',
    icon: renderIcon(FilterVintageRound)
  },
  {
    label: 'Exit Appearance',
    key: 'exit-id',
    icon: renderIcon(ExitToAppRound)
  },
  {
    label: 'Save Appearance',
    key: 'save-id',
    icon: renderIcon(SaveRound)
  },
]

const state = reactive({
  activeKey: null,
  collapsed: true
})

const handleSave = () => {
  // dialog.error({
  //   title: 'Leave',
  //   content: 'Are you sure want to leave the server? You will have to go through queue again if you try to join back.',
  //   positiveText: 'Leave',
  //   negativeText: 'Cancel',
  //   onPositiveClick: () => {
  //     console.log('leave')
  //   }
  // })
}
const handleExit = () => {
  console.log('test')
  dialog.warning({
    title: 'Save Appearance',
    content: 'Are you sure you want to look this way? Your looks describe your personality.',
    positiveText: 'Sure',
    negativeText: 'Cancel',
    onPositiveClick: () => {
      message.success('Appearance saved!')
    }
  })
}

watch(state, ({activeKey}) => {
  if (activeKey === 'exit-id') {
    handleExit()
    state.collapsed = true
  } else if (activeKey === 'save-id') {
    handleSave()
    state.collapsed = true
  } else {
    state.collapsed = false
  }
})
</script>

<template>
  <div class="absolute w-full h-full">
    <div class="absolute flex justify-start items-center bg-black w-full h-full overflow-hidden">
      <div class="rounded-md ml-5">
        <NLayout class="rounded-md h-116" has-sider>
          <NLayoutSider class="mask overflow-hidden" bordered collapse-mode="width" :collapsed-width="64" :collapsed="true">
            <NScrollbar>
              <NMenu mode="vertical" accordion :collapsed="true" :collapsed-width="64" :collapsed-icon-size="20" :options="menuOptions" v-model:value="state.activeKey"></NMenu>
            </NScrollbar>
          </NLayoutSider>
        </NLayout>
      </div>
      <transition name="slide-fade">
        <div v-if="!state.collapsed" class="ml-5 w-80 h-116 bg-primary-dark rounded-md border border-t-0 border-l-0 border-b-0 border-gray-800">
          <PedView v-if="state.activeKey === 'ped-id'"/>
          <InheritanceView v-if="state.activeKey === 'inheritance-id'"/>
          <HeadView v-if="state.activeKey === 'head-id'"/>
          <FaceView v-if="state.activeKey === 'face-id'"/>
          <UpperView v-if="state.activeKey === 'upper-id'"/>
          <LowerView v-if="state.activeKey === 'lower-id'"/>
          <AccessoriesView v-if="state.activeKey === 'accessories-id'"/>
          <TattoosView v-if="state.activeKey === 'tattoos-id'"/>
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