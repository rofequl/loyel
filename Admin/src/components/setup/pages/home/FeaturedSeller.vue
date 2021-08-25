<template>
  <div>
    <CCard>
      <CCardHeader>
        Featured Seller :
        <a-tooltip placement="topRight">
          <template slot="title">
            <span>To active this switch you can set the featured seller list.</span>
          </template>
          <a-switch class="float-right" checked-children="Yes" un-checked-children="No"
                    :checked="isFeaturedSeller" @change="onChange"/>
        </a-tooltip>
        <div class="clearfix"></div>
        <p style="font-size: 12px; color: #9b9494">You can't add unverified seller, but if any seller has been
          unverified then remove this from featured seller.</p>
      </CCardHeader>
      <CCardBody v-if="isFeaturedSeller">
        <a-button @click="$refs.child.modal()" type="dashed" class="float-right">
          Add a featured seller
        </a-button>

      </CCardBody>
    </CCard>
    <!-- Modal -->
    <featured-seller-add ref="child"/>
    <!-- End Modal -->
  </div>
</template>

<script>
import {mapActions, mapGetters} from "vuex";
import FeaturedSellerAdd from "@/components/setup/pages/home/add/FeaturedSellerAdd";

export default {
  name: "FeaturedSeller",
  components: {FeaturedSellerAdd},
  methods: {
    ...mapActions(['FEATURED_SELLER_ACTIVE']),
    onChange(checked) {
      const {FEATURED_SELLER_ACTIVE} = this;
      if (checked)
        FEATURED_SELLER_ACTIVE({active: 1})
      else
        FEATURED_SELLER_ACTIVE({active: 0})
    },
  },
  created() {
    if (this.featuredShopList.length === 0) this.$store.dispatch('FEATURED_SHOP_LIST');
  },
  computed: {
    ...mapGetters(["isFeaturedSeller", "featuredShopList"]),
  },
}
</script>

<style scoped>

</style>