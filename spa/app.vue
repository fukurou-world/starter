<template lang="pug">
  div
    button(type="button" name="button" @click="getMsg") RailsからAPIを取得する
    div(v-for="(msg, i) in msgs" :key="i") {{ msg }}
  </template>
  
  <script setup>
  import { ref } from 'vue'
  
  const msgs = ref(['a', 'b'])
  
  async function getMsg () {
    const msgs = ['sss']
    console.log(msgs)
    }
  </script>