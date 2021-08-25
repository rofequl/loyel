<template>
  <a-modal :zIndex="1030" :visible="visible" :centered="true" :closable="false" :footer="null">
    <a-form-model ref="ruleForm" :model="form" :rules="rules"
                  @submit.prevent="onSubmit()" @keydown="form.onKeydown($event)">
      <a-form-model-item ref="value" has-feedback="" label="" prop="value">
      <a-input v-model="form.value" :placeholder="'Please enter '+ this.form.name +' value...'"/>
      </a-form-model-item>
      <div class="mt-4">
        <a-button class="float-right" @click="cancelForm">Close</a-button>
        <a-button class="float-right mr-3" htmlType="submit" type="primary" :loading="form.busy"
                  :disabled="form.busy">Save</a-button>
      </div>
      <div class="clearfix"></div>
    </a-form-model>
  </a-modal>
</template>

<script>
export default {
  props: ['position', 'catValue'],
  name: "AttributeValue",
  data() {
    return {
      visible: false,
      form: new Form({
        name: '',
        value: '',
      }),
      rules: {
        value: [
          {required: true, message: 'Input field required', trigger: 'blur'},
          {max: 50, message: 'Value maximum length 50 character', trigger: 'change'},
        ],
      }
    }
  },
  methods: {
    modal(e) {
      this.form.name = e;
      this.visible = true;
    },
    onSubmit() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.visible = false;
          this.form.post('attribute-update/' + this.position + '/' + this.catValue)
              .then(({data}) => {
                this.$store.commit('ATTRIBUTE_MODIFY', data);
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Attribute value add successfully.',
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
      this.form.reset()
      this.visible = false;
    },
  }
}
</script>

<style scoped>

</style>
