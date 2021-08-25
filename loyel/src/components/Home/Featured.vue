<template>
  <div class="mb-4 mt-5" v-if="featured.length > 0">
    <section class="featured-seller-area">
      <div class="row">
        <div class="col-12">
          <h2 class="area-title">FEATURED PRODUCT</h2>
        </div>
      </div>
      <div class="row product-list-area">
        <div class="col-lg-2 col-md-3 col-sm-4 col-6 mt-4 owl-carousel" v-for="(products, k) in featured" :key="k">
          <Product :products="products"/>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import {mapGetters} from "vuex";
import Product from "@/components/product/Product";

export default {
  name: "Featured",
  components: {Product},
  data() {
    return {
      busy: false
    }
  },
  methods: {
    loadMore() {
      this.busy = true;
      this.$store.dispatch('FEATURED_PRODUCT').finally(() => {
        this.busy = false;
      })
    }
  },
  created() {
    if (!this.featured.length > 0) this.$store.dispatch('FEATURED_PRODUCT');
  },
  computed: {
    ...mapGetters(["featured", "featuredButton"]),
  }
}
</script>

<style scoped>

</style>
