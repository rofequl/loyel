<template>
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <a-card title="Select Seller Commission Type" style="width: 100%">
          <a-form-model ref="ruleForm" :model="form" layout="vertical" @submit.prevent="onSubmit()"
                        @keydown="form.onKeydown($event)">
            <a-radio-group v-model="form.commission_method">
              <a-radio :style="radioStyle" :value="1">
                Category Wise commission
              </a-radio>
              <a-radio :style="radioStyle" :value="2">
                Fixed seller commission
              </a-radio>
            </a-radio-group>
            <a-form-model-item v-if="form.commission_method === 2" label="Percent of fixed seller commission: "
                               class="mt-3">
              <a-input type="number" suffix="%" step="1" style="width: 100%" v-model="form.commission_rate"
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
          </ul>
        </a-card>
      </div>
    </div>
    <category-commission v-if="form.commission_method === 1" />
  </div>
</template>

<script>
import CategoryCommission from "@/components/seller/CategoryCommission";
export default {
  name: "Commission",
  components: {CategoryCommission},
  data() {
    return {
      // eslint-disable-next-line no-undef
      form: new Form({
        commission_method: 1,
        commission_rate: 0,
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

    }
  }
}
</script>

<style scoped>

</style>