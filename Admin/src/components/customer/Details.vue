<template>
  <div>
    <a-card
        style="width:100%"
        :tab-list="steps"
        :active-tab-key="current"
        @tabChange="key => onTabChange(key)"
        :body-style="{padding: 0}"
    >
      <span slot="orderList"> <CIcon name="cil-cart" class="mr-1 mt-2-m"/>Order List </span>
      <span slot="wishList"> <CIcon name="cil-heart" class="mr-1  mt-2-m"/>Wish List </span>
      <span slot="addressBook"> <CIcon name="cil-truck" class="mr-1  mt-2-m"/>Address Book </span>
      <div v-if="current === '1'">
        <CustomerOrderList :order-list="customer.order_list"/>
      </div>
      <div v-if="current === '2'">
        <CustomerWishlist :wish-list="customer.wish_list"/>
      </div>
      <div v-if="current === '3'">
        <CustomerAddress :address-book="customer.address_book"/>
      </div>
    </a-card>
  </div>
</template>

<script>
import CustomerOrderList from "@/components/customer/CustomerOrderList";
import CustomerWishlist from "@/components/customer/CustomerWishlist";
import CustomerAddress from "@/components/customer/CustomerAddress";

export default {
  name: "Details",
  components: {CustomerOrderList, CustomerWishlist, CustomerAddress},
  props: {
    customer: {
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
        {
          scopedSlots: {tab: 'addressBook'},
          key: '3',
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
