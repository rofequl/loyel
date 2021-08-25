<template>
  <a-modal
      :title="modalAdd? 'Add new Area':'Area information edit'"
      :okText="modalAdd? 'Submit':'Update'"
      :visible="visible"
      :confirm-loading="confirmLoading"
      @ok="modalAdd? submitForm() : updateForm()"
      @cancel="cancelForm">
    <a-form-model ref="ruleForm" :model="form" :rules="rules"
                  @keydown="form.onKeydown($event)" :layout="'vertical'">

      <a-row :gutter="16">
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="region_id" has-feedback="" prop="region_id"
                             label="Region Name:">
            <a-select show-search placeholder="Select Region" style="width: 100%" @change="regionChange"
                      option-filter-prop="children" :filter-option="filterOption" v-model="form.region_id">
              <a-select-option v-for="region in regionList" :key="region.id" :value="region.id">
                {{ region.name }}
              </a-select-option>
            </a-select>
          </a-form-model-item>
        </a-col>
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="city_id" has-feedback="" prop="city_id"
                             label="City Name:">
            <a-select show-search placeholder="Select City" style="width: 100%"
                      option-filter-prop="children" :filter-option="filterOption" v-model="form.city_id">
              <a-select-option v-for="city in cities" :key="city.id" :value="city.id">
                {{ city.name }}
              </a-select-option>
            </a-select>
          </a-form-model-item>
        </a-col>
        <a-col :md="24" :lg="12">
          <a-form-model-item ref="name" has-feedback="" prop="name"
                             label="Area Name:">
            <a-input v-model="form.name" placeholder="Enter area name..."
                     @blur="() => {$refs.name.onFieldBlur();}"/>
          </a-form-model-item>
        </a-col>
      </a-row>
    </a-form-model>
  </a-modal>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "AreaAdd",
  data() {
    return {
      visible: false,
      modalAdd: true,
      confirmLoading: false,
      form: new Form({
        id: '',
        name: '',
        region_id: undefined,
        city_id: undefined,
      }),
      cities: [],
      rules: {
        name: [
          {required: true, message: 'Area name is required', trigger: 'blur'},
          {max: 50, message: 'Area name maximum length 50 character', trigger: 'change'},
        ],
        region_id: [
          {required: true, message: 'Please select region', trigger: 'blur'},
        ],
        city_id: [
          {required: true, message: 'Please select city', trigger: 'blur'},
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
    regionChange(value) {
      this.form.city_id = undefined;
      this.cities = this.cityById(value);
    },
    submitForm() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.visible = false;
          this.form.post('area')
              .then(({data}) => {
                this.$store.commit('AREA_ADD', data);
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Area add successfully.',
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
                this.$refs.ruleForm.resetFields()
              });
        } else {
          return false;
        }
      });
    },
    updateForm() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.visible = false;
          this.form.put('area/' + this.form.id)
              .then(({data}) => {
                this.$store.commit('AREA_MODIFY', data);
                this.$refs.ruleForm.resetFields();
                this.$notification['success']({
                  message: 'Congratulations',
                  description: 'Area update successfully.',
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
                this.$refs.ruleForm.resetFields()
                this.form.reset()
              });
        } else {
          return false;
        }
      });
    },
    cancelForm() {
      this.$refs.ruleForm.resetFields()
      this.form.reset()
      this.visible = false;
    },
    filterOption(input, option) {
      return (
          option.componentOptions.children[0].text.toLowerCase().indexOf(input.toLowerCase()) >= 0
      );
    },
  },
  created() {
    if (!this.regionList.length > 0) this.$store.dispatch('REGION_LIST');
    if (!this.cityList.length > 0) this.$store.dispatch('CITY_LIST');
  },
  computed: {
    ...mapGetters(["regionList", "cityById", "cityList"])
  },
}
</script>

<style scoped>
>>> .ant-modal-mask, >>> .ant-modal-wrap {
  z-index: 1030 !important;
}
</style>
