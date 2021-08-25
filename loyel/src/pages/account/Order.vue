<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <h3 style="color: #5b5555">My Orders</h3>
      </div>
    </div>
    <a-spin size="large" style="min-height: 400px" :spinning="loading" tip="Loading...">
      <div class="row p-1 rounded" style="background-color: #f1e0e6; border: 1px solid #f1e0e6; color: black">
        <div class="col-6">
          Product Details
        </div>
        <div class="col-2 text-center">
          Order Action
        </div>
        <div class="col-2 text-center">
          Order Status
        </div>
        <div class="col-2">
          Amount
        </div>
      </div>
      <div class="rounded mt-3" v-for="(order, k) in orderList" :key="k">
        <div class="row p-1" style="background-color: #f1e0e6; border: 1px solid #f1e0e6">
          <div class="col-6">
            <span>Order ID:</span> <span class="n-text-dark">{{ order.order_code }} </span>
            <router-link :to="'/order/'+ encode(order.order_code)" class="ml-2"> View Detail</router-link>
            <br>

            <span>Order time:</span> <span
              class="n-text-dark"> {{ moment(order.created_at).format('DD MMM YYYY hh:mm:ss') }} </span>
          </div>
          <div class="col-2 text-center">
            <a href="cancel-order" @click.prevent="orderCancel(order.order_code)" class="ml-2"
               v-if="order.delivered_status === 0"> Cancel this order?</a>
          </div>
          <div class="col-2 text-center">
            <span v-if="order.delivered_status === 0" class="badge bg-secondary text-white">Pending</span>
            <span v-else-if="order.delivered_status === 1" class="badge bg-success">Confirmed</span>
            <span v-else-if="order.delivered_status === 2" class="badge bg-info text-white">On Delivery</span>
            <span v-else-if="order.delivered_status === 3" class="badge bg-primary text-white">Delivered</span>
            <span v-else class="badge bg-danger text-white">Cancel</span>
          </div>
          <div class="col-2">
            <span>Order amount:</span><br>
            <span class="n-text-orange">৳ {{ numberWithCommas(order.total) }}</span>
          </div>
        </div>

        <div>
          <div class="row p-1 border-bottom" v-for="(product, index) in order.order_product" :key="index"
               style="background-color: white">
            <div class="col-2">
              <router-link :to="{name: 'Product', params: { slug: product.slug}}"><img height="50" :src="showImage(product.image)">
              </router-link>
            </div>
            <div class="col-8">
              <strong><router-link :to="{name: 'Product', params: { slug: product.slug}}" class="text-muted">{{ product.name }}</router-link></strong><br>
              <small>SKU: {{ product.sku }}</small>
              <p class="mb-0 text-muted" style="font-size: 12px" v-if="product.price_type === 2">
                          <span v-for="(variation, k) in product.product_details" :key="k" class="mr-2">
                            <span class="font-weight-bold text-capitalize">{{ k }}: </span>{{ variation }}
                          </span>
              </p>
            </div>
            <div class="col-2">
              <span>Quantity: {{ product.quantity }} </span><br>
              <span>Price: </span> <span class="n-text-orange">৳ {{ numberWithCommas(product.total) }}</span>
            </div>
          </div>
        </div>
      </div>
    </a-spin>
  </div>
</template>

<script>
import {mapActions, mapGetters} from "vuex";

export default {
  name: "Order",
  data() {
    return {
      loading: false,
    };
  },
  methods: {
    ...mapActions(['ORDER_CANCEL']),
    orderCancel(code) {
      let that = this;
      this.$confirm({
        title: 'Do you Want to cancel this order?',
        okText: 'Yes',
        cancelText: 'No',
        centered: true,
        onOk() {
          that.ORDER_CANCEL({value: 4, order_code: code}).finally(that.$message.success('Your order has been cancel'))
        },
        onCancel() {
          console.log('Cancel');
        },
      });
    },
  },
  async mounted() {
    this.loading = true
    if (!this.orderList.length > 0) await this.$store.dispatch('ORDER_LIST');
    this.loading = false
  },
  computed: {
    ...mapGetters(["orderList"]),
  }
}
</script>

<style scoped lang="scss">
span, a {
  font-size: 12px;
}

.n-text-dark {
  color: #0d0b0b;
}

.n-text-orange {
  color: #d06a00;
}
</style>
