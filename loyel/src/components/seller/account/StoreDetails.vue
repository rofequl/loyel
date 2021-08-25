<template>
  <a-card class="user-details" :body-style="{padding: '4px'}">
    <div class="user-account">
      <div class="account-header">
        <h4 class="pb-2">Store Details
          <div class="float-right">
            <a href="Cancel" v-if="profile" @click.prevent="profile = false"><span>Cancel</span></a>
            <a href="Edit" v-else @click.prevent="profile = true"><span>Edit</span></a>
          </div>
        </h4>
      </div>
      <a-form-model class="pt-3 pb-4" ref="ruleForm" :model="form" :rules="rules" layout="vertical"
                    @submit.prevent="onSubmit()"
                    @keydown="form.onKeydown($event)" :hideRequiredMark="true">
        <a-descriptions>
          <a-descriptions-item v-if="profile">
            <a-form-model-item label="Store Name :" ref="shop_name" prop="shop_name">
              <a-input v-model="form.shop_name" placeholder="Enter your store name"/>
            </a-form-model-item>
          </a-descriptions-item>
          <a-descriptions-item v-else label="Store Name">
            {{ store.shop_name }}
          </a-descriptions-item>
          <a-descriptions-item v-if="profile">
            <a-form-model-item label="Telephone :" ref="phone" prop="phone">
              <a-input v-model="form.phone" placeholder="Enter your store telephone"/>
            </a-form-model-item>
          </a-descriptions-item>
          <a-descriptions-item v-else label="Telephone">
            {{ store.phone }}
          </a-descriptions-item>
          <a-descriptions-item v-if="profile">
            <a-form-model-item label="Store Category :" ref="category_id" prop="category_id">
              <a-select show-search placeholder="Select Category" style="width: 200px"
                        option-filter-prop="children" :filter-option="filterOption" v-model="form.category_id">
                <a-select-option v-for="(category,f) in categoryList" :key="f"
                                 :value="category.id">
                  {{ category.name }}
                </a-select-option>
              </a-select>
            </a-form-model-item>
          </a-descriptions-item>
          <a-descriptions-item v-else label="Store Category">
            {{ store.category }}
          </a-descriptions-item>
          <a-descriptions-item v-if="profile">
            <a-form-model-item label="Store Description :" ref="shop_description" prop="shop_description">
              <a-input v-model="form.shop_description" placeholder="Enter your store description"/>
            </a-form-model-item>
          </a-descriptions-item>
          <a-descriptions-item v-else label="Store Description">
            {{ store.shop_description }}
          </a-descriptions-item>
          <a-descriptions-item v-if="profile">
            <a-form-model-item label="Store Logo :" ref="shop_logo" prop="shop_logo">
              <ImageUpload v-model="form.shop_logo"/>
            </a-form-model-item>
          </a-descriptions-item>
          <a-descriptions-item v-else label="Store Logo">
            <a-avatar shape="square" size="large" :src="form.shop_logo"/>
          </a-descriptions-item>
          <a-descriptions-item v-if="profile">
            <a-form-model-item label="Store Banner :" ref="shop_banner" prop="shop_banner">
              <ImagesUpload v-model="form.shop_banner"/>
            </a-form-model-item>
          </a-descriptions-item>
          <a-descriptions-item v-else label="Store Banner">
            <a-avatar shape="square" size="large" v-for="(banner, k) in form.shop_banner" :src="banner"
                      :key="k" style="width: 100px; height: 30px"/>
          </a-descriptions-item>
          <a-descriptions-item v-if="profile">
            <a-form-model-item label="Business Type :">
              <a-checkbox-group v-model="form.business_types" :options="business_type.map(value => value.name)"/>
            </a-form-model-item>
          </a-descriptions-item>
          <a-descriptions-item v-else label="Business Type">
            <a-tag v-for="(business_type, i) in form.business_types" color="#108ee9" :key="i">{{business_type}}</a-tag>
          </a-descriptions-item>
        </a-descriptions>
        <div class="row" v-if="profile">
          <div class="col-12">
            <a-button htmlType="submit" class="px-5 text-white" size="large" :loading="form.busy"
                      style="background-color: #6aa1cf"
                      :disabled="form.busy">Update Store
            </a-button>
          </div>
        </div>
      </a-form-model>

    </div>
  </a-card>
</template>

<script>
import ImagesUpload from "@/components/helper/ImagesUpload";
import ImageUpload from "@/components/helper/ImageUpload";
import {mapGetters} from "vuex";

export default {
  name: "StoreDetails",
  components: {ImageUpload, ImagesUpload},
  data() {
    return {
      profile: false,
      form: new Form({
        shop_name: '',
        category_id: undefined,
        shop_description: '',
        shop_logo: '',
        shop_banner: [],
        phone: '',
        business_types: [],
      }),
      rules: {
        shop_name: [
          {required: true, message: 'Please enter your store name', trigger: 'blur'},
          {max: 30, message: 'Name maximum length 30 character', trigger: 'change'},
        ],
        category_id: [
          {required: true, message: 'Please select your store category', trigger: 'blur'},
        ],
        shop_description: [
          {max: 100, message: 'Name maximum length 100 character', trigger: 'change'},
        ],
        phone: [
          {max: 20, message: 'Telephone maximum length 20 character', trigger: 'change'},
        ],
        shop_logo: [
          {required: true, message: 'Please select your store logo', trigger: 'blur'},
        ],
      }
    }
  },
  methods: {
    filterOption(input, option) {
      return (
          option.componentOptions.children[0].text.toLowerCase().indexOf(input.toLowerCase()) >= 0
      );
    },
    onSubmit() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.form.post('store-update')
              .then(() => {
                this.$notification['success']({
                  message: 'congratulations',
                  description: 'Store update successfully.',
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
    formFill() {
      this.form.shop_name = this.store.shop_name;
      this.form.category_id = this.store.category_id ? this.store.category_id : undefined;
      this.form.shop_description = this.store.shop_description;
      this.form.phone = this.store.phone;
      this.form.business_types = this.store.business_type;
      this.form.shop_logo = this.showImage(this.store.shop_logo);
      if (this.store.shop_banner) {
        let banner = JSON.parse(this.store.shop_banner);
        if (banner.length > 0) {
          this.form.shop_banner = banner.map(x => {
            return this.showImage(x)
          });
        } else this.form.shop_banner = [];
      }
    }
  },
  created() {
    this.formFill();
    if (!this.categoryList.length > 0) this.$store.dispatch('CATEGORY_LIST');
    if (!this.business_type.length > 0) this.$store.dispatch('BUSINESS_TYPE_LIST');
  },
  watch: {
    store: function () {
      this.formFill();
    },
    profile: function () {
      this.formFill();
    }
  },
  computed: {
    ...mapGetters({store: "userStore", categoryList: "categoryList", business_type: "business_typeList"})
  }
}
</script>

<style scoped>

</style>
