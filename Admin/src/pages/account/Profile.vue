<template>
  <div class="bg-white shadow rounded-lg d-block d-sm-flex">
    <info/>
    <div class="p-4 p-md-5" :style="{width: '80%'}">
      <account v-if="$route.path === '/user-profile'"/>
      <password v-if="$route.path === '/user-password'"/>
    </div>
  </div>
</template>

<script>
import Info from "@/components/account/Info";
import Account from "@/components/account/Account";
import Password from "@/components/account/Password";

export default {
  name: "Profile",
  components: {Password, Account, Info},
}
</script>

<style scoped>

</style>