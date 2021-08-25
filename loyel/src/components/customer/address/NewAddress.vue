<template>
  <a-form-model ref="ruleForm" :model="form" :rules="rules" :hideRequiredMark="true"
                @keydown="form.onKeydown($event)" @submit.prevent="submitForm()" :layout="'vertical'">
    <a-alert v-if="isLoginError" type="error" showIcon style="margin-bottom: 24px;"
             :message="isLoginErrorMessage"/>
    <a-row :gutter="16">
      <a-col :md="24" :lg="12">
        <a-form-model-item ref="full_name" prop="full_name"
                           label="Full name">
          <a-input v-model="form.full_name" placeholder="Enter your first and last name. Example: 'Rofat Ahmed'"
                   @blur="() => {$refs.full_name.onFieldBlur();}"/>
        </a-form-model-item>
      </a-col>
      <a-col :md="24" :lg="12">
        <a-form-model-item ref="phone_number" prop="phone_number"
                           label="Phone Number">
          <a-input v-model="form.phone_number" placeholder="Please Enter your phone number"
                   @blur="() => {$refs.phone_number.onFieldBlur();}"/>
        </a-form-model-item>
      </a-col>
      <a-col :md="24" :lg="12">
        <a-form-model-item ref="region_id" prop="region_id"
                           label="Region">
          <a-select show-search placeholder="Please choose your region" style="width: 100%" @change="regionChange"
                    option-filter-prop="children" :filter-option="filterOption" v-model="form.region_id">
            <a-select-option v-for="region in regionList" :key="region.id" :value="region.id">
              {{ region.name }}
            </a-select-option>
          </a-select>
        </a-form-model-item>
      </a-col>
      <a-col :md="24" :lg="12">
        <a-form-model-item ref="city_id" prop="city_id"
                           label="City">
          <a-select show-search placeholder="Please choose your city" style="width: 100%"
                    :disabled="cities.length === 0" @change="cityChange"
                    option-filter-prop="children" :filter-option="filterOption" v-model="form.city_id">
            <a-select-option v-for="city in cities" :key="city.id" :value="city.id">
              {{ city.name }}
            </a-select-option>
          </a-select>
        </a-form-model-item>
      </a-col>
      <a-col :md="24" :lg="12">
        <a-form-model-item ref="area_id" prop="area_id"
                           label="Area">
          <a-select show-search placeholder="Please choose your area" style="width: 100%" :disabled="areas.length === 0"
                    option-filter-prop="children" :filter-option="filterOption" v-model="form.area_id">
            <a-select-option v-for="area in areas" :key="area.id" :value="area.id">
              {{ area.name }}
            </a-select-option>
          </a-select>
        </a-form-model-item>
      </a-col>
      <a-col :md="24" :lg="12">
        <a-form-model-item ref="address" prop="address"
                           label="Address">
          <a-input v-model="form.address" placeholder="For Example: House# 123 Street# 123, ABC Road"
                   @blur="() => {$refs.address.onFieldBlur();}"/>
        </a-form-model-item>
      </a-col>
      <a-col :md="24" :lg="12">
        <a-form-model-item label="Select a label for effective delivery:">
          <a-radio-group default-value="" button-style="solid">
            <a-radio-button class="mr-3 rounded" value="0">
              <i class="fa fa-home"></i>
              HOME
            </a-radio-button>
            <a-radio-button class="rounded" value="1">
              <i class="fa  fa-medkit"></i>
              OFFICE
            </a-radio-button>
          </a-radio-group>
        </a-form-model-item>
      </a-col>

    </a-row>
    <a-form-model-item style="text-align: right">
      <a-button @click="$emit('newAddress')" size="large" class="mr-3 px-5">
        Cancel
      </a-button>
      <a-button size="large" type="primary" class="px-5" :loading="form.busy"
                :disabled="form.busy" html-type="submit">
        Save
      </a-button>
    </a-form-model-item>
  </a-form-model>
</template>

<script>
import {mapGetters} from "vuex";
import ApiService from "@/core/services/api.service";

export default {
  name: "NewAddress",
  data() {
    return {
      isLoginError: false,
      isLoginErrorMessage: '',
      form: {
        id: '',
        full_name: '',
        phone_number: '',
        region_id: undefined,
        city_id: undefined,
        area_id: undefined,
        address: '',
        address_type: '',
      },
      cities: [],
      areas: [],
      rules: {
        full_name: [
          {required: true, message: 'You can\'t leave this empty.', trigger: 'blur'},
          {max: 50, message: 'Name maximum length 50 character', trigger: 'change'}
        ],
        phone_number: [
          {required: true, message: 'You can\'t leave this empty.', trigger: 'blur'},
          {pattern: /^(?:\+88|01)?\d{11}\r?$/, message: 'Enter the valid mobile number', trigger: 'change'}
        ],
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
    };
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
    submitForm() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          ApiService.post('address', this.form)
              .then(({data}) => {
                this.$store.commit('ADDRESS_ADD', data);
                this.$emit('newAddress')
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
                this.$refs.ruleForm.resetFields()
              });
        } else {
          return false;
        }
      });
    },
  },
  created() {
    if (!this.regionList.length > 0) this.$store.dispatch('REGION_LIST');
    if (!this.cityList.length > 0) this.$store.dispatch('CITY_LIST');
    if (!this.areaList.length > 0) this.$store.dispatch('AREA_LIST');
  },
  computed: {
    ...mapGetters(["regionList", "cityById", "cityList", "areaList", "areaById"])
  }
}
</script>

<style scoped>

</style>
