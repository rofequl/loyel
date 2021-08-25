<template>
  <div>
    <a-form-model ref="ruleForm" :model="form" :rules="rules"
                  @submit.prevent="onSubmit()" @keydown="form.onKeydown($event)">
      <a-form-model-item ref="description" :label="$t('setup.general.footerDescription')" prop="description">
        <vue-editor v-model="form.description" :editor-toolbar="descriptionToolbar" class="custop-editor"/>
      </a-form-model-item>
      <a-form-model-item ref="copyright" :label="$t('setup.general.footerCopyright')" prop="copyright">
        <vue-editor v-model="form.copyright" :editor-toolbar="copyrightToolbar" class="custop-editor"/>
      </a-form-model-item>
      <a-form-model-item :label-col="{lg: {span: 8}, sm: {span: 12}}" labelAlign="left"
                         :wrapper-col="{lg: {span: 12}, sm: {span: 12}}" :label="$t('setup.general.footerSocial')">
        <a-switch checked-children="Yes" un-checked-children="No" v-model="form.social"/>
      </a-form-model-item>
      <div v-if="form.social">
        <a-input class="mb-3" placeholder="https://www.facebook.com" v-model="form.facebook" max="30">
          <a-icon slot="addonBefore" type="facebook"/>
        </a-input>
        <a-input class="mb-3" placeholder="https://www.twitter.com" v-model="form.twitter" max="30">
          <a-icon slot="addonBefore" type="twitter"/>
        </a-input>
        <a-input class="mb-3" placeholder="https://www.youtube.com" v-model="form.youtube" max="30">
          <a-icon slot="addonBefore" type="youtube"/>
        </a-input>
        <a-input class="mb-3" placeholder="https://www.instagram.com" v-model="form.insta" max="30">
          <a-icon slot="addonBefore" type="instagram"/>
        </a-input>
      </div>

      <a-button htmlType="submit" type="primary" :loading="form.busy" class="float-right mt-5"
                :disabled="form.busy">{{ $t('update') }}
      </a-button>
    </a-form-model>
  </div>
</template>

<script>
import {mapGetters} from "vuex";
import {isEmptyObject} from "ant-design-vue/lib/vc-form/src/utils";

export default {
  name: "Footer",
  data() {
    return {
      descriptionToolbar: [
        ["bold", "italic", "underline", {color: []}],
        [{list: "ordered"}, {list: "bullet"}],
      ],
      copyrightToolbar: [
        ["bold", "italic", "underline", {color: []}, "link"],
      ],
      form: new Form({
        description: '',
        copyright: '',
        social: false,
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
          this.form.post('footer-update')
              .then(({data}) => {
                this.$store.commit('SET_FOOTER_LIST', data.footer);
                this.$notification['success']({
                  message: 'congratulations',
                  description: 'Website footer update successfully.',
                  style: {marginTop: '41px'},
                });
              })
              .catch(err => {
                let obj = (err.response || {}).data || {};
                this.$notification['error']({
                  message: 'Warning',
                  description: obj[Object.keys(obj)[0]][0] || 'Something Wrong',
                  style: {marginTop: '41px'},
                  duration: 4
                })
              })
        } else {
          return false;
        }
      });
    },
    loadData() {
      if (!isEmptyObject(this.footerList)) {
        this.form.fill(this.footerList);
        this.form.social = this.footerList.social !== 0;
      }
    },
  },
  created() {
    this.loadData();
  },
  watch: {
    footerList: function () {
      this.loadData();
    }
  },
  computed: {
    ...mapGetters(["footerList"])
  },
}
</script>

<style scoped>

</style>
