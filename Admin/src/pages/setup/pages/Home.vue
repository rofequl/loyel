<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">Setup & Configurations
        </span>
        <h3 class="page-title">Home Page Settings</h3>
      </div>
    </div>
    <hr>
    <!-- End Page Header -->

    <CRow class="my-4 justify-content-center">
      <CCol md="8">
        <Slider/>
        <Brand/>
        <featured-seller/>
      </CCol>
    </CRow>

  </div>
</template>

<script>
import Slider from "@/components/setup/pages/home/Slider";
import Brand from "@/components/setup/pages/home/Brand";
import FeaturedSeller from "@/components/setup/pages/home/FeaturedSeller";

export default {
  name: "Home",
  components: {FeaturedSeller, Brand, Slider}
}
</script>

<style scoped>

</style>
