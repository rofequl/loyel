<template>
  <CCard>
    <CCardHeader>
      {{ $t('setup.general.contact') }}
    </CCardHeader>
    <CCardBody>
      <a-form-model ref="ruleForm" :model="form" :rules="rules"
                    @submit.prevent="onSubmit()" @keydown="form.onKeydown($event)">
        <a-form-model-item ref="address" has-feedback="" :label="$t('setup.general.contactAddress')" prop="address" class="mb-0">
          <a-input
              v-model="form.address"
              @blur="() => {$refs.address.onFieldBlur();}"
          />
        </a-form-model-item>
        <a-form-model-item ref="phone" has-feedback="" :label="$t('setup.general.contactPhone')" prop="phone" class="mb-0">
          <a-input
              v-model="form.phone"
              @blur="() => {$refs.phone.onFieldBlur();}"
          />
        </a-form-model-item>
        <a-form-model-item ref="email" has-feedback="" :label="$t('setup.general.contactEmail')" prop="email" class="mb-0">
          <a-input
              v-model="form.email"
              @blur="() => {$refs.email.onFieldBlur();}"
          />
        </a-form-model-item>
        <a-form-model-item ref="working" has-feedback="" :label="$t('setup.general.contactWorking')" prop="working" class="mb-0">
          <a-input
              v-model="form.working"
              @blur="() => {$refs.working.onFieldBlur();}"
          />
        </a-form-model-item>
        <a-button htmlType="submit" type="primary" :loading="form.busy" class="float-right mt-3"
                  :disabled="form.busy">{{ $t('update') }}
        </a-button>
      </a-form-model>
    </CCardBody>
  </CCard>
</template>

<script>
import {mapGetters} from "vuex";
import {isEmptyObject} from "ant-design-vue/lib/vc-form/src/utils";

export default {
  name: "Contact",
  data() {
    return {
      form: new Form({
        address: '',
        phone: '',
        email: '',
        working: '',
      }),
      rules: {
        address: [
          {required: true, message: 'Please enter contact address', trigger: 'blur'},
          {max: 100, message: 'Contact address not more than 100 character', trigger: 'change'},
        ],
        phone: [
          {required: true, message: 'Please enter phone number', trigger: 'blur'},
          {max: 15, message: 'Phone number not more than 15 character', trigger: 'change'},
        ],
        email: [
          {required: true, message: 'Please enter email address', trigger: 'blur'},
          {max: 20, message: 'Email address not more than 20 character', trigger: 'change'},
          {type: 'email', message: 'The input is not valid E-mail', trigger: 'change'},
        ],
        working: [
          {required: true, message: 'Please enter working time', trigger: 'blur'},
          {max: 50, message: 'Working time not more than 50 character', trigger: 'change'},
        ],
      }
    }
  },
  methods: {
    onSubmit() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.form.post('contact-update')
              .then(({data}) => {
                this.$store.commit('SET_FOOTER_LIST', data.footer);
                this.$notification['success']({
                  message: 'congratulations',
                  description: 'Contact update successfully.',
                  style: {marginTop: '41px'},
                });
              })
              .catch(err => {
                this.$notification['error']({
                  message: 'Warning',
                  description: ((err.response || {}).data || {}).message || 'Something Wrong',
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
