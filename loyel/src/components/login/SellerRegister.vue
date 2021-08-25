<template>
  <section class="login-area" style="height: 100vh">
    <div class="login-bg-top"></div>
    <div class="login sign-log">
      <div class="login-box pb-2">
        <div class="login-details">
          <div class="login-header text-center">
            <div class="logo">
              <router-link to="/"><img class="text-center" :src="showImage(generalSettings.logo_black)" alt="Logo">
              </router-link>
            </div>
            <span>WELCOME, BE A PART OF US</span>
          </div>
          <a-form :form="form" @submit="handleSubmit" :hideRequiredMark="true">
            <div class="login-form mt-1">
              <a-alert class="antAlert" v-if="isLoginError" type="error" showIcon
                       :message="isLoginErrorMessage"/>
              <div class="form-label text-center py-3" v-if="verify">To continue, please verify your email ID</div>
              <div class="form-label text-center py-3" v-else>Create Account</div>
              <a-row :gutter="16" v-if="verify">
                <a-col class="gutter-row" :span="17">
                  <a-form-item class="mb-2" label="Enter the OTP sent to your email ID">
                    <a-input type="text" placeholder="Verification code" size="large"
                             v-decorator="['otp', {rules: [{ required: true, message: 'Enter the verification code!' }], validateTrigger: 'blur'}]">
                      <a-icon slot="prefix" type="mail" :style="{ color: 'rgba(0,0,0,.25)' }"/>
                    </a-input>
                  </a-form-item>
                </a-col>
                <a-col class="gutter-row" :span="7">
                  <a-button
                      class="getCaptcha"
                      tabindex="-1"
                      v-text="!state.smsSendBtn && 'Get code' || (state.time+' s')"
                      :disabled="state.smsSendBtn" @click.stop.prevent="getOTP"
                  ></a-button>
                </a-col>
              </a-row>
              <div :class="{'d-none': verify}">
                <a-form-item class="mb-2">
                  <a-input placeholder="Email ID" :disabled="email !== ''"
                           v-decorator="[
                'email',
                {rules: [{ required: true, message: 'Please enter your email address. ' },{max: 50,message: 'Maximum length was 50 character'},
                {type: 'email',message: 'The input is not valid E-mail!',}], initialValue: email},
              ]">
                    <a-icon slot="prefix" type="mail" :style="{ color: '#a3acb7' }"/>
                  </a-input>
                </a-form-item>
                <a-form-item class="mb-2">
                  <a-input-password
                      placeholder="Password"
                      v-decorator="[
                'password',
                {rules: [{ required: true, message: 'Please enter your password!' },{max: 20,message: 'Maximum length was 20 character'},
                {min: 6,message: 'Minimum length was 6 character'},]},
              ]">
                    <a-icon slot="prefix" type="lock" :style="{ color: '#a3acb7' }"/>
                  </a-input-password>
                </a-form-item>
                <a-form-item class="mb-2">
                  <a-input
                      placeholder="Enter your first and last name"
                      v-decorator="[
                'name',
                {rules: [{ required: true, message: 'Please enter your first and last name' },{max: 50,message: 'Maximum length was 50 character'}]},
              ]">
                    <a-icon slot="prefix" type="user" :style="{ color: '#a3acb7' }"/>
                  </a-input>
                </a-form-item>
                <a-form-item>
                  <a-input type="text" placeholder="Mobile number(eg +8801234567891)" :disabled="mobile !== ''"
                           v-decorator="['mobile', {rules: [{ required: true, message: 'Please enter the mobile number' },
                     {pattern: /^(?:\+88|01)?\d{11}\r?$/, message: 'Enter the valid mobile number'}], validateTrigger: 'change', initialValue: mobile}]">
                    <a-icon slot="prefix" type="mobile" :style="{ color: 'rgba(0,0,0,.25)' }"/>
                  </a-input>
                </a-form-item>
                <a-form-item class="mb-0">
                  <a-checkbox style="line-height: initial"
                              v-decorator="['agreement', { valuePropName: 'checked', rules: [{ required: true, message: 'To continue you have to check the box' }] }]">
                  <span style="font-size: 12px">By signing up, I agree to {{ generalSettings.app_name }}'s <a href="">Privacy Policy </a> and <a
                      href="">Terms & Conditions</a></span>
                  </a-checkbox>
                </a-form-item>
                <a-form-item class="mb-0">
                  <a-checkbox v-decorator="['subscribe', { valuePropName: 'checked' }]">
                    <span style="font-size: 12px">Subscribe to our exclusive offers & promotions</span>
                  </a-checkbox>
                </a-form-item>
              </div>
              <div class="form-group mt-2">
                <a-button html-type="submit" class="btn pro w-100" :loading="state.loginBtn"
                          :disabled="state.loginBtn">Sign up
                </a-button>
              </div>
              <div class="form-group mt-3">
                <a href="/" @click.prevent="$emit('check')" class="text-center d-block">Not You?</a>
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
import {mapActions} from "vuex";
import ApiService from "@/core/services/api.service";

export default {
  props: ['email', 'mobile', 'reg_type'],
  name: "SellerRegister",
  data() {
    return {
      form: this.$form.createForm(this, {name: 'normal_login'}),
      verify: false,
      isLoginError: false,
      isLoginErrorMessage: '',
      state: {
        time: 120,
        loginBtn: false,
        smsSendBtn: false
      }
    };
  },
  methods: {
    ...mapActions(['REGISTER']),
    handleSubmit: function (e) {
      e.preventDefault();
      const {state, verify, REGISTER, reg_type} = this
      state.loginBtn = true
      this.form.validateFieldsAndScroll((err, values) => {
        if (!err) {
          if (!verify) {
            this.getOTP(null);
          } else {
            REGISTER({
              email: values.email,
              name: values.name,
              mobile: values.mobile,
              password: values.password,
              otp: values.otp,
              reg_type: reg_type
            })
                .then(() => this.loginSuccess())
                .catch(err => this.requestFailed(err))
                .finally(() => {
                  state.loginBtn = false
                })
          }
        } else {
          setTimeout(() => {
            state.loginBtn = false
          }, 600)
        }
      });
    },
    getOTP(e) {
      if (e) e.preventDefault()
      const {form: {validateFields}, state, requestFailed} = this
      setTimeout(() => {
        state.loginBtn = false
      }, 600)
      validateFields(['email', 'name'], {force: true}, (err, values) => {
        if (!err) {
          this.isLoginError = false
          state.smsSendBtn = true
          const interval = window.setInterval(() => {
            if (state.time-- <= 0) {
              state.time = 120
              state.smsSendBtn = false
              window.clearInterval(interval)
            }
          }, 1000)
          const hide = this.$message.loading('OTP Sending...', 0)
          ApiService.post('user/send-otp', {emailOrMobile: values.email, name: values.name}).then(() => {
            this.verify = true;
            setTimeout(hide, 2500)
          }).catch(err => {
            requestFailed(err)
            this.verify = false;
            setTimeout(hide, 1)
            clearInterval(interval)
            state.time = 120
            state.smsSendBtn = false
          })
        }
      })
    },
    async loginSuccess() {
      await this.$store.dispatch('VERIFY_AUTH');
      this.reg_type === 2 ? this.$router.push('/seller') : this.$router.push('/profile')
    },
    requestFailed(err) {
      this.isLoginError = true
      this.isLoginErrorMessage = ((err.response || {}).data || {}).message || 'Invalid credentials';
    }
  },
  computed: {
    ...mapGetters(["generalSettings"])
  }
}
</script>

<style scoped>
.sign-log {
  padding-top: 36px;
}

>>> .ant-input {
  border: 1px solid #282c3f;
  box-shadow: none;
  border-radius: 2px;
  font-size: 12px;
  font-weight: 400;
  line-height: 1.5;
  color: #495057;
}

>>> .ant-form-explain {
  font-size: 12px;
}

>>> .ant-input::placeholder {
  color: #777e85;
}

.getCaptcha {
  display: block;
  width: 100%;
  margin-top: 41px;
  height: 41px;
  border: 1px solid #282c3f;
  box-shadow: none;
  border-radius: 2px;
}
</style>
