<template>
  <div class="single-product">
    <div class="product-image">
      <router-link :to="{name: 'Product', params: { slug: products.slug}}"><img
          :src="showImage(products.thumbnail_img)" alt="product Image">
      </router-link>
    </div>
    <div class="product-text">
      <div class="product-name">
        <router-link :to="{name: 'Product', params: { slug: products.slug}}">{{ products.name }}
        </router-link>
      </div>
      <div class="product-amount">৳ {{ products.discount }}</div>
      <div class="product-discount" v-if="products.discount_value > 0">
        <span class="old-amount">৳ {{ products.price }}</span>
        <span class="discount-amount">
              {{ products.discount_type == 'Percent' ? '' : '৳' }}
                        {{ products.discount_value }}
                        {{ products.discount_type == 'Percent' ? '%' : '' }}
              Off</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    products: {
      type: [Object],
      required: true
    },
  },
  name: "Product"
}
</script>

<style scoped>
.product-name a{
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2; /* number of lines to show */
  -webkit-box-orient: vertical;
}
</style>
