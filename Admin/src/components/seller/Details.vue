<template>
  <div>
    <a-card
        style="width:100%"
        :tab-list="steps"
        :active-tab-key="current"
        @tabChange="key => onTabChange(key)"
        :body-style="{padding: 0}"
    >
      <span slot="orderList"> <CIcon name="cib-shopify" class="mr-1 mt-2-m"/>Seller Store </span>
      <span slot="wishList"> <CIcon name="cil-basket" class="mr-1 mt-2-m"/>Product List </span>
      <div v-if="current === '1'">
        <StoreDetails :seller="seller"/>
      </div>
      <div v-if="current === '2'">
        <SellerProduct :product-list="seller.product_list" :seller-code="seller.seller_id"/>
      </div>
    </a-card>
  </div>
</template>

<script>
import StoreDetails from "@/components/seller/StoreDetails";
import SellerProduct from "@/components/seller/SellerProduct";

export default {
  name: "Details",
  components: {StoreDetails, SellerProduct},
  props: {
    seller: {
      required: true
    },
  },
  data() {
    return {
      current: '1',
      steps: [
        {
          scopedSlots: {tab: 'orderList'},
          key: '1',
        },
        {
          scopedSlots: {tab: 'wishList'},
          key: '2',
        },
      ],
    };
  },
  methods: {
    onTabChange(key) {
      this.current = key;
    },
  },
}
</script>

<style scoped>

</style>
