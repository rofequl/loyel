<template>
  <a-card style="width: 100%;border-radius: 20px" class="mt-4 p-0">
    <table v-for="(cart, i) in order_list" :key="i" class="mt-4 w-100">
      <tr>
        <td>
          <router-link :to="'/product/'+cart.slug" target="_blank">
            <img :src="showImage(cart.main_image)" fluid
                   alt="Responsive image" class="border"
                   style="max-width: 80px">
          </router-link>
        </td>
        <td class="p-2 w-75">
          <router-link :to="'/product/'+cart.slug" target="_blank" style="color: #2f2c2c">
            <h6 class="mb-0" style="font-size: 15px">{{ cart.name }}</h6>
            <p class="mb-0 text-muted" style="font-size: 12px" v-if="cart.variation === 1">
                          <span v-for="(variation, k) in cart.variation_value" :key="k" class="mr-2">
                            <span class="font-weight-bold text-capitalize">{{ k }}: </span>{{ variation }}
                          </span>
            </p>
          </router-link>
          <h4 style="font-size: 14px" class="product-price font-weight-bold mt-1">৳ {{ cart.total_discount }}
            <small v-if="cart.discount" style="text-decoration: line-through" class="old-price ml-2">( ৳ {{
                cart.price
              }} )</small>
            <small v-if="cart.discount" class="text-danger bg-light p-1 ml-2" style="font-size: 12px">
              {{ cart.discount_value }}
            </small></h4>
          <p class="mb-0 font-weight-bold" style="font-size: 12px;color: #00aced">
            Free Shipping</p>
        </td>
        <td>
          Qty: <span style="color: black">{{cart.qty}}</span><br>
          Total: <span style="color: black">৳ {{cart.total_price}}</span>
        </td>
      </tr>
    </table>
  </a-card>
</template>

<script>
export default {
  props: ['order_list'],
  name: "OrderList"
}
</script>

<style scoped>

</style>
