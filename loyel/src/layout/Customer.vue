<template>
  <div class="main-app">
    <Header/>
    <section class="user-profile">
      <div class="container-fluid">
        <div class="section-wrapper">
          <div class="row">
            <div class="col-lg-3 col-12">
              <Sidebar/>
            </div>
            <div class="col-lg-9 col-12 mt-4 mt-lg-0">
              <router-view :key="$route.path"></router-view>
            </div>
          </div>
        </div>
      </div>
    </section>
    <Footer/>
  </div>
</template>

<script>
import Header from "@/layout/frontend/Header";
import Footer from "@/layout/frontend/Footer";
import Sidebar from "@/layout/customer/Sidebar";

export default {
  name: "Customer",
  components: {Sidebar, Header, Footer}
}
</script>

<style scoped>

</style>
