<template>
  <section class="login-area sign-area">
    <div class="login-bg-top"></div>
    <div class="login sign-log">
      <div class="login-box box-1">
        <div class="login-details">
          <div class="login-header text-center">
            <div class="logo">
              <router-link to="/"><img class="text-center" :src="showImage(generalSettings.logo_black)" alt="Logo">
              </router-link>
            </div>
            <span>WELCOME, BE A PART OF US</span>
          </div>
          <a-form :form="form"
                  @submit="handleSubmit">
            <div class="login-form mt-3">
              <a-alert class="antAlert" v-if="isLoginError" type="error" showIcon
                       :message="isLoginErrorMessage"/>
              <div class="form-label text-center py-3">Continue With E-mail or Phone Number</div>
              <a-form-item class="mb-2">
                <a-input size="large"
                         placeholder="Email or Phone number"
                         v-decorator="[
                'emailOrMobile',
                {rules: [{ required: true, message: 'You can\'t leave this empty. ' },{max: 50,message: 'Maximum length was 50 character'}]},
              ]">
                  <a-icon slot="prefix" type="mail" :style="{ color: 'rgba(0,0,0,.25)' }"/>
                </a-input>
              </a-form-item>
              <div class="form-group mt-4">
                <a-button html-type="submit" class="btn pro w-100" :loading="loginBtn"
                          :disabled="loginBtn">Proceed
                </a-button>
              </div>
            </div>
          </a-form>
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
  name: "CheckEmail",
  data() {
    return {
      form: this.$form.createForm(this, {name: 'coordinated'}),
      loginBtn: false,
      isLoginError: false,
      isLoginErrorMessage: '',
    };
  },
  methods: {
    handleSubmit: function (e) {
      e.preventDefault();
      this.form.validateFields((err, values) => {
        if (!err) {
          ApiService.post('user/check-registers', {emailOrMobile: values.emailOrMobile})
              .then((e) => this.requestSuccess({emailOrMobile: values.emailOrMobile, data: e.data}))
              .catch(err => this.requestFailed(err))
        } else {
          setTimeout(() => {
            this.loginBtn = false
          }, 600)
        }
      })
    },
    requestSuccess(e) {
      this.$emit('checkSubmit', e)
    },
    requestFailed(err) {
      this.isLoginError = true
      this.isLoginErrorMessage = ((err.response || {}).data || {}).message || 'Invalid credentials';
    }
  },
  computed: {
    ...mapGetters(["generalSettings"])
  },
}
</script>

<style scoped>
.antAlert >>> span {
  font-size: 13px;
}
</style>
