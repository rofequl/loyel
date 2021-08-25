<template>
  <a-modal
      :title="modalAdd? 'Add new question sub-category':'Question Sub-category information edit'"
      :okText="modalAdd? 'Submit':'Update'"
      :visible="visible"
      @ok="modalAdd? submitForm() : updateForm()"
      @cancel="cancelForm">
    <a-form-model ref="ruleForm" :model="form" :rules="rules"
                  @keydown="form.onKeydown($event)" :layout="'vertical'">

      <a-row :gutter="16">
        <a-col :md="24">
          <a-form-model-item ref="category_id" has-feedback="" prop="category_id"
                             label="Question Category Name:">
            <a-select show-search placeholder="Select Category" style="width: 100%"
                      option-filter-prop="children" :filter-option="filterOption" v-model="form.category_id">
              <a-select-option v-for="category in questionCategoryList" :key="category.id" :value="category.id">
                {{ category.name }}
              </a-select-option>
            </a-select>
          </a-form-model-item>
        </a-col>
        <a-col :md="24">
          <a-form-model-item ref="name" has-feedback="" prop="name"
                             label="Question Sub-category Name:">
            <a-input v-model="form.name" placeholder="Enter question sub-category name..."
                     @blur="() => {$refs.name.onFieldBlur();}"/>
          </a-form-model-item>
        </a-col>
      </a-row>


    </a-form-model>
  </a-modal>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "HelpSubcategoryAdd",
  data() {
    return {
      visible: false,
      modalAdd: true,
      form: new Form({
        id: '',
        name: '',
        category_id: undefined,
        slug: '',
      }),
      rules: {
        name: [
          {required: true, message: 'Question Sub-Category name is required', trigger: 'blur'},
          {max: 50, message: ' Question Sub-Category name maximum length 50 character', trigger: 'change'},
        ],
        category_id: [
          {required: true, message: 'Please select question category', trigger: 'blur'},
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
        this.modalAdd = false;
      }
      this.visible = true;
    },
    submitForm() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.visible = false;
          this.form.post('question-subcategory')
              .then(({data}) => {
                this.$store.commit('QUESTION_SUBCATEGORY_ADD', data);
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Question Sub-category add successfully.',
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
          this.form.put('question-subcategory/' + this.form.id)
              .then(({data}) => {
                this.$store.commit('QUESTION_SUBCATEGORY_MODIFY', data);
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Question Sub-category update successfully.',
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
    ...mapGetters(["questionCategoryList"])
  },
}
</script>

<style scoped>

</style>