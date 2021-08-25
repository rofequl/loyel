<template>
  <a-modal
      :title="modalAdd? 'Add new question':'Question information edit'"
      :okText="modalAdd? 'Submit':'Update'"
      :visible="visible" :width="720"
      @ok="modalAdd? submitForm() : updateForm()"
      @cancel="cancelForm">
    <a-form-model ref="ruleForm" :model="form" :rules="rules" :hide-required-mark="true"
                  @keydown="form.onKeydown($event)" :layout="'vertical'">

      <a-row :gutter="16">
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="category_id" has-feedback="" prop="category_id"
                             label="Question Category:">
            <a-select show-search placeholder="Select Category" style="width: 100%" @change="categoryChange"
                      option-filter-prop="children" :filter-option="filterOption" v-model="form.category_id">
              <a-select-option v-for="category in questionCategoryList" :key="category.id" :value="category.id">
                {{ category.name }}
              </a-select-option>
            </a-select>
          </a-form-model-item>
        </a-col>
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="category_id" has-feedback="" prop="subcategory_id"
                             label="Question Subcategory:">
            <a-select show-search placeholder="Select Subcategory" style="width: 100%"
                      option-filter-prop="children" :filter-option="filterOption" v-model="form.subcategory_id">
              <a-select-option v-for="subcategory in subcategories" :key="subcategory.id" :value="subcategory.id">
                {{ subcategory.name }}
              </a-select-option>
            </a-select>
          </a-form-model-item>
        </a-col>
        <a-col :md="24">
          <a-form-model-item ref="question" has-feedback="" prop="question"
                             label="Question:">
            <a-input v-model="form.question" placeholder="Type your question..."
                     @blur="() => {$refs.question.onFieldBlur();}"/>
          </a-form-model-item>
        </a-col>
        <a-col :md="24">
          <a-form-model-item ref="answer" prop="answer"
                             label="Type your Answer:">
            <vue-editor v-model="form.answer"/>
          </a-form-model-item>
        </a-col>
      </a-row>


    </a-form-model>
  </a-modal>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "QuestionAdd",
  data() {
    return {
      visible: false,
      modalAdd: true,
      form: new Form({
        id: '',
        question: '',
        category_id: undefined,
        subcategory_id: undefined,
        answer: '',
        slug: '',
      }),
      subcategories: [],
      rules: {
        question: [
          {required: true, message: 'Question is required', trigger: 'blur'},
          {max: 250, message: ' Question maximum length 250 character', trigger: 'change'},
        ],
        category_id: [
          {required: true, message: 'Please select question category', trigger: 'blur'},
        ],
        subcategory_id: [
          {required: true, message: 'Please select question subcategory', trigger: 'blur'},
        ],
      }
    };
  },
  methods: {
    modal(e) {
      if (!e) {
        this.form.reset();
        this.modalAdd = true;
      } else {
        this.form.fill(e);
        this.subcategories = this.questionSubcategoryById(e.category_id)
        this.modalAdd = false;
      }
      this.visible = true;
    },
    categoryChange(value) {
      this.form.subcategory_id = undefined;
      this.subcategories = this.questionSubcategoryById(value);
    },
    submitForm() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.visible = false;
          this.form.post('question')
              .then(({data}) => {
                this.$store.commit('QUESTION_ADD', data);
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Question add successfully.',
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
                this.$refs.ruleForm.resetFields();
                this.form.reset();
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
          this.form.put('question/' + this.form.id)
              .then(({data}) => {
                this.$store.commit('QUESTION_MODIFY', data);
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Question update successfully.',
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
                this.$refs.ruleForm.resetFields();
                this.form.reset();
              });
        } else {
          return false;
        }
      });
    },
    cancelForm() {
      this.$refs.ruleForm.resetFields();
      this.visible = false;
    },
    filterOption(input, option) {
      return (
          option.componentOptions.children[0].text.toLowerCase().indexOf(input.toLowerCase()) >= 0
      );
    },
  },
  computed: {
    ...mapGetters(["questionCategoryList", "questionSubcategoryById"])
  },
}
</script>

<style scoped>
>>> .ant-modal-mask, >>> .ant-modal-wrap {
  z-index: 1030 !important;
}
</style>