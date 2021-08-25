<template>
  <a-modal centered :width="350" :visible="visible" :footer="null"
           @cancel="cancelForm" :title="title">
    <a-form :form="form" class="login-form user-layout-login"
            @submit="handleSubmit">
      <a-alert v-if="isLoginError" type="error" showIcon style="margin-bottom: 24px;"
               :message="isLoginErrorMessage"/>
      <a-form-item>
        <a-input type="text" placeholder="Mobile number(eg +8801234567891)" :disabled="mobile !== ''"
                 v-decorator="['mobile', {rules: [{ required: true, message: 'Please enter the mobile number' },
                     {pattern: /^(?:\+88|01)?\d{11}\r?$/, message: 'Enter the valid mobile number'}], validateTrigger: 'change', initialValue: mobile}]">
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
import {mapGetters} from "vuex";
import ApiService from "@/core/services/api.service";

export default {
  name: "Mobile",
  data() {
    return {
      form: this.$form.createForm(this),
      title: '',
      successTitle: '',
      mobile: '',
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
    modal(e) {
      this.mobile = '';
      if (e === 'add') {
        this.title = 'Connect with phone number ID';
        this.successTitle = 'Phone number add successfully';
      } else if (e === 'change') {
        this.title = 'Change phone number';
        this.successTitle = 'Phone number update successfully';
      } else if (e === 'verify') {
        this.title = 'Verify phone number';
        this.successTitle = 'Phone number verify successfully';
        this.mobile = this.user.mobile;
      }
      this.visible = true;
    },
    cancelForm() {
      this.form.resetFields();
      this.visible = false;
    },
    handleSubmit(e) {
      e.preventDefault();

      const {form: {validateFields}, state, successTitle} = this

      state.loginBtn = true

      const validateFieldsKey = ['mobile', 'otp']

      validateFields(validateFieldsKey, {force: true}, (err, values) => {
        if (!err) {
          if (state.smsSendBtn === false) {
            this.isLoginError = true
            this.isLoginErrorMessage = 'Verification code expired..';
            state.loginBtn = false;
            return false;
          }
          ApiService.post('number-update', values)
              .then(() => {
                this.form.resetFields();
                this.cancelForm()
                this.$store.dispatch('VERIFY_AUTH');
                this.$notification['success']({
                  message: 'congratulations',
                  description: successTitle,
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
      const {form: {validateFields}, state, user} = this

      validateFields(['mobile'], {force: true}, (err, values) => {
        if (!err) {
          state.smsSendBtn = true
          const interval = window.setInterval(() => {
            if (state.time-- <= 0) {
              state.time = 120
              state.smsSendBtn = false
              window.clearInterval(interval)
            }
          }, 1000)
          const hide = this.$message.loading('Verification Code Sending...', 0)
          ApiService.post('user/send-otp', {emailOrMobile: values.mobile, name: user.name}).then(() => {
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
    requestFailed(err) {
      this.isLoginError = true
      this.isLoginErrorMessage = ((err.response || {}).data || {}).message || 'Something wrong';
    }
  },
  computed: {
    ...mapGetters({user: "currentUser"})
  }
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
