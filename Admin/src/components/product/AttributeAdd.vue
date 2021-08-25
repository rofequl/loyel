<template>
  <a-modal
      :title="modalAdd? 'Add new Attribute':'Attribute information edit'"
      :okText="modalAdd? 'Submit':'Update'"
      :visible="visible"
      :confirm-loading="confirmLoading"
      @ok="modalAdd? submitForm() : updateForm()"
      @cancel="cancelForm">
    <a-form-model ref="ruleForm" :model="form" :rules="rules"
                  @keydown="form.onKeydown($event)" :layout="'vertical'">

      <a-row :gutter="16">
        <a-col :md="24">
          <a-form-model-item ref="name" has-feedback="" prop="name"
                             label="Attribute Name:">
            <a-input v-model="form.name" placeholder="Enter Attribute name..."
                     @blur="() => {$refs.name.onFieldBlur();}"/>
          </a-form-model-item>
        </a-col>
        <a-col :md="24">
          <label class="mb-2" for="tags-basic">Attribute Value: </label>
          <b-form-tags :input-id="'tags-basic'" tag-pills v-model="form.value" separator=",;"
                       placeholder="Attribute value..."></b-form-tags>
        </a-col>
      </a-row>
    </a-form-model>
  </a-modal>
</template>

<script>
export default {
  props: ['position', 'catValue'],
  name: "AttributeAdd",
  data() {
    return {
      visible: false,
      modalAdd: true,
      confirmLoading: false,
      form: new Form({
        id: '',
        name: '',
        value: [],
      }),
      rules: {
        name: [
          {required: true, message: 'Attribute name is required', trigger: 'blur'},
          {max: 50, message: 'Attribute name maximum length 50 character', trigger: 'change'},
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
          this.form.post('attribute/' + this.position + '/' + this.catValue)
              .then(({data}) => {
                this.$store.commit('ATTRIBUTE_ADD', data);
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Attribute add successfully.',
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
    updateForm() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.visible = false;
          this.form.put('attribute/' + this.form.id)
              .then(({data}) => {
                this.$store.commit('ATTRIBUTE_MODIFY', data);
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Attribute update successfully.',
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

>>> .form-control:focus {
  border-color: #d8dbe0 !important;
  box-shadow: none !important;
}

>>> .b-form-tags .focus {
  border-color: #d8dbe0 !important;
  box-shadow: none !important;
}
</style>
