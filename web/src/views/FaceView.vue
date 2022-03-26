<script setup>
import Slider from '../components/Slider.vue'
</script>

<template>
  <div class="w-full h-10 cs:h-11 cm:h-12 cl:h-13 rounded flex items-center bg-slate-800 text-sky-300 font-bold text-md">
    <span class="ml-4">Face View</span>
  </div>
  <div v-if="$store.state.config.face.eyebrows" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Eyebrows</span>
      <Slider title="Height" :min="-1" :max="1" :step="0.1" type="eyeBrownHigh" :state="$store.state.skin.eyeBrownHigh"/>
      <Slider class="mb-3" title="Forward" :min="-1" :max="1" :step="0.1" type="eyeBrownForward" :state="$store.state.skin.eyeBrownForward"/>
    </div>
  </div>
  <div v-if="$store.state.config.face.mouth" class="w-full bg-slate-800 mt-2 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-3">Eyes & Mouth</span>
      <Slider title="Eyes Opening" :min="-1" :max="1" :step="0.1" type="eyesOpening" :state="$store.state.skin.eyesOpening"/>
      <Slider class="mb-3" title="Lip Thickness" :min="-1" :max="1" :step="0.1" type="lipsThickness" :state="$store.state.skin.lipsThickness"/>
    </div>
  </div>
  <div v-if="$store.state.config.face.nose" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Nose</span>
      <Slider title="Width" :min="-1" :max="1" :step="0.1" type="noseWidth" :state="$store.state.skin.noseWidth"/>
      <Slider title="Height" :min="-1" :max="1" :step="0.1" type="nosePeakLowering" :state="$store.state.skin.nosePeakLowering"/>  <!-- not sure -->
      <Slider title="Size" :min="-1" :max="1" :step="0.1" type="nosePeakSize" :state="$store.state.skin.nosePeakSize"/>
      <Slider title="Bone Height" :min="-1" :max="1" :step="0.1" type="noseBoneHigh" :state="$store.state.skin.noseBoneHigh"/>
      <Slider title="Peak Height" :min="-1" :max="1" :step="0.1" type="nosePeakHigh" :state="$store.state.skin.nosePeakHigh"/>
      <Slider class="mb-3" title="Bone Twist" :min="-1" :max="1" :step="0.1" type="noseBoneTwist" :state="$store.state.skin.noseBoneTwist"/>
    </div>
  </div>
  <div v-if="$store.state.config.face.jaw" class="w-full bg-slate-800 mt-2 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-3">Jaw</span>
      <Slider title="Width" :min="-1" :max="1" :step="0.1" type="jawBoneWidth" :state="$store.state.skin.jawBoneWidth"/>
      <Slider class="mb-3" title="Size" :min="-1" :max="1" :step="0.1" type="jawBoneBackSize" :state="$store.state.skin.jawBoneBackSize"/>
    </div>
  </div>
  <div v-if="$store.state.config.face.chin" class="w-full bg-slate-800 mt-2 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-3">Chin</span>
      <Slider title="Lowering" :min="-1" :max="1" :step="0.1" type="chinBoneLowering" :state="$store.state.skin.chinBoneLowering"/>
      <Slider title="Length" :min="-1" :max="1" :step="0.1" type="chinBoneLength" :state="$store.state.skin.chinBoneLength"/>
      <Slider title="Size" :min="-1" :max="1" :step="0.1" type="chinBoneSize" :state="$store.state.skin.chinBoneSize"/>
      <Slider class="mb-3" title="Dimple Size" :min="-1" :max="1" :step="0.1" type="chinHole" :state="$store.state.skin.chinHole"/>
    </div>
  </div>
  <div v-if="$store.state.config.face.cheeks" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Cheeks</span>
      <Slider title="Bone Height" :min="-1" :max="1" :step="0.1" type="cheeksBoneHigh" :state="$store.state.skin.cheeksBoneHigh"/>
      <Slider title="Bone Width" :min="-1" :max="1" :step="0.1" type="cheeksBoneWidth" :state="$store.state.skin.cheeksBoneWidth"/>
      <Slider class="mb-3" title="Width" :min="-1" :max="1" :step="0.1" type="cheeksWidth" :state="$store.state.skin.cheeksWidth"/>
    </div>
  </div>
  <div v-if="$store.state.config.face.neck" class="w-full bg-slate-800 mt-3 rounded flex flex-col justify-evenly items-center">
    <div class="w-90% flex flex-col justify-between items-start">
      <span class="text-sky-200 font-bold text-custom-2 mt-2">Neck</span>
      <Slider class="mb-3" title="Thickness" :min="-1" :max="1" :step="0.1" type="neckThickness" :state="$store.state.skin.neckThickness"/>
    </div>
  </div>
</template>