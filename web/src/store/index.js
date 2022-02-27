import { createStore } from 'vuex'
import { fetchNui } from '../components/fetchNui.js'

export default createStore({
  state: {
    copyAppearance: {},
    appearance: {
      ped: '',
      heritage: {
        shapeMother: 0,
        shapeFather: 0,
        shapeThird: 0,
        shapeMix: 0,
        skinMother: 0,
        skinFather: 0,
        skinThird: 0,
        skinMix: 0,
        thirdMix: 0,
      },
      faceFeatures: {
        cheeksBoneWidth: 0.0,
        chinBoneSize: 0.0,
        nosePeakHigh: 0.0,
        eyesOpening: 0.0,
        chinBoneLenght: 0.0,
        chinBoneLowering: 0.0,
        nosePeakLowering: 0.0,
        jawBoneWidth: 0.0,
        neckThickness: 0.0,
        noseBoneHigh: 0.0,
        eyeBrownHigh: 0.0,
        nosePeakSize: 0.0,
        eyeBrownForward: 0.0,
        jawBoneBackSize: 0.0,
        lipsThickness: 0.0,
        cheeksWidth: 0.0,
        chinHole: 0.0,
        cheeksBoneHigh: 0.0,
        noseWidth: 0.0,
        noseBoneTwist: 0.0
      },
      eyeColor: 0,
      accessories: [
        {
          prop_id: 0,
          texture: -1,
          drawable: -1
        },
        {
          prop_id: 1,
          texture: -1,
          drawable: -1
        },
        {
          prop_id: 2,
          texture: -1,
          drawable: -1
        },
        {
          prop_id: 6,
          texture: -1,
          drawable: -1
        },
        {
          prop_id: 7,
          texture: -1,
          drawable: -1
        }
      ],
      headOverlays: {
        makeUp: {
          style: 0,
          secondColor: 0,
          color: 0,
          opacity: 0
        },
        eyebrows: {
          style: 0,
          secondColor: 0,
          color: 0,
          opacity: 0
        },
        moleAndFreckles: {
          style: 0,
          secondColor: 0,
          color: 0,
          opacity: 0
        },
        blush: {
          style: 0,
          secondColor: 0,
          color: 0,
          opacity: 0
        },
        chestHair: {
          style: 0,
          secondColor: 0,
          color: 0,
          opacity: 0
        },
        lipstick: {
          style: 0,
          secondColor: 0,
          color: 0,
          opacity: 0
        },
        sunDamage: {
          style: 0,
          secondColor: 0,
          color: 0,
          opacity: 0
        },
        bodyBlemishes: {
          style: 0,
          secondColor: 0,
          color: 0,
          opacity: 0
        },
        complexion: {
          style: 0,
          secondColor: 0,
          color: 0,
          opacity: 0
        },
        ageing: {
          style: 0,
          secondColor: 0,
          color: 0,
          opacity: 0
        },
        blemishes: {
          style: 0,
          secondColor: 0,
          color: 0,
          opacity: 0
        },
        beard: {
          style: 0,
          secondColor: 0,
          color: 0,
          opacity: 0
        }
      },
      hair: {
        style: 0,
        color: 0,
        highlight: 0
      },
      components: [
        {
          component_id: 0,
          texture: 0,
          drawable: 0
        },
        {
          component_id: 1,
          texture: 0,
          drawable: 0
        },
        {
          component_id: 2,
          texture: 0,
          drawable: 0
        },
        {
          component_id: 3,
          texture: 0,
          drawable: 0
        },
        {
          component_id: 4,
          texture: 0,
          drawable: 0
        },
        {
          component_id: 5,
          texture: 0,
          drawable: 0
        },
        {
          component_id: 6,
          texture: 0,
          drawable: 0
        },
        {
          component_id: 7,
          texture: 0,
          drawable: 0
        },
        {
          component_id: 8,
          texture: 0,
          drawable: 0
        },
        {
          component_id: 9,
          texture: 0,
          drawable: 0
        },
        {
          component_id: 10,
          texture: 0,
          drawable: 0
        },
        {
          component_id: 11,
          texture: 0,
          drawable: 0
        }
      ]
    },
    models: [],
    config: {
      ped: false,
      inheritance: {
        state: true
      },
      face: true,
      head: true,
      upper: true,
      lower: true,
      accessories: true,
      tattoos: true,
    }
  },
  mutations: {
    setModels (state, models) {
      state.models = models
    },
    setAppearance (state, appearance) {
      state.copyAppearance = appearance
      state.appearance = appearance
      console.log(JSON.stringify(state.appearance))
      console.log(JSON.stringify(state.appearance.heritage))
    },
    setHeritage (state, { key, value }) {
      console.log(key, value)
      state.appearance.heritage[key] = value
      fetchNui('appearance_heritage', state.appearance.heritage)
    },
    setFace(state, { key, value }) {
      console.log(key, value)
      state.appearance.faceFeatures[key] = value
      fetchNui('appearance_face_feature', state.appearance.faceFeatures)
    },
    setEyeColor(state, { value }) {
      console.log(value)
      state.appearance.eyeColor = value
      fetchNui('appearance_eye_color', state.appearance.eyeColor)
    },
    setAccessory(state, { data, value }) {
      state.appearance.accessories[data.key][data.type] = value
      fetchNui('appearance_accessory', state.appearance.accessories[data.key])
    },
    setHeadOverlays(state, { key, type, value }) {
      console.log(key, type, value)
      state.appearance.headOverlays[key][type] = value
      fetchNui('appearance_accessory', { hair: state.appearance.hair, overlays: state.appearance.headOverlays })
    },
    setComponent(state, { data, value }) {
      console.log(data.key, data.type, value)
      state.appearance.components[data.key][data.type] = value
      fetchNui('appearance_component', state.appearance.components[data.key])
    },
  },
  getters: {
    appearance: state => state.appearance,
  }
})