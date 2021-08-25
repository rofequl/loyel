<template>
  <a-card class="user-details mt-3" :body-style="{padding: '4px'}">
    <div class="user-account">
      <div class="account-header">
        <h4 class="pb-2">Change Password</h4>
      </div>
      <change-password class="py-4"/>
    </div>
  </a-card>
</template>

<script>
import ChangePassword from "@/components/seller/account/manage/ChangePassword";

export default {
  name: "PasswordChange",
  components: {ChangePassword}
}
</script>

<style scoped>

</style>