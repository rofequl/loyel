<template>
  <div class="container">
    <Slider/>
    <Deal/>
    <!-- FEATURED SELLER AREA START -->
    <section class="featured-seller-area">
      <div class="row">
        <div class="col-12">
          <h2 class="area-title">FEATURED SELLER</h2>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-6 mt-4">
          <div class="feature-seller-image">
            <img class="image-rounded img-fluid" src="assets/images/feature-seller/feature-seller-1.jpg"
                 alt="FEATURED IMAGE">
          </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-6 mt-4">
          <div class="feature-seller-image">
            <img class="image-rounded img-fluid" src="assets/images/feature-seller/feature-seller-2.jpg"
                 alt="FEATURED IMAGE">
          </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-6 mt-4">
          <div class="feature-seller-image">
            <img class="image-rounded img-fluid" src="assets/images/feature-seller/feature-seller-3.jpg"
                 alt="FEATURED IMAGE">
          </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-6 mt-4">
          <div class="feature-seller-image">
            <img class="image-rounded img-fluid" src="assets/images/feature-seller/feature-seller-4.jpg"
                 alt="FEATURED IMAGE">
          </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-6 mt-4">
          <div class="feature-seller-image">
            <img class="image-rounded img-fluid" src="assets/images/feature-seller/feature-seller-5.jpg"
                 alt="FEATURED IMAGE">
          </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-6 mt-4">
          <div class="feature-seller-image">
            <img class="image-rounded img-fluid" src="assets/images/feature-seller/feature-seller-6.jpg"
                 alt="FEATURED IMAGE">
          </div>
        </div>
      </div>
    </section>
    <!-- FEATURED SELLER AREA END -->
    <Featured/>
    <Brand/>
    <!--******************* code start ********************************************-->
    <a-back-top>
      <div class="btop">
        <i class="fa fa-angle-double-up" aria-hidden="true"></i>
        <p>Top</p>
      </div>
    </a-back-top>
    <!--******************* code end **********************************************-->
  </div>
</template>

<script>
import Slider from "@/components/Home/Slider";
import Brand from "@/components/Home/Brand";
import Deal from "@/components/Home/Deal";
import Featured from "@/components/Home/Featured";
import {mapGetters} from "vuex";

export default {
  name: "Home",
  components: {Featured, Deal, Brand, Slider},
  created() {
    if (!this.homeSlider.length > 0) this.$store.dispatch('HOME_SETUP');
  },
  computed: {
    ...mapGetters(["homeSlider"]),
  }
}
</script>

<style scoped>

</style>
