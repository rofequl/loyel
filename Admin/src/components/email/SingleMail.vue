<template>
  <a-modal
      title="Send a Mail"
      okText="Send Mail"
      :visible="visible"
      :confirm-loading="confirmLoading"
      @ok="submitForm()"
      @cancel="cancelForm">
    <a-form-model ref="ruleForm" :model="form" :rules="rules" :label-col="labelCol" :wrapper-col="wrapperCol"
                  @keydown="form.onKeydown($event)">
      <a-form-model-item label="Email Address">
        <a-input v-model="form.email" disabled />
      </a-form-model-item>
      <a-form-model-item label="Email Subject">
        <a-input v-model="form.subject" />
      </a-form-model-item>


    </a-form-model>
  </a-modal>
</template>

<script>
export default {
  name: "SingleMail",
  data() {
    return {
      labelCol: { span: 6 },
      wrapperCol: { span: 16 },
      visible: false,
      confirmLoading: false,
      form: new Form({
        id: '',
        email: '',
        subject: '',
        message: '',
      }),
      rules: {
        subject: [
          {required: true, message: 'Mail subject are required', trigger: 'blur'},
          {max: 50, message: 'Mail subject maximum length 50 character', trigger: 'change'},
        ],
        message: [
          {required: true, message: 'Message are required', trigger: 'blur'},
        ],
      }
    };
  },
  methods: {
    modal(e) {
      this.visible = true;
      this.form.email = e;
    },
    submitForm() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.visible = false;
          this.form.post('brand')
              .then(({data}) => {
                this.$store.commit('BRAND_ADD', data);
                this.$refs.ruleForm.resetFields();
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Brand add successfully.',
                  style: {marginTop: '41px'},
                  duration: 4
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
    cancelForm() {
      this.$refs.ruleForm.resetFields();
      this.visible = false;
    },
  },
}
</script>

<style scoped>
>>> .ant-modal-mask, >>> .ant-modal-wrap {
  z-index: 1030 !important;
}
</style>
