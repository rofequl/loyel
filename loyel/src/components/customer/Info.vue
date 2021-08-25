<template>
  <div class="user-thumb">
    <div class="thumb-header">
      <span>Hi there! {{ user.name }}</span>
    </div>
    <div class="thumb">
      <a-avatar :src="user.photo_type === 0? showImage(user.photo):user.photo" alt="user-image" :size="150"/>
    </div>
    <div class="user-info">
      <h4>{{ user.name }}</h4>
      <p>Member since: <span class="date">{{ moment(user.created_at).format('MMM Do YYYY') }}</span></p>
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
