<template>
  <a-card title="Customers who viewed this item also viewed">
    <div class="product-list-area">
      <product-slider :product="product"/>
    </div>
  </a-card>
</template>

<script>
import ProductSlider from "@/components/helper/ProductSlider";

export default {
  components: {ProductSlider},
  props: {
    product: {
      type: [Object],
      required: true,
    },
  },
  name: "RelatedProduct"
}
</script>

<style scoped>

</style>