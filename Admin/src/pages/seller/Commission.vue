<template>
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <a-card title="Select Seller Commission Type" style="width: 100%">
          <a-form-model ref="ruleForm" :model="form" layout="vertical" @submit.prevent="onSubmit()"
                        @keydown="form.onKeydown($event)">
            <a-radio-group v-model="form.shipping_method">
              <a-radio :style="radioStyle" :value="1">
                Category Wise commission
              </a-radio>
              <a-radio :style="radioStyle" :value="2">
                Fixed seller commission
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
    </div>
  </div>
</template>

<script>
export default {
  name: "Commission",
  data() {
    return {
      // eslint-disable-next-line no-undef
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

    }
  }
}
</script>

<style scoped>

</style>