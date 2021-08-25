<template>
  <a-modal centered :width="750" :visible="modelOpen" :footer="null"
           @cancel="$emit('closeModel')" title="Payment Methods">
    <a-radio-group default-value="" button-style="solid" @change="(e)=>{$emit('onChange',e.target.value)}">
      <a-radio-button class="mr-3 cashButton" value="1">
        <p class="font-weight-bold">Cash On Delivery</p>
        <img src="@/assets/image/download.jpg" class="d-block mx-auto">
      </a-radio-button>
    </a-radio-group>
  </a-modal>
</template>

<script>
export default {
  props: ['modelOpen'],
  name: "PaymentType"
}
</script>

<style scoped lang="scss">
.cashButton {
  height: 90px;
  border: 3px solid #d9d9d9;
  background: white !important;
  color: #2f2c2c !important;
  text-align: center;

  p {
    font-size: 16px;
  }

  img {
    height: 50px;
    width: 130px;
  }
}
</style>
