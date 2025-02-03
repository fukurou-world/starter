<script setup>
import { USER_TYPE } from '@/utils/constants'
</script>

<template lang="pug">
VSheet(width="100%" height="18" color="dealerColor")
VAppBar.mt-5(color="primary" dark)
  VToolbar
    VToolbarTitle
      NuxtLink(to="/") サンプル画面
    VSpacer
    VBtn(to="/registration") 登録
slot
</template>
