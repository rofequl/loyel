<template>
  <div class="container-fluid p-0">
    <div class="dashboard-title">
      <h4><i class="fa fa-address-card mr-2"></i>Store Settings</h4>
    </div>
    <div class="clearfix"></div>
    <div class="section-wrapper">
      <StoreDetails/>
      <SocialDetails/>
      <FinancialDetails/>
      <ContactDetails/>
    </div>
  </div>
</template>

<script>
import StoreDetails from "@/components/seller/account/StoreDetails";
import SocialDetails from "@/components/seller/account/SocialDetails";
import FinancialDetails from "@/components/seller/account/FinancialDetails";
import ContactDetails from "@/components/seller/account/ContactDetails";

export default {
  components: {StoreDetails, SocialDetails, FinancialDetails, ContactDetails},
  name: "Store"
}
</script>

<style scoped>

</style>
