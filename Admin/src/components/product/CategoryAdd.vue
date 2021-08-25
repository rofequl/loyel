<template>
  <a-modal
      :title="modalAdd? 'Add new category':'Category information edit'"
      :okText="modalAdd? 'Submit':'Update'"
      :visible="visible"
      :confirm-loading="confirmLoading"
      @ok="modalAdd? submitForm() : updateForm()"
      @cancel="cancelForm">
    <a-form-model ref="ruleForm" :model="form" :rules="rules"
                  @keydown="form.onKeydown($event)" :layout="'vertical'">

      <a-row :gutter="16">
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="name" has-feedback="" prop="name"
                             label="Category Name:">
            <a-input v-model="form.name" placeholder="Enter category name..."
                     @blur="() => {$refs.name.onFieldBlur();}"/>
          </a-form-model-item>
        </a-col>
        <a-col v-if="isBangla" :md="24" :lg="12">
          <a-form-model-item ref="name_bd" has-feedback="" prop="name_bd"
                             label="বিভাগ নাম:">
            <a-input v-model="form.name_bd" placeholder="বিভাগের নাম লিখুন ..."
                     @blur="() => {$refs.name_bd.onFieldBlur();}"/>
          </a-form-model-item>
        </a-col>
        <a-col :md="24" :lg="12">
          <a-form-model-item label="Category Banner: " prop="banner" help="Image size 300 X 300">
            <Image_upload v-model="form.banner"/>
          </a-form-model-item>
        </a-col>
        <a-col :md="24" :lg="12">
          <a-form-model-item label="Category Icon: " prop="icon" help="Image size 100 X 100">
            <Image_upload v-model="form.icon"/>
          </a-form-model-item>
        </a-col>
      </a-row>


    </a-form-model>
  </a-modal>
</template>

<script>
import Image_upload from "@/components/helper/ImageUpload";
import {mapGetters} from "vuex";
export default {
  name: "CategoryAdd",
  data() {
    return {
      visible: false,
      modalAdd: true,
      confirmLoading: false,
      form: new Form({
        id: '',
        name: '',
        name_bd: '',
        slug: '',
        banner: '',
        icon: '',
      }),
      rules: {
        name: [
          {required: true, message: 'Category name is required', trigger: 'blur'},
          {max: 50, message: 'Category name maximum length 50 character', trigger: 'change'},
        ],
        name_bd: [
          {required: true, message: 'বিভাগের নাম আবশ্যক', trigger: 'blur'},
          {max: 100, message: 'বিভাগের নাম সর্বাধিক দৈর্ঘ্য 100 অক্ষর', trigger: 'change'},
        ],
        banner: [
          {required: true, message: 'Please select banner image', trigger: 'blur'},
        ],
        icon: [
          {required: true, message: 'Please select category icon', trigger: 'blur'},
        ],
      }
    };
  },
  methods: {
    modal(e) {
      if (!e) {
        this.modalAdd = true;
      } else {
        this.form.fill(e);
        this.form.banner = this.showImage(e.banner)
        this.form.icon = this.showImage(e.icon)
        this.modalAdd = false;
      }
      this.visible = true;
    },
    submitForm() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.visible = false;
          this.form.post('category')
              .then(({data}) => {
                this.$store.commit('CATEGORY_ADD', data);
                this.$refs.ruleForm.resetFields();
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Category add successfully.',
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
          this.form.put('category/' + this.form.id)
              .then(({data}) => {
                this.$store.commit('CATEGORY_MODIFY', data);
                this.$refs.ruleForm.resetFields();
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Category update successfully.',
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
  computed: {
    ...mapGetters(["isBangla"])
  },
}
</script>

<style scoped>
>>> .ant-modal-mask, >>> .ant-modal-wrap {
  z-index: 1030 !important;
}
</style>
