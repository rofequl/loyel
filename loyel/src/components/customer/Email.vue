<template>
  <a-modal centered :width="350" :visible="visible" :footer="null"
           @cancel="cancelForm" :title="isUpdate? 'Change email address':'Connect with email ID'">
    <a-form :form="form" class="login-form user-layout-login"
            @submit="handleSubmit">
      <a-alert v-if="isLoginError" type="error" showIcon style="margin-bottom: 24px;"
               :message="isLoginErrorMessage"/>
      <a-form-item>
        <a-input size="large" type="text" placeholder="Email Address"
                 v-decorator="['email', {rules: [{ required: true, message: 'Please enter your E-mail address' },
                     {type: 'email', message: 'The input is not valid E-mail'}], validateTrigger: 'change'}]">
          <a-icon slot="prefix" type="mobile" :style="{ color: 'rgba(0,0,0,.25)' }"/>
        </a-input>
      </a-form-item>

      <a-row :gutter="16">
        <a-col class="gutter-row" :span="16">
          <a-form-item>
            <a-input size="large" type="text" placeholder="Verification code"
                     v-decorator="['otp', {rules: [{ required: true, message: 'Enter the verification code!' }], validateTrigger: 'blur'}]">
              <a-icon slot="prefix" type="mail" :style="{ color: 'rgba(0,0,0,.25)' }"/>
            </a-input>
          </a-form-item>
        </a-col>
        <a-col class="gutter-row" :span="8">
          <a-button
              class="getCaptcha"
              tabindex="-1"
              v-text="!state.smsSendBtn && 'Get code' || (state.time+' s')"
              :disabled="state.smsSendBtn"
              @click.stop.prevent="getOTP"
          ></a-button>
        </a-col>
      </a-row>
      <a-form-item style="margin-top:24px">
        <a-button
            size="large"
            type="primary"
            html-type="submit"
            class="login-button"
            :loading="state.loginBtn"
            :disabled="state.loginBtn"
        >Save
        </a-button>
      </a-form-item>
    </a-form>
  </a-modal>
</template>

<script>
import ApiService from "@/core/services/api.service";

export default {
  props: ['isUpdate', 'name'],
  name: "Email",
  data() {
    return {
      form: this.$form.createForm(this),
      visible: false,
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
    modal() {
      this.visible = true;
    },
    cancelForm() {
      this.form.resetFields();
      this.visible = false;
    },
    handleSubmit(e) {
      e.preventDefault();

      const {form: {validateFields}, state} = this

      state.loginBtn = true

      const validateFieldsKey = ['email', 'otp']

      validateFields(validateFieldsKey, {force: true}, (err, values) => {
        if (!err) {
          if (state.smsSendBtn === false) {
            this.isLoginError = true
            this.isLoginErrorMessage = 'Verification code expired..';
            state.loginBtn = false;
            return false;
          }
          ApiService.post('mail-update', values)
              .then(() => {
                this.form.resetFields();
                this.$emit('closeModel')
                this.$store.dispatch('VERIFY_AUTH');
                this.$notification['success']({
                  message: 'congratulations',
                  description: this.isUpdate ? 'Mail update successfully' : 'Mail add successfully',
                  style: {marginTop: '47px'},
                });
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
    getOTP(e) {
      e.preventDefault()
      const {form: {validateFields}, state, name} = this

      validateFields(['email'], {force: true}, (err, values) => {
        if (!err) {
          state.smsSendBtn = true
          const interval = window.setInterval(() => {
            if (state.time-- <= 0) {
              state.time = 120
              state.smsSendBtn = false
              window.clearInterval(interval)
            }
          }, 2000)
          const hide = this.$message.loading('Verification Code Sending...', 0)
          ApiService.post('user/send-otp', {emailOrMobile: values.email, name: name}).then(() => {
            setTimeout(hide, 2500)
            this.isLoginError = false
          }).catch(err => {
            this.requestFailed(err)
            setTimeout(hide, 1)
            clearInterval(interval)
            state.time = 120
            state.smsSendBtn = false
          })
        }
      })
    },
    loginSuccess() {
      this.$emit('closeModel')
    },
    requestFailed(err) {
      this.isLoginError = true
      this.isLoginErrorMessage = ((err.response || {}).data || {}).message || 'Something wrong';
    }
  },
}
</script>

<style scoped lang="scss">
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
