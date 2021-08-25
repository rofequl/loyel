<template>
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <a-card title="Select Shipping Method" style="width: 100%">
          <a-form-model ref="ruleForm" :model="form" layout="vertical" @submit.prevent="onSubmit()"
                        @keydown="form.onKeydown($event)">
            <a-radio-group v-model="form.shipping_method">
              <a-radio :style="radioStyle" :value="1">
                Product Wise Shipping Cost
              </a-radio>
              <a-radio :style="radioStyle" :value="2">
                Flat Rate Shipping Cost
              </a-radio>
              <a-radio :style="radioStyle" :value="3">
                Area Wise Flat Shipping Cost
              </a-radio>
            </a-radio-group>
            <a-form-model-item v-if="form.shipping_method === 2" label="Flat Rate Shipping Cost Amount: " class="mt-3">
              <a-input-number step=".02" :formatter="value => `৳ ${value}`"
                              :parser="value => value.replace('৳', '')" style="width: 100%"
                              v-model="form.shipping_cost"
                              :min="0"/>
            </a-form-model-item>
            <div class="row">
              <div class="col-12">
                <a-button htmlType="submit" class="float-right mt-4" type="primary" :loading="form.busy"
                          :disabled="form.busy">Save
                </a-button>
              </div>
            </div>
          </a-form-model>
        </a-card>
      </div>
      <div class="col-md-6">
        <a-card title="Note" style="width: 100%">
          <ul class="list-group">
            <li class="list-group-item">
              1. Product Wise Shipping Cost calculation: Shipping cost is calculate by addition of each product shipping
              cost.
            </li>
            <li class="list-group-item">
              2. Flat Rate Shipping Cost calculation: How many products a customer purchase, doesn't matter. Shipping
              cost is fixed.
            </li>
            <li class="list-group-item">
              3. Area Wise Flat Shipping Cost calculation: Fixed rate for each area. If customers purchase multiple
              products from one seller shipping cost is calculated by the customer shipping area.
            </li>
          </ul>
        </a-card>
      </div>
    </div>
    <ShippingArea v-if="form.shipping_method === 3"/>
  </div>
</template>

<script>
import {mapGetters} from "vuex";
import {isEmptyObject} from "ant-design-vue/lib/vc-form/src/utils";
import ShippingArea from "@/components/shipping/ShippingArea";

export default {
  name: "Shipping",
  components: {ShippingArea},
  data() {
    return {
      form: new Form({
        shipping_method: 1,
        shipping_cost: 0,
      }),
      radioStyle: {
        display: 'block',
        height: '30px',
        lineHeight: '30px',
      },
    };
  },
  methods: {
    onSubmit() {
      this.form.post('shipping-method')
          .then(({data}) => {
            this.$store.commit('SET_SHIPPING_METHOD', data);
            this.$notification['success']({
              message: 'congratulations',
              description: 'Shipping Method update successfully.',
              style: {marginTop: '41px'},
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
    },
    loadData() {
      if (!isEmptyObject(this.generalSettings)) {
        this.form.shipping_method = this.generalSettings.shipping_method
        this.form.shipping_cost = this.generalSettings.shipping_cost
      }
    },
  },
  created() {
    this.loadData();
  },
  watch: {
    generalSettings: function () {
      this.loadData();
    }
  },
  computed: {
    ...mapGetters(["generalSettings"])
  },
}
</script>

<style scoped>

</style>
