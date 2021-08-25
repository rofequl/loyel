<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">Marketing
        </span>
        <h3 class="page-title">Create New Deals</h3>
      </div>
    </div>
    <!-- End Page Header -->

    <CRow class="my-4 justify-content-center">
      <CCol md="8">
        <CCardGroup>
          <CCard class="p-4">
            <a-form-model ref="ruleForm" :model="form" :rules="rules"
                          @submit.prevent="onSubmit()" @keydown="form.onKeydown($event)">
              <CRow class="">
                <CCol md="6">
                  <a-form-model-item ref="title" has-feedback="" label="Title: " prop="title">
                    <a-input
                        v-model="form.title" placeholder="Enter the title..."
                        @blur="() => {$refs.title.onFieldBlur();}"
                    />
                  </a-form-model-item>
                </CCol>
                <CCol md="6">
                  <a-form-model-item ref="app_name" has-feedback="" label="Banner : " prop="app_name">
                    <ImageUpload v-model="form.banner"/>
                  </a-form-model-item>
                </CCol>
              </CRow>
              <CRow class="">
                <CCol md="6">
                  <a-form-model-item :label-col="{lg: {span: 12}, sm: {span: 7}}" labelAlign="left"
                                     :wrapper-col="{lg: {span: 12}, sm: {span: 17}}" label="Expired Date">
                    <a-switch checked-children="Yes" un-checked-children="No" v-model="form.expired"/>
                  </a-form-model-item>
                </CCol>
                <CCol md="4" v-if="form.expired">
                  <a-form-model-item ref="expired_date" has-feedback="" label="" prop="expired_date"
                                     :rules="{required: true,message: 'Expired date can not be null',trigger: 'blur'}">
                    <a-date-picker @change="(date, dateString)=>{form.expired_date = dateString}"/>
                  </a-form-model-item>
                </CCol>
              </CRow>
              <a-form-model-item label="Products : ">
                <a-select
                    mode="multiple"
                    label-in-value
                    :value="value"
                    placeholder="Select product"
                    style="width: 100%"
                    :filter-option="false"
                    :not-found-content="fetching ? undefined : null"
                    @search="fetchUser"
                    @change="handleChange"
                >
                  <a-spin v-if="fetching" slot="notFoundContent" size="small"/>
                  <a-select-option v-for="d in data" :key="d.value">
                    {{ d.text }}
                  </a-select-option>
                </a-select>
              </a-form-model-item>
              <table class="table table-bordered" v-if="form.product.length > 0">
                <thead>
                <tr>
                  <th>Product</th>
                  <th>Discount</th>
                  <th>Discount Value</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="(volume, f) in form.product" :key="f">
                  <td>
                    <b-media>
                      <template #aside>
                        <b-img :src="showImage(volume.image)" width="64" alt="placeholder"></b-img>
                      </template>
                      <p>{{ volume.name }}</p>
                    </b-media>
                  </td>
                  <td>
                    <a-switch checked-children="Yes" un-checked-children="No"
                              v-model="volume.discount"/>
                  </td>
                  <td style="width: 30%">
                    <a-input-group compact v-if="volume.discount">
                      <a-input-number step=".2" style="width: 50%" v-model="volume.discount_value" :min="1"/>
                      <a-select v-model="volume.discount_type" style="width: 50%">
                        <a-select-option value="Percent">
                          Percent
                        </a-select-option>
                        <a-select-option value="Flat">
                          Flat
                        </a-select-option>
                      </a-select>
                    </a-input-group>
                  </td>
                </tr>
                </tbody>
              </table>
              <a-button htmlType="submit" type="primary" :loading="form.busy" :disabled="form.busy"
                        class="float-right my-3">
                Submit
              </a-button>
            </a-form-model>
          </CCard>
        </CCardGroup>
      </CCol>
    </CRow>

  </div>
</template>

<script>
import ImageUpload from "@/components/helper/ImageUpload";
import ApiService from "@/core/services/api.service";

export default {
  name: "FlashEdit",
  components: {ImageUpload},
  data() {
    this.lastFetchId = 0;
    this.fetchUser = debounce(this.fetchUser, 800);
    return {
      form: new Form({
        title: '',
        banner: '',
        expired: false,
        expired_date: '',
        product: [],
      }),
      rules: {
        title: [
          {required: true, message: 'Please input your deal name', trigger: 'blur'},
          {max: 100, message: 'Title name maximum length 100 character', trigger: 'change'},
        ]
      },
      data: [],
      value: [],
      fetching: false,
    }
  },
  methods: {
    onSubmit() {
      this.$refs.ruleForm.validate(valid => {
        if (valid) {
          this.form.post('flash-deals')
              .then(({data}) => {
                this.$store.commit('DEALS_ADD', data);
                this.$notification['success']({
                  message: 'congratulations',
                  description: 'Deal add successfully.',
                  style: {marginTop: '41px'},
                });
                this.$router.push('/marketing/flash-deals')
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
    fetchUser(value) {
      this.lastFetchId += 1;
      const fetchId = this.lastFetchId;
      this.data = [];
      this.fetching = true;
      let url = 'flash-deal-product?product=' + value;
      ApiService.get(url)
          .then(body => {
            if (fetchId !== this.lastFetchId) {
              return;
            }
            const data = body.data.map(product => ({
              text: `${product.name}`,
              value: product.id,
              image: product.thumbnail_img,
            }));
            this.data = data;
            this.fetching = false;
          });
    },
    handleChange(value) {
      let product = [];
      product = value.map(product => {
        let products = this.form.product.find(value => value.id === product.key);
        if (products) {
          return {
            name: products.name,
            id: products.id,
            image: products.image,
            discount: products.discount,
            discount_value: products.discount_value,
            discount_type: products.discount_type,
          }
        } else {
          let productAgain = this.data.find(value => value.value === product.key);
          if (productAgain) {
            return {
              name: productAgain.text,
              id: productAgain.value,
              image: productAgain.image,
              discount: false,
              discount_value: 0,
              discount_type: 'Percent',
            }
          }
        }
      })
      this.form.product = product;
      Object.assign(this, {
        value,
        data: [],
        fetching: false,
      });
    },
  },
}
</script>

<style scoped>

</style>
