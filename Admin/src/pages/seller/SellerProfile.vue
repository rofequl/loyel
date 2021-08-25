<template>
  <a-spin class="w-100 h-100" tip="Loading..." :spinning="seller === ''">
    <a-row :gutter="[16,16]" v-if="seller !== ''">
      <a-col :xs="24" :lg="9" :xl="8">
        <ProfileDetails :profile="seller"/>
        <CWidgetBrand
            :right-header="seller.total_product.toString()"
            right-footer="Total Product"
            :left-header="0"
            left-footer="Seller Commission"
            class="w-100"
        >
        </CWidgetBrand>
      </a-col>
      <a-col :xs="24" :lg="15" :xl="16">
        <Details :seller="seller"/>
      </a-col>
    </a-row>
  </a-spin>
</template>

<script>
import {mapGetters} from "vuex";
import ProfileDetails from "@/components/helper/ProfileDetails";
import Details from "@/components/seller/Details";

export default {
  name: "SellerProfile",
  components: {ProfileDetails, Details},
  data() {
    return {
      seller: '',
    }
  },
  methods: {
    getSellerDetails() {
      let seller = this.getSellerById(this.$route.params.id);
      if (seller) {
        setTimeout(() => {
          this.seller = seller
        }, 500);
      } else this.$store.dispatch('SELLER_DETAILS', this.$route.params.id);
    },
  },
  created() {
    this.getSellerDetails();
    this.$message.config({
      top: '63px',
    });
  },
  watch: {
    singleSellerIsLoaded(data) {
      if (data) {
        this.getSellerDetails();
      }
    },
  },
  computed: {
    ...mapGetters(["getSellerById", "singleSellerIsLoaded"])
  },
}
</script>

<style scoped>

</style>
