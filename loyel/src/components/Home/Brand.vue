<template>
  <!-- BRAND AREA START -->
  <section class="brand-area" v-if="topBrand.length > 0">
    <div class="row">
      <div class="col-12">
        <h2 class="area-title">BRAND WE LOVE</h2>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-2 col-md-4 col-sm-4 col-4 p-lg-2" v-for="(brand, k) in topBrand" :key="k"
           @click="$router.push({path: `/brand/${brand.slug}`});">
        <a-tooltip :title="brand.name">
          <img class="image-rounded img-fluid rounded-circle border pointer" :src="showImage(brand.logo)"
               :alt="brand.name">
        </a-tooltip>
      </div>
    </div>
  </section>
  <!-- BRAND AREA END -->
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "Brand",
  computed: {
    ...mapGetters(["topBrand"]),
  }
}
</script>

<style scoped>

</style>
