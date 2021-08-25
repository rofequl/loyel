<template>
  <a-card class="user-details mt-3" :body-style="{padding: '4px'}">
    <div class="user-account">
      <div class="account-header">
        <h4 class="pb-2">Social Media Link
          <div class="float-right">
            <a-switch checked-children="Yes" un-checked-children="No" v-model="form.social"/>
          </div>
        </h4>
      </div>
      <a-form-model v-if="form.social" class="pt-3 pb-4" ref="ruleForm" :model="form" :rules="rules" layout="vertical"
                    @submit.prevent="onSubmit()"
                    @keydown="form.onKeydown($event)" :hideRequiredMark="true">
        <a-row :gutter="16">
          <a-col class="gutter-row" :span="12">
            <a-input class="mb-3" placeholder="https://www.facebook.com" v-model="form.facebook" max="30">
              <a-icon slot="addonBefore" type="facebook"/>
            </a-input>
          </a-col>
          <a-col class="gutter-row" :span="12">
            <a-input class="mb-3" placeholder="https://www.twitter.com" v-model="form.twitter" max="30">
              <a-icon slot="addonBefore" type="twitter"/>
            </a-input>
          </a-col>
          <a-col class="gutter-row" :span="12">
            <a-input class="mb-3" placeholder="https://www.youtube.com" v-model="form.youtube" max="30">
              <a-icon slot="addonBefore" type="youtube"/>
            </a-input>
          </a-col>
          <a-col class="gutter-row" :span="12">
            <a-input class="mb-3" placeholder="https://www.instagram.com" v-model="form.insta" max="30">
              <a-icon slot="addonBefore" type="instagram"/>
            </a-input>
          </a-col>
        </a-row>
        <a-button htmlType="submit" type="primary" :loading="form.busy" class="float-right mt-1"
                  :disabled="form.busy">{{ $t('update') }}
        </a-button>
        <div class="clearfix"></div>
      </a-form-model>
    </div>
  </a-card>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "SocialDetails",
  data() {
    return {
      form: new Form({
        social: true,
        facebook: '',
        twitter: '',
        youtube: '',
        insta: '',
      }),
      rules: {}
    }
  },
  methods: {
    onSubmit() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.form.post('store-social-update')
              .then(() => {
                this.$notification['success']({
                  message: 'congratulations',
                  description: 'Social Media Link update successfully.',
                  style: {marginTop: '200px'},
                });
                this.$store.dispatch('VERIFY_AUTH');
                this.profile = false;
              })
              .catch(err => {
                this.$notification['error']({
                  message: 'Warning',
                  description: ((err.response || {}).data || {}).message || 'Something Wrong',
                  style: {marginTop: '200px'},
                  duration: 5
                })
              })
        } else {
          return false;
        }
      });
    },
  },
  created() {
    this.form.fill(this.store);
    this.form.social = this.store.social !== 0;
  },
  watch: {
    store: function () {
      this.form.fill(this.store);
      this.form.social = this.store.social !== 0;
    },
  },
  computed: {
    ...mapGetters({store: "userStore"})
  }
}
</script>

<style scoped>

</style>
