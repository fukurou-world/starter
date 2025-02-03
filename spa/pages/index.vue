<script setup>
import { ref } from 'vue'
definePageMeta({
  layout: 'dealer'
})
let hoge = ref(1)
let msgs = ref(['a', 'b'])

async function getMsg() {
  const res = await useApiFetch($fetch, '/api/v1/skills/index')
  console.log('%c res :', 'background-color:lightgreen', res)
  msgs.value = res.skills
  console.log('%c msgs.value.length :', 'background-color:lightgreen', msgs.value.length)
  hoge.value++
}
</script>

<template lang="pug">
div
  span サンプル画面top
  button(type="button" name="button" @click="getMsg") RailsからAPIを取得する
  div msgs: {{ msgs }}
  div(v-for="(msg, i) in msgs" :key="i") {{ i }} 番目 -> {{ msg }}
  span {{ hoge }}
  div
    NuxtLink(to="/registration") register
</template>
