<template>
  <a-modal
      :title="modalAdd? 'Add new user':'User information edit'"
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
            <a-input v-model="form.name" placeholder="Enter user first and last name"
                     @blur="() => {$refs.name.onFieldBlur();}">
              <a-icon slot="prefix" type="user"/>
            </a-input>
          </a-form-model-item>
        </a-col>
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="email" has-feedback="" prop="email"
                             label="Email Id:">
            <a-input v-model="form.email" placeholder="Enter user email id"
                     @blur="() => {$refs.email.onFieldBlur();}" type="email">
              <a-icon slot="prefix" type="mail"/>
            </a-input>
          </a-form-model-item>
        </a-col>
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="role_id" has-feedback="" prop="role_id"
                             label="Role Name:">
            <a-select show-search placeholder="Select User Role" style="width: 100%"
                      option-filter-prop="children" :filter-option="filterOption" v-model="form.role_id">
              <a-select-option v-for="role in roleList" :key="role.id" :value="role.id">
                {{ role.name }}
              </a-select-option>
            </a-select>
          </a-form-model-item>
        </a-col>
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="password" has-feedback="" prop="password"
                             label="Password:">
            <a-input v-model="form.password" placeholder="Enter user password"
                     @blur="() => {$refs.password.onFieldBlur();}" type="password">
              <a-icon slot="prefix" type="lock"/>
            </a-input>
          </a-form-model-item>
        </a-col>


      </a-row>


    </a-form-model>
  </a-modal>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "UserAdd",
  data() {
    return {
      visible: false,
      modalAdd: true,
      confirmLoading: false,
      form: new Form({
        id: '',
        name: '',
        email: '',
        password: '',
        role_id: undefined,
        reg_type: 0,
      }),
      rules: {
        name: [
          {required: true, message: 'Please enter user first and last name', trigger: 'blur'},
          {max: 50, message: 'Maximum length was 50 character', trigger: 'change'},
        ],
        email: [
          {required: true, message: 'Please enter user email address.', trigger: 'blur'},
          {max: 50, message: 'Maximum length was 50 character', trigger: 'change'},
          {type: 'email', message: 'The input is not valid E-mail!', trigger: 'change'},
        ],
        password: [
          {required: true, message: 'Please enter user password!', trigger: 'blur'},
          {max: 20, message: 'Maximum length was 20 character', trigger: 'change'},
          {min: 6, message: 'Minimum length was 6 character', trigger: 'change'},
        ],
        role_id: [
          {required: true, message: 'Please select user role', trigger: 'blur'},
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
        this.modalAdd = false;
      }
      this.visible = true;
    },
    submitForm() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.visible = false;
          this.form.post('admin-user-entry')
              .then(({data}) => {
                this.$store.commit('USER_ADD', data);
                this.$refs.ruleForm.resetFields();
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'User add successfully.',
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
          this.form.put('admin-user-entry/' + this.form.id)
              .then(({data}) => {
                this.$store.commit('USER_MODIFY', data);
                this.$refs.ruleForm.resetFields();
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'User update successfully.',
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
    filterOption(input, option) {
      return (
          option.componentOptions.children[0].text.toLowerCase().indexOf(input.toLowerCase()) >= 0
      );
    },
  },
  created() {
    if (!this.roleList.length > 0) this.$store.dispatch('ROLE_LIST');
  },
  computed: {
    ...mapGetters(["roleList"])
  },
}
</script>

<style scoped>
>>> .ant-modal-mask, >>> .ant-modal-wrap {
  z-index: 1030 !important;
}
</style>