<template>
  <div>
    <a-card style="width: 100%;border-radius: 20px" class="mt-4 p-0 bg-light">
      <h5 class="font-weight-bold">Payment Methods</h5>
      <div class="row mt-4">
        <div class="col-12">
          <span v-if="paymentType === ''" style="color: #00aced; font-size: 12px" class="pointer"
                @click="paymentModel = true">+ Select payment method</span>
          <div v-else>
            <span style="color: #00aced; font-size: 12px" class="pointer float-right"
                  @click="paymentModel = true">Change</span>
            <img src="@/assets/image/download.jpg" width="140px" height="50px">
          </div>
        </div>
      </div>
    </a-card>
    <PaymentType :modelOpen="paymentModel" @closeModel="paymentModel = false" @onChange="onChange"/>
  </div>
</template>

<script>
import PaymentType from "@/components/cart/PaymentType";

export default {
  name: "Payment",
  components: {PaymentType},
  data() {
    return {
      paymentModel: false,
      paymentType: '',
    }
  },
  methods: {
    onChange(e) {
      this.paymentType = e
      this.$emit('onPayment', e)
      this.paymentModel = false
    },
  }
}
</script>

<style scoped>

</style>
