<template lang="pug">
div
  button(type="button" name="button" @click="getMsg") RailsからAPIを取得する
  div(v-for="(msg, i) in msgs" :key="i") {{ msg }}
</template>

<script setup>
import { ref } from 'vue'
import axios from 'axios'

const msgs = ref(['a', 'b'])

async function getMsg () {
  const res = await axios.get('http://localhost:3000/api/v1/skills/index')
  console.log(res)
  msgs.value = res.data.skills
  console.log(msgs)
  }
</script>