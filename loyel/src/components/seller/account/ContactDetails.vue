<template>
  <a-card class="user-details mt-3" :body-style="{padding: '4px'}">
    <div class="user-account">
      <div class="account-header">
        <h4 class="pb-2">Contact Details
          <div class="float-right">
            <a href="Cancel" v-if="profile" @click.prevent="profile = false"><span>Cancel</span></a>
            <a href="Edit" v-else @click.prevent="profile = true"><span>Edit</span></a>
          </div>
        </h4>
      </div>
      <a-form-model class="pt-3 pb-4" ref="ruleForm" :model="form" :rules="rules" layout="vertical"
                    @submit.prevent="onSubmit()"
                    @keydown="form.onKeydown($event)" :hideRequiredMark="true">
        <a-descriptions :column="2">
          <a-descriptions-item v-if="profile">
            <a-form-model-item ref="region_id" prop="region_id"
                               label="Region :">
              <a-select show-search placeholder="Please choose your region" style="width: 200px" @change="regionChange"
                        option-filter-prop="children" :filter-option="filterOption" v-model="form.region_id">
                <a-select-option v-for="region in regionList" :key="region.id" :value="region.id">
                  {{ region.name }}
                </a-select-option>
              </a-select>
            </a-form-model-item>
          </a-descriptions-item>
          <a-descriptions-item v-else label="Region">
            {{userContact.region}}
          </a-descriptions-item>
          <a-descriptions-item v-if="profile">
            <a-form-model-item ref="city_id" prop="city_id"
                               label="City">
              <a-select show-search placeholder="Please choose your city" style="width: 200px"
                        :disabled="cities.length === 0" @change="cityChange"
                        option-filter-prop="children" :filter-option="filterOption" v-model="form.city_id">
                <a-select-option v-for="city in cities" :key="city.id" :value="city.id">
                  {{ city.name }}
                </a-select-option>
              </a-select>
            </a-form-model-item>
          </a-descriptions-item>
          <a-descriptions-item v-else label="City">
            {{userContact.city}}
          </a-descriptions-item>
          <a-descriptions-item v-if="profile">
            <a-form-model-item ref="area_id" prop="area_id"
                               label="Area">
              <a-select show-search placeholder="Please choose your area" style="width: 200px" :disabled="areas.length === 0"
                        option-filter-prop="children" :filter-option="filterOption" v-model="form.area_id">
                <a-select-option v-for="area in areas" :key="area.id" :value="area.id">
                  {{ area.name }}
                </a-select-option>
              </a-select>
            </a-form-model-item>
          </a-descriptions-item>
          <a-descriptions-item v-else label="Area">
            {{userContact.area}}
          </a-descriptions-item>
          <a-descriptions-item v-if="profile">
            <a-form-model-item ref="address" prop="address"
                               label="Address">
              <a-input v-model="form.address" placeholder="For Example: House# 123 Street# 123, ABC Road"
                       @blur="() => {$refs.address.onFieldBlur();}"/>
            </a-form-model-item>
          </a-descriptions-item>
          <a-descriptions-item v-else label="Address">
            {{userContact.address}}
          </a-descriptions-item>
        </a-descriptions>
        <div class="row" v-if="profile">
          <div class="col-12">
            <a-button htmlType="submit" class="px-5 text-white" size="large" :loading="form.busy"
                      style="background-color: #6aa1cf"
                      :disabled="form.busy">Update Contact Details
            </a-button>
          </div>
        </div>
      </a-form-model>
    </div>
  </a-card>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "ContactDetails",
  data() {
    return {
      profile: false,
      form: new Form({
        region_id: undefined,
        city_id: undefined,
        area_id: undefined,
        address: '',
      }),
      cities: [],
      areas: [],
      rules: {
        region_id: [
          {required: true, message: 'You can\'t leave this empty.', trigger: 'blur'}
        ],
        city_id: [
          {required: true, message: 'You can\'t leave this empty.', trigger: 'blur'}
        ],
        area_id: [
          {required: true, message: 'You can\'t leave this empty.', trigger: 'blur'}
        ],
        address: [
          {required: true, message: 'You can\'t leave this empty.', trigger: 'blur'},
          {max: 300, message: 'Address maximum length 300 character', trigger: 'change'}
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
    regionChange(value) {
      this.form.city_id = undefined;
      this.form.area_id = undefined;
      this.areas = [];
      this.cities = this.cityById(value);
    },
    cityChange(value) {
      this.form.area_id = undefined;
      this.areas = this.areaById(value);
    },
    onSubmit() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.form.post('shop-contact-update')
              .then(() => {
                this.$notification['success']({
                  message: 'congratulations',
                  description: 'Contact Details update successfully.',
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
      this.form.region_id = this.userContact.region_id ? this.userContact.region_id : undefined;
      this.form.city_id = this.userContact.city_id ? this.userContact.city_id : undefined;
      this.form.area_id = this.userContact.area_id ? this.userContact.area_id : undefined;
      this.form.address = this.userContact.address;
    }
  },
  created() {
    if (!this.regionList.length > 0) this.$store.dispatch('REGION_LIST');
    if (!this.cityList.length > 0) this.$store.dispatch('CITY_LIST');
    if (!this.areaList.length > 0) this.$store.dispatch('AREA_LIST');
    this.formFill();
  },
  watch: {
    userContact: function () {
      this.formFill();
    },
    profile: function () {
      this.formFill();
    }
  },
  computed: {
    ...mapGetters(["regionList", "cityById", "cityList", "areaList", "areaById", "userContact"])
  }
}
</script>

<style scoped>

</style>
