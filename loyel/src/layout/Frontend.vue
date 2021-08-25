<template>
  <div class="main-app">
    <Header/>
    <router-view :key="$route.path"></router-view>
    <Footer/>
  </div>
</template>

<script>
import Header from "@/layout/frontend/Header";
import Footer from "@/layout/frontend/Footer";

export default {
  name: "Frontend",
  components: {Header, Footer}
}
</script>

<style scoped>

</style>
