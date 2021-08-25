<template>
  <a-modal
      :title="modalAdd? 'Add new staffs':'Staffs information edit'"
      :okText="modalAdd? 'Submit':'Update'"
      :visible="visible"
      :confirm-loading="confirmLoading"
      :width="700" :zIndex="1030 "
      @ok="modalAdd? submitForm() : updateForm()"
      @cancel="cancelForm">
    <a-form-model ref="ruleForm" :model="form" :rules="rules"
                  @keydown="form.onKeydown($event)" :layout="'vertical'" :hideRequiredMark="true">

      <a-row :gutter="16">
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="name" has-feedback="" prop="name"
                             label="First and Last Name:">
            <a-input v-model="form.name" placeholder="Enter staff first and last name"
                     @blur="() => {$refs.name.onFieldBlur();}">
              <a-icon slot="prefix" type="user"/>
            </a-input>
          </a-form-model-item>
        </a-col>
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="email" prop="email"
                             label="Email Id:">
            <a-input v-model="form.email" placeholder="Enter staff email id"
                     @blur="() => {$refs.email.onFieldBlur();}" type="email">
              <a-icon slot="prefix" type="mail"/>
            </a-input>
          </a-form-model-item>
        </a-col>
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="mobile" prop="mobile"
                             label="Phone Number:">
            <a-input v-model="form.mobile" placeholder="Enter staff phone number"
                     @blur="() => {$refs.mobile.onFieldBlur();}">
              <a-icon slot="prefix" type="phone"/>
            </a-input>
          </a-form-model-item>
        </a-col>
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="address" prop="address"
                             label="Address:">
            <a-input v-model="form.address" placeholder="Enter staff address"
                     @blur="() => {$refs.address.onFieldBlur();}">
              <a-icon slot="prefix" type="environment"/>
            </a-input>
          </a-form-model-item>
        </a-col>
        <a-col :md="24" :lg="12">
          <a-form-model-item label="Staff Designation:">
            <a-select placeholder="Select Designation" style="width: 100%" v-model="form.designation">
              <a-select-option value="Director of eCommerce">
                Director of eCommerce
              </a-select-option>
              <a-select-option value="Web Developer">
                Web Developer
              </a-select-option>
              <a-select-option value="Digital Operations Manager">
                Digital Operations Manager
              </a-select-option>
              <a-select-option value="IT Technician">
                IT Technician
              </a-select-option>
              <a-select-option value="Logistics Manager">
                Logistics Manager
              </a-select-option>
              <a-select-option value="Inventory Manager">
                Inventory Manager
              </a-select-option>
              <a-select-option value="Digital Marketing Manager">
                Digital Marketing Manager
              </a-select-option>
              <a-select-option value="Customer Service Representatives">
                Customer Service Representatives
              </a-select-option>
              <a-select-option value="Finance and Accounting">
                Finance and Accounting
              </a-select-option>
              <a-select-option value="Business Analyst">
                Business Analyst
              </a-select-option>
            </a-select>
          </a-form-model-item>
        </a-col>
        <a-col :md="24" :lg="12">
          <a-form-model-item label="Staff Picture: " prop="photo" help="Image size 500 X 500">
            <image-upload v-model="form.photo"/>
          </a-form-model-item>
        </a-col>

      </a-row>


    </a-form-model>
  </a-modal>
</template>

<script>
import ImageUpload from "@/components/helper/ImageUpload";

export default {
  name: "AddStaffs",
  components: {ImageUpload},
  data() {
    return {
      visible: false,
      modalAdd: true,
      confirmLoading: false,
      form: new Form({
        id: '',
        name: '',
        email: '',
        photo: '',
        mobile: '',
        address: '',
        designation: undefined,
      }),
      rules: {
        name: [
          {required: true, message: 'Please enter staff first and last name', trigger: 'blur'},
          {max: 50, message: 'Maximum length was 50 character', trigger: 'change'},
        ],
        email: [
          {max: 50, message: 'Maximum length was 50 character', trigger: 'change'},
          {type: 'email', message: 'The input is not valid E-mail!', trigger: 'change'},
        ],
        address: [
          {max: 250, message: 'Maximum length was 250 character', trigger: 'change'},
        ],
        mobile: [
          {pattern: /^(?:\+88|01)?\d{11}\r?$/, message: 'Enter the valid mobile number', trigger: 'change'},
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
        this.form.photo = this.showImage(e.photo)
        this.form.designation = e.designation ? e.designation : undefined;
        this.modalAdd = false;
      }
      this.visible = true;
    },
    submitForm() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.form.post('staffs')
              .then(({data}) => {
                this.$store.commit('STAFF_ADD', data);
                this.cancelForm();
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Staffs add successfully.',
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
          this.form.put('staffs/' + this.form.id)
              .then(({data}) => {
                this.$store.commit('STAFF_MODIFY', data);
                this.$refs.ruleForm.resetFields();
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Staffs update successfully.',
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
      this.form.reset();
      this.visible = false;
    },
  },
}
</script>

<style scoped>

</style>