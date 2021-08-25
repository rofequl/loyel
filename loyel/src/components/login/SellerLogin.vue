<template>
  <section class="login-area">
    <header>
      <div class="login-bg-top"></div>
    </header>
    <div class="row">
      <div class="col-lg-6 col-sm-6 col-md-6">
        <div class="login-img">
          <img src="~@/assets/images/login/login-map.png" alt="">
        </div>
      </div>
      <div class="col-lg-6 col-sm-6 col-md-6">
        <div class="login">
          <div class="login-box">
            <div class="login-details">
              <div class="login-header text-center">
                <div class="logo">
                  <router-link to="/"><img class="text-center" :src="showImage(generalSettings.logo_black)" alt="Logo">
                  </router-link>
                </div>
                <span>WELCOME, BE A PART OF US</span>
              </div>
              <a-form :form="form" class="login-form user-layout-login"
                      @submit="handleSubmit">
                <div class="login-form mt-3">
                  <a-alert class="antAlert" v-if="isLoginError" type="error" showIcon
                           :message="isLoginErrorMessage"/>
                  <div class="form-label text-center py-3">Login Account</div>
                  <a-form-item class="mb-3">
                    <a-input size="large" :disabled="emailOrMobile !== ''"
                             placeholder="Email or Phone number"
                             v-decorator="[
                'emailOrMobile',
                {rules: [{ required: true, message: 'You can\'t leave this empty. ' },{max: 50,message: 'Maximum length was 50 character'}], initialValue: emailOrMobile},
              ]">
                      <a-icon slot="prefix" type="mail" :style="{ color: 'rgba(0,0,0,.25)' }"/>
                    </a-input>
                  </a-form-item>
                  <a-form-item class="mb-2">
                    <a-input-password size="large"
                                      placeholder="Password"
                                      v-decorator="[
                'password',
                {rules: [{ required: true, message: 'Please enter your password!' },{max: 20,message: 'Maximum length was 20 character'},
                {min: 6,message: 'Minimum length was 6 character'},]},
              ]">
                      <a-icon slot="prefix" type="lock" :style="{ color: '#a3acb7' }"/>
                    </a-input-password>
                  </a-form-item>
                  <div class="form-group mt-4">
                    <a-button html-type="submit" class="btn pro w-100" :loading="loginBtn"
                              :disabled="loginBtn">Proceed
                    </a-button>
                  </div>


                  <div class="form-group mt-4">
                    <a href="#" class="float-left">Forget Password?</a>
                    <a href="/" @click.prevent="$emit('check')" class="float-right">Not You?</a>
                  </div>
                </div>
              </a-form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import {mapGetters} from "vuex";
import {mapActions} from "vuex";

export default {
  props: ['emailOrMobile', 'reg_type'],
  name: "SellerLogin",
  data() {
    return {
      form: this.$form.createForm(this, {name: 'coordinated'}),
      loginBtn: false,
      isLoginError: false,
      isLoginErrorMessage: '',
    };
  },
  methods: {
    ...mapActions(['LOGIN']),
    handleSubmit: function (e) {
      e.preventDefault();
      const {LOGIN} = this
      this.loginBtn = true
      this.form.validateFieldsAndScroll((err, values) => {
        if (!err) {
          LOGIN(values)
              .then(() => this.loginSuccess())
              .catch(err => this.requestFailed(err))
              .finally(() => {
                this.loginBtn = false
              })
        } else {
          setTimeout(() => {
            this.loginBtn = false
          }, 600)
        }
      });
    },
    async loginSuccess() {
      await this.$store.dispatch('VERIFY_AUTH');
      this.reg_type === 2 ? this.$router.push('/seller') : this.$router.push('/profile')
    },
    requestFailed(err) {
      this.isLoginError = true
      this.isLoginErrorMessage = ((err.response || {}).data || {}).message || 'Invalid credentials';
    },
  },
  computed: {
    ...mapGetters(["generalSettings"])
  },
}
</script>

<style scoped>
>>> .ant-input {
  border: 1px solid #282c3f;
  box-shadow: none;
  border-radius: 2px;
  font-size: 12px;
  font-weight: 400;
  line-height: 1.5;
  color: #495057;
}
</style>
