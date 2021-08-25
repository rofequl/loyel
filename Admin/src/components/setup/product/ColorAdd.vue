<template>
  <a-modal
      :title="modalAdd? 'Add new Colour':'Colour information edit'"
      :okText="modalAdd? 'Submit':'Update'"
      :visible="visible"
      :confirm-loading="confirmLoading"
      @ok="modalAdd? submitForm() : updateForm()"
      @cancel="cancelForm">
    <a-form-model ref="ruleForm" :model="form" :rules="rules"
                  @keydown="form.onKeydown($event)" :layout="'vertical'">

      <a-row :gutter="16">
        <a-col :md="12">
          <a-form-model-item ref="name" has-feedback="" prop="name"
                             label="Colour Name:">
            <a-input v-model="form.name" placeholder="Enter colour name..."
                     @blur="() => {$refs.name.onFieldBlur();}"/>
          </a-form-model-item>
        </a-col>
        <a-col :md="12">
          <a-form-model-item ref="code" has-feedback="" prop="code"
                             label="Colour Code:">
            <a-input v-model="form.code" placeholder="Enter colour code..."
                     @blur="() => {$refs.code.onFieldBlur();}"/>
          </a-form-model-item>
        </a-col>
      </a-row>
    </a-form-model>
  </a-modal>
</template>

<script>
export default {
  name: "ColorAdd",
  data() {
    return {
      visible: false,
      modalAdd: true,
      confirmLoading: false,
      form: new Form({
        id: '',
        name: '',
        code: '',
      }),
      rules: {
        name: [
          {required: true, message: 'Colour name is required', trigger: 'blur'},
          {max: 50, message: 'Colour name maximum length 50 character', trigger: 'change'},
        ],
        code: [
          {required: true, message: 'Code is required', trigger: 'blur'},
          {max: 8, message: 'Code maximum length 8 character', trigger: 'change'},
        ]
      }
    };
  },
  methods: {
    modal(e) {
      if (!e) {
        this.modalAdd = true;
      } else {
        this.form.fill(e);
        this.modalAdd = false;
      }
      this.visible = true;
    },
    submitForm() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.visible = false;
          this.form.post('color')
              .then(({data}) => {
                this.$store.commit('COLOR_ADD', data);
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Colour add successfully.',
                  style: {marginTop: '41px'},
                  duration: 4
                });
              })
              .catch(err => {
                this.$notification['error']({
                  message: 'Warning',
                  description: ((err.response || {}).data || {}).name || 'Something Wrong',
                  style: {marginTop: '41px'},
                  duration: 4
                })
              })
              .finally(() => {
                this.$refs.ruleForm.resetFields()
              });
        } else {
          return false;
        }
      });
    },
    updateForm() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.visible = false;
          this.form.put('color/' + this.form.id)
              .then(({data}) => {
                this.$store.commit('COLOR_MODIFY', data);
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Colour update successfully.',
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
              .finally(() => {
                this.$refs.ruleForm.resetFields()
                this.form.reset()
              });
        } else {
          return false;
        }
      });
    },
    cancelForm() {
      this.$refs.ruleForm.resetFields()
      this.form.reset()
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
