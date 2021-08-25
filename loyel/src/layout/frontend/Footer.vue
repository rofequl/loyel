<template>
  <!-- FOOTER AREA START -->
  <footer class="footer-area">
    <div class="top-footer-area">
      <div class="row">
        <div class="col-lg-3 col-md-3 col-sm-6 col-6">
          <div class="footer-header">
            <h3>Easy and Secure Payments</h3>
          </div>
          <div class="footer-feature">
            <div class="row">
              <div class="col-3 mb-2 p-0">
                <img class="img-fluid" src="@/assets/image/footer/pay-1.png" alt="Payment">
              </div>
              <div class="col-3 mb-2 p-0">
                <img class="img-fluid" src="@/assets/image/footer/pay-2.png" alt="Payment">
              </div>
              <div class="col-3 mb-2 p-0">
                <img class="img-fluid" src="@/assets/image/footer/pay-3.png" alt="Payment">
              </div>
              <div class="col-3 mb-2 p-0">
                <img class="img-fluid" src="@/assets/image/footer/pay-5.png" alt="Payment">
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-6">
          <div class="footer-header">
            <h3>Change Region</h3>
          </div>
          <div class="footer-feature">
            <span class="footer-item">Bangladesh</span>
            <a href="#" class="footer-item text-danger">Change</a>
          </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-6">
          <div class="footer-header">
            <h3>Download App</h3>
          </div>
          <div class="footer-feature">
            <a href="#"><img class="img-fluid mr-2" src="@/assets/image/footer/google-play.png" alt="Google Play"></a>
            <a href="#"><img class="img-fluid" src="@/assets/image/footer/apple-store.png" alt="Apple Store"></a>
          </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-6" v-if="$store.getters.footerList.social">
          <div class="footer-header">
            <h3>FOLLOW</h3>
          </div>
          <div class="footer-feature">
            <a v-if="$store.getters.footerList.facebook" :href="$store.getters.footerList.facebook" target="_blank"><img
                class="img-fluid mr-1" src="@/assets/image/footer/facebook.png" alt="Facebook"></a>
            <a v-if="$store.getters.footerList.twitter" :href="$store.getters.footerList.twitter" target="_blank"><img
                class="img-fluid mr-1" src="@/assets/image/footer/twitter.png" alt="twitter"></a>
            <a v-if="$store.getters.footerList.insta" :href="$store.getters.footerList.insta" target="_blank"><img
                class="img-fluid mr-1" src="@/assets/image/footer/instagram.png" alt="Instagram"></a>
            <a v-if="$store.getters.footerList.youtube" :href="$store.getters.footerList.youtube" target="_blank"><img
                class="img-fluid" src="@/assets/image/footer/youtube.png" alt="youtube"></a>
          </div>
        </div>
      </div>
    </div>

    <hr>

    <div class="top-footer-area">
      <div class="row">
        <div class="col-lg-3 col-md-3 col-sm-6 col-6">
          <div class="footer-header">
            <h3>About Us</h3>
          </div>
          <div class="footer-feature">
            <a href="#" class="footer-item">Careers</a>
            <router-link to="/privacy-policy" class="footer-item">Privacy Policy</router-link>
            <router-link to="/terms-conditions" class="footer-item">Terms of Use</router-link>
            <a href="#" class="footer-item">Press</a>
          </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-6">
          <div class="footer-header">
            <h3>Help</h3>
          </div>
          <div class="footer-feature">
            <a href="#" class="footer-item">Customer Care</a>
            <a href="#" class="footer-item">FAQ</a>
            <a href="#" class="footer-item">Return Policy</a>
            <router-link to="/quotation" class="footer-item">Request for Quotation</router-link>
          </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-6">
          <div class="footer-header">
            <h3>Buisness</h3>
          </div>
          <div class="footer-feature">
            <a href="#" class="footer-item">Sell On Loyel Shopping</a>
            <a href="#" class="footer-item">Buy Wholesale</a>
          </div>
          <Subscribe/>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-6">
          <div class="footer-header">
            <h3>COMPANY</h3>
          </div>
          <div class="footer-feature">
            <span class="footer-item">{{ $store.getters.generalSettings.app_name }} Online Shop</span>
            <span class="footer-item"><i class="fa fa-mobile"></i> {{ $store.getters.footerList.phone }}</span>
            <span class="footer-item"><i class="fa fa-map-marker"></i> {{ $store.getters.footerList.address }}</span>
            <span class="footer-item">{{ $store.getters.footerList.working }}</span>
            <span class="footer-item"><i class="fa fa-envelope"></i> {{ $store.getters.footerList.email }}</span>
          </div>
        </div>
      </div>
    </div>

    <hr>

    <div class="top-footer-area">
      <div class="row">
        <div class="col-12">
          <div class="footer-item" v-html="$store.getters.footerList.description"></div>
          <p class="footer-item" v-html="$store.getters.footerList.copyright"></p>
        </div>
      </div>
    </div>
  </footer>
  <!-- FOOTER AREA END -->
</template>

<script>
import Subscribe from "@/components/layout/Subscribe";

export default {
  name: "Footer",
  components: {Subscribe}
}
</script>

<style scoped>

</style>
