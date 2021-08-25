<template>
  <section class="login-area sign-area">
    <div class="login-bg-top"></div>
    <div class="login sign-log">
      <div class="login-box box-1" style="height: 250px">
        <div class="login-details">
          <div class="login-header text-center">
            <div class="logo">
              <router-link to="/"><img class="text-center" :src="showImage(generalSettings.logo_black)" alt="Logo">
              </router-link>
            </div>
            <span>WELCOME, BE A PART OF US</span>
          </div>
          <p class="text-center mt-2 text-muted">You ar log in as a seller, if you want to use the same account please
            click the button or you can
            <u class="text-primary pointer" @click="$store.dispatch('LOGOUT')">logout.</u></p>
          <div class="form-group mt-4">
            <a-button type="danger" @click="customerLogin" class="btn pro w-100" :loading="loginBtn"
                      :disabled="loginBtn">Log in as a customer
            </a-button>
          </div>
        </div>
      </div>
    </div>
    <div class="login-bg-bottom"></div>
  </section>
</template>

<script>
import {mapGetters} from "vuex";
import ApiService from "@/core/services/api.service";

export default {
  name: "IsSellerLog",
  data() {
    return {
      loginBtn: false
    }
  },
  methods: {
    customerLogin() {
      this.loginBtn = true
      ApiService.post('user/customer-login', {id: this.currentUser.id})
          .then(() => this.loginSuccess())
          .catch(err => this.requestFailed(err))
          .finally(() => {
            this.loginBtn = false
          })
    },
    loginSuccess() {
      this.$store.dispatch('VERIFY_AUTH').finally(() => this.$router.push('/profile'));
    },
    requestFailed(err) {
      this.isLoginError = true
      this.isLoginErrorMessage = ((err.response || {}).data || {}).message || 'Invalid credentials';
    }
  },
  computed: {
    ...mapGetters(["generalSettings", "currentUser"])
  },
}
</script>

<style scoped>

</style>
