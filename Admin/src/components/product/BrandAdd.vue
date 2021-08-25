<template>
  <a-modal
      :title="modalAdd? 'Add new brand':'brand information edit'"
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
                             label="Brand Name:">
            <a-input v-model="form.name" placeholder="Enter brand name..."
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
          <a-form-model-item label="Brand Logo: " prop="logo" help="Image size 500 X 500">
            <Image_upload v-model="form.logo"/>
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
  name: "BrandAdd",
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
        logo: '',
      }),
      rules: {
        name: [
          {required: true, message: 'Brand name is required', trigger: 'blur'},
          {max: 50, message: 'Brand name maximum length 50 character', trigger: 'change'},
        ],
        name_bd: [
          {required: true, message: 'বিভাগের নাম আবশ্যক', trigger: 'blur'},
          {max: 100, message: 'বিভাগের নাম সর্বাধিক দৈর্ঘ্য 100 অক্ষর', trigger: 'change'},
        ],
        logo: [
          {required: true, message: 'Please select brand logo', trigger: 'blur'},
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
        this.form.logo = this.showImage(e.logo)
        this.modalAdd = false;
      }
      this.visible = true;
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
    updateForm() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.visible = false;
          this.form.put('brand/' + this.form.id)
              .then(({data}) => {
                this.$store.commit('BRAND_MODIFY', data);
                this.$refs.ruleForm.resetFields();
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Brand update successfully.',
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
