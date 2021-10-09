<template>
  <div class="profile-tab-nav border-right">
    <div class="p-4">
      <div class="img-circle text-center mb-3">
        <img :src="user.photo_type === 0? showImage(user.photo):user.photo" :alt="user.name" class="shadow">
      </div>
      <h4 class="text-center">{{ user.name }}</h4>
    </div>
    <div class="nav flex-column nav-pills">
      <router-link to="/user-profile" active-class="active" class="nav-link">
        <i class="fa fa-home text-center mr-1"></i>
        Account
      </router-link>
      <router-link to="/user-password" active-class="active" class="nav-link">
        <i class="fa fa-key text-center mr-1"></i>
        Password
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: "Info",
  computed: {
    user() {
      return this.$store.getters.currentUser;
    },
  }
}
</script>

<style scoped>

</style>