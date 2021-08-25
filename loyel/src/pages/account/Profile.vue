<template>
  <a-card class="user-details" :body-style="{padding: '4px'}">
    <div class="user-account">
      <div class="account-header">
        <h4 class="pb-2">My account</h4>
      </div>

      <a-form-model class="pt-3 pb-4" ref="ruleForm" :model="form" :rules="rules" layout="vertical"
                    @submit.prevent="onSubmit()"
                    @keydown="form.onKeydown($event)" :hideRequiredMark="true">
        <div class="form-header">
          <div class="header-des">
            <p>Personal information</p>
            <a href="Cancel" v-if="profile" @click.prevent="profile = false"><span>Cancel</span></a>
            <a href="Edit" v-else @click.prevent="profile = true"><span>Edit</span></a>
          </div>
        </div>
        <a-descriptions>
          <a-descriptions-item v-if="profile">
            <a-form-model-item label="Full name :" ref="name" prop="name">
              <a-input v-model="form.name" placeholder="Enter your first and last name"/>
            </a-form-model-item>
          </a-descriptions-item>
          <a-descriptions-item v-else label="Full name">
            <p>{{ form.name }}</p>
          </a-descriptions-item>
          <a-descriptions-item v-if="profile">
            <a-form-model-item label="Gender :">
              <a-select v-model="form.gender" placeholder="please select gender" style="width: 100%">
                <a-select-option value="male">
                  male
                </a-select-option>
                <a-select-option value="women">
                  women
                </a-select-option>
              </a-select>
            </a-form-model-item>
          </a-descriptions-item>
          <a-descriptions-item v-else label="Gender">
            <p class="text-capitalize">{{ form.gender }}</p>
          </a-descriptions-item>
          <a-descriptions-item v-if="profile">
            <a-form-model-item label="Birthday :">
              <a-date-picker :default-value="form.birthday" format="YYYY-MM-DD"
                             @change="dateSelect"
                             placeholder="Pick a date"/>
            </a-form-model-item>
          </a-descriptions-item>
          <a-descriptions-item v-else label="Birthday">
            <p>{{ form.birthday ? moment(form.birthday).format('LL') : '' }}</p>
          </a-descriptions-item>
          <a-descriptions-item v-if="profile">
            <a-form-model-item label="Profile Picture: " prop="photo" help="Image size 512 X 512">
              <image-upload v-model="form.photo"/>
            </a-form-model-item>
          </a-descriptions-item>
        </a-descriptions>
        <div class="row" v-if="profile">
          <div class="col-12">
            <a-button htmlType="submit" class="px-5 text-white" size="large" :loading="form.busy"
                      style="background-color: #6aa1cf"
                      :disabled="form.busy">Update Profile
            </a-button>
          </div>
        </div>
      </a-form-model>

      <form class="pt-3 pb-4">
        <div class="row">
          <div class="col-md-6 col-12">
            <p style="color: black">Email Address |
              <a href="manage" style="font-size: 12px" @click.prevent="$refs.child.modal()">
                {{ user.email ? "Change" : "Add" }}
              </a>
            </p>
            <span class="ant-form-text">{{ user.email }}
             <a-button type="link" style="color: #8caf34" v-if="user.email_verify === 1"><i
                 class="fa fa-check-circle mr-1 fa-lg"></i> Verified</a-button>
              <a-button type="link" style="color: #356cad" v-else>Verify</a-button>

            </span>
          </div>
          <div class="col-md-6 col-12">
            <p style="color: black">Phone Number |
              <a href="manage" style="font-size: 12px"
                 @click.prevent="$refs.children.modal(user.mobile ? 'change' : 'add')">
                {{ user.mobile ? "Change" : "Add" }}
              </a>
              <span class="mx-2" v-if="user.mobile && user.mobile_verify === 0">-</span>
              <a v-if="user.mobile && user.mobile_verify === 0" href="verify" style="font-size: 12px"
                 @click.prevent="$refs.children.modal('verify')">
                Verify phone number?
              </a>
            </p>
            <span class="ant-form-text">{{ user.mobile }}
              <a-button type="link" style="color: #8caf34" v-if="user.mobile_verify === 1"><i
                  class="fa fa-check-circle mr-1 fa-lg"></i> Verified</a-button>
            </span>
          </div>
        </div>
      </form>
    </div>
    <Email ref="child" :is-update="!!user.email" :name="form.name"/>
    <Mobile ref="children"/>
  </a-card>
</template>

<script>
import {mapGetters} from "vuex";
import moment from "moment";
import Email from "@/components/customer/Email";
import Mobile from "@/components/customer/Mobile";
import ImageUpload from "@/components/helper/ImageUpload";

export default {
  name: "Profile",
  components: {Email, Mobile, ImageUpload},
  data() {
    return {
      profile: false,
      form: new Form({
        name: '',
        gender: undefined,
        birthday: null,
        photo: '',
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
          this.form.post('profile-update')
              .then(() => {
                this.$notification['success']({
                  message: 'congratulations',
                  description: 'Profile update successfully.',
                  style: {marginTop: '200px'},
                });
                this.$store.dispatch('VERIFY_AUTH');
                this.profile = false;
              })
              .catch(err => {
                this.$notification['error']({
                  message: 'Warning',
                  description: ((err.response || {}).data || {}).message || 'Something Wrong',
                  style: {marginTop: '200px'},
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
      this.form.gender = this.user.gender ? this.user.gender : undefined;
      this.form.birthday = this.user.birthday ? this.user.birthday : null;
      this.form.photo = this.user.photo_type === 0 ? this.showImage(this.user.photo) : this.user.photo;
    }
  },
  created() {
    this.addUser();
  },
  watch: {
    user: function () {
      this.addUser();
    },
    profile: function () {
      this.addUser();
    }
  },
  computed: {
    ...mapGetters({user: "currentUser"})
  }
}
</script>

<style scoped>
>>> .ant-descriptions-item-content {
  width: 50%;
}

</style>
