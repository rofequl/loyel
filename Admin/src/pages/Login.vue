<template>
  <div class="c-app flex-row align-items-center"
       v-bind:style="{ backgroundImage: 'url(' + require('@/assets/images/login-background.jpg') + ')' }">
    <CContainer>
      <CRow class="justify-content-center">
        <CCol md="6">
          <a-form :form="form" class="login-form user-layout-login"
                  @submit="handleSubmit">
            <div>
              <b-img center v-if="$store.getters.generalSettings.logo_white"
                     :src="showImage($store.getters.generalSettings.logo_white)" alt="Center image"
                     height="70px"></b-img>
            </div>
            <p class="text-muted text-center mt-3">Sign In to your account</p>
            <CRow class="justify-content-center">
              <CCol md="7">
                <a-tabs @change="handleTabClick" :activeKey="customActiveKey"
                        :tabBarStyle="{ textAlign: 'center', borderBottom: 'unset' }">
                  <a-tab-pane key="tab1" tab="Credentials">
                    <a-alert v-if="isLoginError" type="error" showIcon style="margin-bottom: 24px;"
                             message="Invalid credentials"/>
                    <a-form-item>
                      <a-input
                          size="large"
                          placeholder="Email"
                          v-decorator="[
                'email',
                {rules: [{ required: true, message: 'Please enter your email address' },{type: 'email',message: 'The input is not valid E-mail!'}]},
              ]"
                      >
                        <a-icon slot="prefix" type="user" :style="{ color: 'rgba(0,0,0,.25)' }"/>
                      </a-input>
                    </a-form-item>
                    <a-form-item>
                      <a-input-password
                          size="large"
                          placeholder="Password"
                          v-decorator="[
                'password',
                {rules: [{ required: true, message: 'Please enter your password' },{ min: 6, message: 'Password minimum 6 character' }]}
              ]"
                      >
                        <a-icon slot="prefix" type="lock" :style="{ color: 'rgba(0,0,0,.25)' }"/>
                      </a-input-password>
                    </a-form-item>
                  </a-tab-pane>
                  <a-tab-pane key="tab2" tab="Mobile number" disabled>
                    <a-form-item>
                      <a-input size="large" type="text" placeholder="Mobile number"
                               v-decorator="['mobile', {rules: [{ required: true, pattern: /^1[34578]\d{9}$/, message: 'Please enter the mobile number' }], validateTrigger: 'change'}]">
                        <a-icon slot="prefix" type="mobile" :style="{ color: 'rgba(0,0,0,.25)' }"/>
                      </a-input>
                    </a-form-item>

                    <a-row :gutter="16">
                      <a-col class="gutter-row" :span="16">
                        <a-form-item>
                          <a-input size="large" type="text" placeholder="Verification code"
                                   v-decorator="['captcha', {rules: [{ required: true, message: 'Please enter the verification code!' }], validateTrigger: 'blur'}]">
                            <a-icon slot="prefix" type="mail" :style="{ color: 'rgba(0,0,0,.25)' }"/>
                          </a-input>
                        </a-form-item>
                      </a-col>
                      <a-col class="gutter-row" :span="8">
                        <a-button
                            class="getCaptcha"
                            tabindex="-1"
                            v-text="'Get code'"
                        ></a-button>
                      </a-col>
                    </a-row>
                  </a-tab-pane>
                </a-tabs>
                <a-form-item style="margin-top:24px">
                  <a-button
                      size="large"
                      type="primary"
                      html-type="submit"
                      class="login-button"
                      :loading="state.loginBtn"
                      :disabled="state.loginBtn"
                  >Login
                  </a-button>
                </a-form-item>
              </CCol>
            </CRow>
            <div class="copyright text-center" v-html="$store.getters.footerList.copyright"></div>
          </a-form>
        </CCol>
      </CRow>
    </CContainer>
  </div>
</template>

<script>
import {mapActions} from 'vuex'

export default {
  name: "Login",
  data() {
    return {
      form: this.$form.createForm(this),
      customActiveKey: 'tab1',
      isLoginError: false,
      state: {
        time: 60,
        loginBtn: false,
        // login type: 0 email, 1 telephone
        loginType: 0,
        smsSendBtn: false
      }
    }
  },
  methods: {
    ...mapActions(['LOGIN']),
    handleTabClick(key) {
      this.customActiveKey = key
      // this.form.resetFields()
    },
    handleSubmit: function (e) {
      e.preventDefault();

      const {form: {validateFields}, state, customActiveKey, LOGIN} = this

      state.loginBtn = true

      const validateFieldsKey = customActiveKey === 'tab1' ? ['email', 'password'] : ['mobile', 'captcha']

      validateFields(validateFieldsKey, {force: true}, (err, values) => {
        if (!err) {
          const email = values.email;
          const password = values.password;
          LOGIN({email, password})
              .then(() => {
                this.$store.dispatch('VERIFY_AUTH')
                    .finally(() => this.$router.push({name: "dashboard"}))
              })
              .catch(err => this.requestFailed(err))
              .finally(() => {
                state.loginBtn = false
              })
        } else {
          setTimeout(() => {
            state.loginBtn = false
          }, 600)
        }
      });
    },
    requestFailed(err) {
      this.isLoginError = true
      this.$notification['error']({
        message: 'Warning',
        description: ((err.response || {}).data || {}).message || 'Invalid credentials',
        duration: 4
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.user-layout-login {
  label {
    font-size: 14px;
  }

  .getCaptcha {
    display: block;
    width: 100%;
    height: 40px;
  }

  button.login-button {
    padding: 0 15px;
    font-size: 16px;
    height: 40px;
    width: 100%;
  }

  .copyright {
    color: rgba(0, 0, 0, 0.45);
    font-size: 14px;
  }
}
</style>
