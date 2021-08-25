<template>
  <a-modal
      :title="modalAdd? 'Add new question category':'Question category information edit'"
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
                             label="Question Category Name:">
            <a-input v-model="form.name" placeholder="Enter question category name..."
                     @blur="() => {$refs.name.onFieldBlur();}"/>
          </a-form-model-item>
        </a-col>
        <a-col :md="24">
          <a-form-model-item label="Question Category Logo: " prop="icon" help="Image size 500 X 500">
            <Image_upload v-model="form.icon"/>
          </a-form-model-item>
        </a-col>
      </a-row>


    </a-form-model>
  </a-modal>
</template>

<script>
import Image_upload from "@/components/helper/ImageUpload";

export default {
  name: "HelpCategoryAdd",
  data() {
    return {
      visible: false,
      modalAdd: true,
      confirmLoading: false,
      form: new Form({
        id: '',
        name: '',
        slug: '',
        icon: '',
      }),
      rules: {
        name: [
          {required: true, message: 'Question category name is required', trigger: 'blur'},
          {max: 50, message: 'Question category name maximum length 50 character', trigger: 'change'},
        ],
        icon: [
          {required: true, message: 'Please select question category icon', trigger: 'blur'},
        ],
      }
    };
  },
  methods: {
    modal(e) {
      if (!e) {
        this.form.reset()
        this.modalAdd = true;
      } else {
        this.form.fill(e);
        this.form.icon = this.showImage(e.icon)
        this.modalAdd = false;
      }
      this.visible = true;
    },
    submitForm() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.visible = false;
          this.form.post('question-category')
              .then(({data}) => {
                this.$store.commit('QUESTION_CATEGORY_ADD', data);
                this.$refs.ruleForm.resetFields();
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Question category add successfully.',
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
    updateForm() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.visible = false;
          this.form.put('question-category/' + this.form.id)
              .then(({data}) => {
                this.$store.commit('QUESTION_CATEGORY_MODIFY', data);
                this.$refs.ruleForm.resetFields();
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Question category update successfully.',
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
  components: {Image_upload},
}
</script>

<style scoped>

</style>