<template>
  <div>
    <TopInfo/>
    <div class="container">
      <div class="row justify-content-center my-5 py-4">
        <div class="col-md-4 col-lg-4 col-xl-4 col-sm-12 col-12">
          <div class="container text-center">
            <img src="@/assets/image/rfq_image.png" class="d-block mx-auto" width="100%" alt="rfq_image">
          </div>
        </div>
        <div class="col-md-4 col-lg-3 col-xl-3 col-sm-12 col-12">
          <a-form :form="form" @submit="handleSubmit" :hideRequiredMark="true">
            <a-form-item class="mb-1">
              <a-input placeholder="Please enter the product name.."
                       v-decorator="['product', { rules: [{ required: true, message: 'You can\'t leave this empty!' },
                       {max: 250,message: 'Maximum length was 250 character'}] }]"
              />
            </a-form-item>
            <a-form-item class="mb-1">
              <a-input placeholder="Enter your email address.."
                       v-decorator="['email', { rules: [{ required: true, message: 'You can\'t leave this empty!' },
                       {max: 50,message: 'Maximum length was 50 character'}, {type: 'email',message: 'The input is not valid E-mail!'}] }]"
              />
            </a-form-item>
            <a-row :gutter="16">
              <a-col class="gutter-row" :span="12">
                <a-form-item>
                  <a-input-number class="w-100" v-decorator="['quantity']" :min="1"
                                  :max="10000" placeholder="Quantity"/>
                </a-form-item>
              </a-col>
              <a-col class="gutter-row" :span="12">
                <a-form-item>
                  <a-select show-search placeholder="Select Unit" class="w-100" v-decorator="['unit_id']"
                            option-filter-prop="children" :filter-option="filterOption">
                    <a-select-option v-for="unit in unitList" :key="unit.id" :value="unit.id">
                      {{ unit.name }}
                    </a-select-option>
                  </a-select>
                </a-form-item>
              </a-col>
            </a-row>
            <a-form-item>
              <a-button type="danger" class="float-right" html-type="submit" :loading="submitBtn"
                        :disabled="submitBtn">
                Request for Quotation
              </a-button>
            </a-form-item>
          </a-form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import TopInfo from "@/components/helper/TopInfo";
import {mapActions, mapGetters} from "vuex";

export default {
  name: "Quotation",
  components: {TopInfo},
  data() {
    return {
      form: this.$form.createForm(this, {name: 'quotation'}),
      submitBtn: false,
    };
  },
  methods: {
    ...mapActions(['QUOTATION']),
    handleSubmit: function (e) {
      e.preventDefault();
      this.submitBtn = true
      this.form.validateFieldsAndScroll((err, values) => {
        if (!err) {
          this.QUOTATION(values)
              .then(() => {
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Quotation sent successfully.',
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
                this.submitBtn = false
                this.form.resetFields();
              })
        } else {
          setTimeout(() => {
            this.submitBtn = false
          }, 600)
        }
      })
    },
    filterOption(input, option) {
      return (
          option.componentOptions.children[0].text.toLowerCase().indexOf(input.toLowerCase()) >= 0
      );
    },
  },
  created() {
    if (!this.unitList.length > 0) this.$store.dispatch('UNIT_LIST');
  },
  computed: {
    ...mapGetters(["unitList"]),
  }
}
</script>

<style scoped>

</style>
