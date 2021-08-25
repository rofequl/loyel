<template>
  <div class="main-content">
    <!-- vertica sidebar start -->
    <Sidebar/>
    <!-- vertica sidebar ends  -->


    <!-- content-right start -->
    <div class="content-right user-profile" id="contentWidth">

      <!-- top navbar start -->
      <Header/>
      <!-- top navbar ends  -->

      <!-- dashboard area start -->
      <div class="dashboard-area" style="min-height: calc(100vh - 170px)">
        <router-view :key="$route.path"></router-view>
      </div>
      <!-- dashboard area ends  -->

      <!-- footer area start -->
      <footer>
        <div class="footer-content">
          <p v-html="$store.getters.footerList.copyright"></p>
        </div>
      </footer>
      <!-- footer area ends  -->


    </div>
    <!-- content-right start -->
  </div>
</template>

<script>
import Sidebar from "@/layout/seller/Sidebar";
import Header from "@/layout/seller/Header";

export default {
  name: "Seller",
  components: {Sidebar, Header}
}
</script>

<style scoped>

</style>
