<template>
  <div class="text-dark">
    <h3 class="mb-4">Password Settings</h3>
    <a-form :form="form" class="login-form user-layout-login"
            @submit="handleSubmit">
      <a-alert class="antAlert" v-if="isLoginError" type="error" showIcon
               :message="isLoginErrorMessage"/>
      <a-row :gutter="16">
        <a-col :xs="24" :md="12">
          <a-form-item class="mb-2">
            <a-input-password
                placeholder="Enter your old password..."
                v-decorator="[
                'old_password',
                {rules: [{ required: true, message: 'Please enter your old password!' },{max: 20,message: 'Maximum length was 20 character'},
                {min: 6,message: 'Minimum length was 6 character'},]},
              ]">
              <a-icon slot="prefix" type="lock" :style="{ color: '#a3acb7' }"/>
            </a-input-password>
          </a-form-item>
          <a-form-item class="mb-2">
            <a-input-password
                placeholder="Enter your new password..."
                v-decorator="[
                'password',
                {rules: [{ required: true, message: 'Please enter your new password!' },{max: 20,message: 'Maximum length was 20 character'},
                {min: 6,message: 'Minimum length was 6 character'},{validator: validateToNextPassword}]},
              ]">
              <a-icon slot="prefix" type="lock" :style="{ color: '#a3acb7' }"/>
            </a-input-password>
          </a-form-item>
          <a-form-item class="mb-2">
            <a-input-password
                placeholder="Confirm your password..."
                @blur="handleConfirmBlur"
                v-decorator="[
                'confirm',
                {rules: [{ required: true, message: 'Please confirm your password!' },{validator: compareToFirstPassword}]},
              ]">
              <a-icon slot="prefix" type="lock" :style="{ color: '#a3acb7' }"/>
            </a-input-password>
          </a-form-item>
          <div class="form-group mt-4">
            <a-button html-type="submit" type="primary" class="float-right" :loading="loginBtn"
                      :disabled="loginBtn">Save Changes
            </a-button>
          </div>
        </a-col>
      </a-row>
    </a-form>
  </div>
</template>

<script>
import ApiService from "@/core/services/api.service";

export default {
  name: "Password",
  data() {
    return {
      form: this.$form.createForm(this, {name: 'coordinated'}),
      loginBtn: false,
      isLoginError: false,
      isLoginErrorMessage: '',
    };
  },
  methods: {
    compareToFirstPassword(rule, value, callback) {
      const form = this.form;
      if (value && value !== form.getFieldValue('password')) {
        callback('Two passwords that you enter is inconsistent!');
      } else {
        callback();
      }
    },
    validateToNextPassword(rule, value, callback) {
      const form = this.form;
      if (value && this.confirmDirty) {
        form.validateFields(['confirm'], {force: true});
      }
      callback();
    },
    handleConfirmBlur(e) {
      const value = e.target.value;
      this.confirmDirty = this.confirmDirty || !!value;
    },
    handleSubmit: function (e) {
      e.preventDefault();
      this.loginBtn = true;
      this.isLoginError = false;
      this.form.validateFieldsAndScroll((err, values) => {
        if (!err) {
          ApiService.post("user/password-change", values)
              .then(() => {
                this.$notification['success']({
                  message: 'congratulations',
                  description: 'Your password change successfully.',
                  style: {marginTop: '65px'},
                });
              })
              .catch(err => this.requestFailed(err))
              .finally(() => {
                this.loginBtn = false
                this.form.resetFields();
              })
        } else {
          setTimeout(() => {
            this.loginBtn = false
          }, 600)
        }
      })
    },
    requestFailed(err) {
      this.isLoginError = true
      this.isLoginErrorMessage = ((err.response || {}).data || {}).old_password || 'Invalid credentials';
    }
  }
}
</script>

<style scoped>

</style>