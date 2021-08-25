<template>
  <div class="c-app">
    <Sidebar/>
    <CWrapper>
      <Header/>
      <div class="c-body">
        <main class="c-main">
          <CContainer fluid>
            <transition name="fade" mode="out-in">
              <router-view :key="$route.path"></router-view>
            </transition>
          </CContainer>
        </main>
      </div>
      <Footer/>
    </CWrapper>
  </div>
</template>

<script>
import Header from "@/layout/inc/Header";
import Sidebar from "@/layout/inc/Sidebar";
import Footer from "@/layout/inc/Footer";

export default {
  name: "Layout",
  components: {Sidebar, Header, Footer}
}
</script>

<style scoped>

</style>
