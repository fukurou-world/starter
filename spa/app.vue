<template lang="pug">
div
  button(type="button" name="button" @click="getMsg") RailsからAPIを取得する
  div(v-for="(msg, i) in msgs" :key="i") {{ msg }}
  span {{ hoge }}
</template>
  
  <script setup>
  import { ref } from 'vue'
  
  let hoge = ref(1)
  let msgs = ref(['a', 'b'])
  
  async function getMsg () {
  const { data: response } = await useFetch('http://localhost:3000/api/v1/skills/index')
    console.log('%c response :', 'background-color:lightgray', response)
  const { data: res2 } = await useFetch('/api/v1/skills/index')
    console.log('%c res2 :', 'background-color:lightgray', res2)
  const { data: res3 }= await useFetch('/skills/index')
    console.log('%c res3 :', 'background-color:lightgray', res3)
    msgs.value = ['sss']
    hoge.value++
    console.log(msgs)
    console.log(hoge)
    }
  </script>