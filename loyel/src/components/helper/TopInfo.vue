<template>
  <div class="w-100 text-center my-style">
    <div class="container">
      <a-row>
        <a-col :span="6">
          <i class="fa fa-retweet" aria-hidden="true"></i>
          Free Returns
        </a-col>
        <a-col :span="6">
          <i class="fa fa-shield" aria-hidden="true"></i>
          100% Authentic
        </a-col>
        <a-col :span="6">
          <i class="fa fa-money" aria-hidden="true"></i>
          Secure Payments
        </a-col>
        <a-col :span="6">
          <i class="fa fa-file-text-o" aria-hidden="true"></i>
          Return & Refund Policies
        </a-col>
      </a-row>
    </div>
  </div>
</template>

<script>
export default {
  name: "TopInfo"
}
</script>

<style scoped>
.my-style{
  font-size: 12px;
  color: #080b3e;
  background-color: #d3d3d3;
  margin-top: -6px;
  padding: 5px 0;
  box-shadow: inset 0 -14px 5px -15px #1111119c;
}

.my-style i{
  color: #416ec4;
  margin-right: 2px;
}
</style>
