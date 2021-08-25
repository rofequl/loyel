<template>
  <div class="container-fluid p-0">
    <div class="dashboard-title">
      <h4><i class="fa fa-user-circle mr-2"></i>Profile</h4>
    </div>
    <div class="clearfix"></div>
    <div class="section-wrapper">
      <Profile/>
    </div>
  </div>
</template>

<script>
import Profile from "@/pages/account/Profile";

export default {
  components: {Profile},
  name: "SellerProfile"
}
</script>

<style scoped>

</style>
