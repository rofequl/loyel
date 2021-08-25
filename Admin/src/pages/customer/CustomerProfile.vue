<template>
  <a-spin class="w-100 h-100" tip="Loading..." :spinning="customer === ''" >
    <a-row :gutter="[16,16]" v-if="customer !== ''">
      <a-col :xs="24" :lg="9" :xl="8">
        <ProfileDetails :profile="customer"/>
        <CWidgetBrand
            :right-header="customer.total_order.toString()"
            right-footer="Total Order"
            :left-header="numberWithCommas(customer.purchase_amount)"
            left-footer="Purchase Amount"
            class="w-100"
        >
        </CWidgetBrand>
      </a-col>
      <a-col :xs="24" :lg="15" :xl="16">
        <Details :customer="customer"/>
      </a-col>
    </a-row>
  </a-spin>
</template>

<script>
import {mapGetters} from "vuex";
import ProfileDetails from "@/components/helper/ProfileDetails";
import Details from "@/components/customer/Details";

export default {
  name: "CustomerProfile",
  data() {
    return {
      customer: '',
    }
  },
  components: {ProfileDetails, Details},
  methods: {
    getCustomerDetails() {
      let customer = this.getCustomerById(this.$route.params.id);
      if (customer) {
        setTimeout(() => {
          this.customer = customer
        }, 500);
      } else this.$store.dispatch('CUSTOMER_DETAILS', this.$route.params.id);
    },
  },
  created() {
    this.getCustomerDetails();
    this.$message.config({
      top: '63px',
    });
  },
  watch: {
    singleCustomerIsLoaded(data) {
      if (data) {
        this.getCustomerDetails();
      }
    },
  },
  computed: {
    ...mapGetters(["getCustomerById", "singleCustomerIsLoaded"])
  },
}
</script>

<style scoped>

</style>
