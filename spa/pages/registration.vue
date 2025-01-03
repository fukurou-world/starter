<script setup>
import { ref } from 'vue'
import { USER_TYPE } from '@/utils/constants'

const tab = ref(USER_TYPE.DEALER)
</script>

<template lang="pug">
VContainer
  VRow.mt-5(justify="center")
    VCol(md="8" sm="8")
      VCard(title=" ")
        VTabs.mx-16(v-model="tab" align-tabs="center" fixed-tabs)
          VTab(:value="USER_TYPE.DEALER" color="dealerColor") ディーラー登録
          VTab(:value="USER_TYPE.CLIENT" color="clientColor") クライアント登録
        VTabsWindow(v-model="tab")
          VTabsWindowItem(:value="USER_TYPE.DEALER")
            VSheet.ma-auto.pt-16(height="400" width="75%")
              VTextField(
                label="メールアドレス"
                required
                clearable
                )
              VTextField(
                label="パスワード"
                required
                clearable
                )
              VTextField(
                label="パスワード確認"
                required
                clearable
                )
              VRow.mt-2(justify="center")
                VCol(cols="6")
                  VBtn.w-100(type="submit" color="dealerColor") ディーラーとして登録する
          VTabsWindowItem(:value="USER_TYPE.CLIENT")
            VSheet.ma-auto.pt-16(height="400" width="75%")
              VTextField(
                label="メールアドレス"
                required
                clearable
                )
              VTextField(
                label="パスワード"
                required
                clearable
                )
              VTextField(
                label="パスワード確認"
                required
                clearable
                )
              VRow.mt-2(justify="center")
                VCol(cols="8")
                  VBtn.w-100(type="submit" color="clientColor") クライアントとして登録申請する
</template>