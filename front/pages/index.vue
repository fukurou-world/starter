<template lang="pug">
div
  button(type="button" name="button" @click="getMsg") RailsからAPIを取得する
  div(v-for="(msg, i) in msgs" :key="i") {{ msg }}
</template>

<script>
export default {
  data () {
    return {
      msgs: []
    }
  },
  methods: {
    getMsg () {
      this.$axios.$get('/hello')
        .then(res => this.msgs.push(res))
    }
  }
}
</script>