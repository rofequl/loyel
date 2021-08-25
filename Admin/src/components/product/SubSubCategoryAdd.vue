<template>
  <a-modal
      :title="modalAdd? 'Add new sub-Subcategory':'Sub-Subcategory information edit'"
      :okText="modalAdd? 'Submit':'Update'"
      :visible="visible"
      :confirm-loading="confirmLoading"
      @ok="modalAdd? submitForm() : updateForm()"
      @cancel="cancelForm">
    <a-form-model ref="ruleForm" :model="form" :rules="rules"
                  @keydown="form.onKeydown($event)" :layout="'vertical'">

      <a-row :gutter="16">
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="category_id" has-feedback="" prop="category_id"
                             label="Category Name:">
            <a-select show-search placeholder="Select Category" style="width: 100%" @change="categoryChange"
                      option-filter-prop="children" :filter-option="filterOption" v-model="form.category_id">
              <a-select-option v-for="category in categoryList" :key="category.id" :value="category.id">
                {{ category.name }}
              </a-select-option>
            </a-select>
          </a-form-model-item>
        </a-col>
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="subcategory_id" has-feedback="" prop="subcategory_id"
                             label="Sub Category Name:">
            <a-select show-search placeholder="Select Category" style="width: 100%"
                      option-filter-prop="children" :filter-option="filterOption" v-model="form.subcategory_id">
              <a-select-option v-for="subcategory in subcategories" :key="subcategory.id" :value="subcategory.id">
                {{ subcategory.name }}
              </a-select-option>
            </a-select>
          </a-form-model-item>
        </a-col>
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="name" has-feedback="" prop="name"
                             label="Sub-Subcategory Name:">
            <a-input v-model="form.name" placeholder="Enter sub-category name..."
                     @blur="() => {$refs.name.onFieldBlur();}"/>
          </a-form-model-item>
        </a-col>
        <a-col v-if="isBangla" :md="24" :lg="12">
          <a-form-model-item ref="name_bd" has-feedback="" prop="name_bd"
                             label="উপ-উপশ্রেণীর নাম:">
            <a-input v-model="form.name_bd" placeholder="উপ-উপশ্রেণীর নাম লিখুন ..."
                     @blur="() => {$refs.name_bd.onFieldBlur();}"/>
          </a-form-model-item>
        </a-col>
      </a-row>


    </a-form-model>
  </a-modal>
</template>

<script>
import {mapGetters} from "vuex";
export default {
  name: "SubSubCategoryAdd",
  data() {
    return {
      visible: false,
      modalAdd: true,
      confirmLoading: false,
      form: new Form({
        id: '',
        name: '',
        name_bd: '',
        category_id: undefined,
        subcategory_id: undefined,
        slug: '',
      }),
      subcategories: [],
      rules: {
        name: [
          {required: true, message: 'Sub-Subcategory name is required', trigger: 'blur'},
          {max: 50, message: 'Sub-Subcategory name maximum length 50 character', trigger: 'change'},
        ],
        name_bd: [
          {required: true, message: 'উপ-উপশ্রেণীর নাম আবশ্যক', trigger: 'blur'},
          {max: 100, message: 'উপ-উপশ্রেণীর নাম সর্বাধিক দৈর্ঘ্য 100 অক্ষর', trigger: 'change'},
        ],
        category_id: [
          {required: true, message: 'Please select category', trigger: 'blur'},
        ],
        subcategory_id: [
          {required: true, message: 'Please select subcategory', trigger: 'blur'},
        ],
      }
    };
  },
  methods: {
    modal(e) {
      this.form.reset();
      if (!e) {
        this.modalAdd = true;
      } else {
        this.form.fill(e);
        this.categoryChange(e.category_id)
        this.form.subcategory_id = e.subcategory_id;
        this.modalAdd = false;
      }
      this.visible = true;
    },
    categoryChange(value) {
      this.form.subcategory_id = undefined;
      this.subcategories = this.subcategoryById(value);
    },
    submitForm() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.visible = false;
          this.form.post('subsubcategory')
              .then(({data}) => {
                this.$store.commit('SUBSUBCATEGORY_ADD', data);
                this.$refs.ruleForm.resetFields();
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Sub-Subcategory add successfully.',
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
          this.form.put('subsubcategory/' + this.form.id)
              .then(({data}) => {
                this.$store.commit('SUBSUBCATEGORY_MODIFY', data);
                this.$refs.ruleForm.resetFields();
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Sub-subcategory update successfully.',
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
    filterOption(input, option) {
      return (
          option.componentOptions.children[0].text.toLowerCase().indexOf(input.toLowerCase()) >= 0
      );
    },
  },
  created() {
    if (!this.categoryList.length > 0) this.$store.dispatch('CATEGORY_LIST');
    if (!this.subcategoryList.length > 0) this.$store.dispatch('SUBCATEGORY_LIST');
  },
  computed: {
    ...mapGetters(["isBangla", "categoryList", "subcategoryList", "subcategoryById"])
  },
}
</script>

<style scoped>
>>> .ant-modal-mask, >>> .ant-modal-wrap {
  z-index: 1030 !important;
}
</style>
