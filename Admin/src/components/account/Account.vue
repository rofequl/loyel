<template>
  <div class="text-dark">
    <h3 class="mb-4">My Account</h3>
    <a-form-model class="pt-3 pb-4" ref="ruleForm" :model="form" :rules="rules" layout="vertical"
                  @submit.prevent="onSubmit()"
                  @keydown="form.onKeydown($event)" :hideRequiredMark="true">
      <a-descriptions>
        <a-descriptions-item>
          <a-form-model-item label="Full name :" ref="name" prop="name">
            <a-input v-model="form.name" placeholder="Enter your first and last name"/>
          </a-form-model-item>
        </a-descriptions-item>
        <a-descriptions-item>
          <a-form-model-item label="Gender :">
            <a-select v-model="form.gender" placeholder="please select gender" style="width: 198px">
              <a-select-option value="male">
                male
              </a-select-option>
              <a-select-option value="women">
                women
              </a-select-option>
            </a-select>
          </a-form-model-item>
        </a-descriptions-item>
        <a-descriptions-item>
          <a-form-model-item label="Birthday :">
            <a-date-picker :default-value="form.birthday" format="YYYY-MM-DD"
                           @change="dateSelect"
                           placeholder="Pick a date"/>
          </a-form-model-item>
        </a-descriptions-item>
        <a-descriptions-item>
          <a-form-model-item label="Profile Picture: " prop="photo" help="Image size 512 X 512">
            <image-upload v-model="form.photo"/>
          </a-form-model-item>
        </a-descriptions-item>
        <a-descriptions-item>
          <a-form-model-item label="Email Address :" ref="name" prop="name">
            <a-input v-model="form.email" placeholder="Enter your email address" disabled/>
          </a-form-model-item>
        </a-descriptions-item>
        <a-descriptions-item>
          <a-form-model-item label="Phone Number :" ref="name" prop="name">
            <a-input v-model="form.mobile" placeholder="Enter your phone number"/>
          </a-form-model-item>
        </a-descriptions-item>
      </a-descriptions>
      <a-form-model-item class="mt-3 float-right">
        <a-button type="primary" @click="onSubmit">
          Update
        </a-button>
        <a-button style="margin-left: 10px;" @click="addUser">
          Cancel
        </a-button>
      </a-form-model-item>
    </a-form-model>
  </div>
</template>

<script>
import {mapGetters} from "vuex";
import ImageUpload from "@/components/helper/ImageUpload";
import moment from "moment";

export default {
  name: "Account",
  components: {ImageUpload},
  data() {
    return {
      form: new Form({
        name: '',
        gender: undefined,
        birthday: null,
        photo: '',
        email: '',
        mobile: '',
      }),
      rules: {
        name: [
          {required: true, message: 'Please enter your name', trigger: 'blur'},
          {max: 100, message: 'Name maximum length 100 character', trigger: 'blur'},
        ],
      }
    }
  },
  methods: {
    dateSelect(date) {
      this.form.birthday = moment(date).format('YYYY-MM-DD');
    },
    onSubmit() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.form.post('admin-profile-update')
              .then(() => {
                this.$notification['success']({
                  message: 'congratulations',
                  description: 'Profile update successfully.',
                  style: {marginTop: '41px'},
                });
                this.$store.dispatch('VERIFY_AUTH');
                this.profile = false;
              })
              .catch(err => {
                this.$notification['error']({
                  message: 'Warning',
                  description: ((err.response || {}).data || {}).message || 'Something Wrong',
                  style: {marginTop: '41px'},
                  duration: 5
                })
              })
        } else {
          return false;
        }
      });
    },
    addUser() {
      this.form.name = this.user.name;
      this.form.email = this.user.email;
      this.form.mobile = this.user.mobile;
      this.form.gender = this.user.gender ? this.user.gender : undefined;
      this.form.birthday = this.user.birthday ? this.user.birthday : null;
      this.form.photo = this.user.photo_type === 0 ? this.showImage(this.user.photo) : this.user.photo;
    }
  },
  created() {
    this.addUser();
  },
  computed: {
    ...mapGetters({user: "currentUser"})
  }
}
</script>

<style scoped>

</style>