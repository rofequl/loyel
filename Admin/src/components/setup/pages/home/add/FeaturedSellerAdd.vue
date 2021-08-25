<template>
  <a-modal
      title="Add new featured seller"
      okText="Submit"
      :visible="visible"
      :confirm-loading="confirmLoading"
      @ok="submitForm()"
      @cancel="cancelForm">
    <a-form-model ref="ruleForm" :model="form" :rules="rules"
                  @keydown="form.onKeydown($event)" :layout="'vertical'">

      <a-row :gutter="16">
        <a-col :md="24" :lg="14">
          <a-form-model-item ref="shop_id" has-feedback="" prop="shop_id"
                             label="Shop Name:">
            <a-select show-search placeholder="Select Shop" style="width: 100%"
                      option-filter-prop="children" :filter-option="filterOption" v-model="form.shop_id">

            </a-select>
          </a-form-model-item>
        </a-col>
        <a-col :md="24" :lg="10">
          <a-form-model-item label="Featured Banner: " prop="logo" help="Image size 900 X 400">
            <Image_upload v-model="form.banner"/>
          </a-form-model-item>
        </a-col>
      </a-row>
    </a-form-model>
  </a-modal>
</template>

<script>
import Image_upload from "@/components/helper/ImageUpload";

export default {
  name: "FeaturedSellerAdd",
  components: {Image_upload},
  data() {
    return {
      visible: false,
      confirmLoading: false,
      // eslint-disable-next-line no-undef
      form: new Form({
        shop_id: undefined,
        banner: '',
      }),
      rules: {
        banner: [
          {required: true, message: 'Please select the banner', trigger: 'blur'},
        ],
        shop_id: [
          {required: true, message: 'Please select the shop', trigger: 'blur'},
        ],
      }
    }
  },
  methods: {
    modal() {
      this.visible = true;
    },
    submitForm() {

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
  }
}
</script>

<style scoped>
>>> .ant-modal-mask, >>> .ant-modal-wrap {
  z-index: 1030 !important;
}
</style>