<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <h3 style="color: #5b5555">Orders Details</h3>
      </div>
    </div>
    <a-spin size="large" style="min-height: 400px; width: 100%" :spinning="order === ''" tip="Loading...">
      <a-card v-if="order !== ''" style="width: 100%">
        <a-steps>
          <a-step :status="checkStatus(0)" title="Order placed">
            <i slot="icon" class="fa fa-file-text-o" aria-hidden="true"></i>
          </a-step>
          <a-step :status="checkStatus(1)" title="Confirmed">
            <i slot="icon" class="fa fa-newspaper-o" aria-hidden="true"></i>
          </a-step>
          <a-step :status="checkStatus(2)" title="On delivery">
            <i slot="icon" class="fa fa-truck" aria-hidden="true"></i>
          </a-step>
          <a-step :status="checkStatus(3)" title="Delivered">
            <i slot="icon" class="fa fa-cube" aria-hidden="true"></i>
          </a-step>
        </a-steps>
        <hr class="my-4">
        <div class="row gutters-5">
          <div class="col text-center text-md-left">
            <address>
              <strong class="text-main">{{ order.shipping_address.full_name }}</strong><br>
              {{ order.customer_email }}<br>
              {{ order.shipping_address.phone_number }}<br>
              {{ order.shipping_address.address }}, {{ order.shipping_address.area }},
              {{ order.shipping_address.city }},<br>
              {{ order.shipping_address.region }}
            </address>
          </div>
          <div class="col-md-4 ml-auto">
            <table>
              <tbody>
              <tr>
                <td class="text-main text-bold">Order #</td>
                <td class="text-right text-info text-bold"> {{ order.order_code }}</td>
              </tr>
              <tr>
                <td class="text-main text-bold">Order Status</td>
                <td class="text-right">
                  <span v-if="order.delivered_status === 0" class="badge bg-secondary text-white">Pending</span>
                  <span v-else-if="order.delivered_status === 1" class="badge bg-success">Confirmed</span>
                  <span v-else-if="order.delivered_status === 2" class="badge bg-info text-white">On Delivery</span>
                  <span v-else-if="order.delivered_status === 3" class="badge bg-primary text-white">Delivered</span>
                  <span v-else class="badge bg-danger text-white">Cancel</span>
                </td>
              </tr>
              <tr>
                <td class="text-main text-bold">Order Date</td>
                <td class="text-right">{{ order.created_at }}</td>
              </tr>
              <tr>
                <td class="text-main text-bold">
                  Total amount
                </td>
                <td class="text-right">
                  <span>৳ {{ numberWithCommas(order.total) }}</span>
                </td>
              </tr>
              <tr>
                <td class="text-main text-bold">Payment method</td>
                <td class="text-right">{{ order.payment_type === 1 ? 'Cash on delivery' : '' }}</td>
              </tr>
              </tbody>
            </table>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12 table-responsive">
            <table class="table table-bordered" style="">
              <thead>
              <tr>
                <th width="10%">Photo</th>
                <th class="text-uppercase">Description</th>
                <th class="text-uppercase">Price</th>
                <th class="text-uppercase">Discount</th>
                <th class="text-uppercase">QTY</th>
                <th class="text-uppercase">TOTAL</th>
              </tr>
              </thead>
              <tbody>
              <tr v-for="(product, index) in order.order_product" :key="index">
                <td style="display: table-cell;">
                  <router-link :to="{name: 'Product', params: { slug: product.slug}}"><img height="50"
                                                                                           :src="showImage(product.image)">
                  </router-link>
                </td>
                <td class="footable-last-visible" style="display: table-cell;">
                  <strong>
                    <router-link :to="{name: 'Product', params: { slug: product.slug}}" class="text-muted">
                      {{ product.name }}
                    </router-link>
                  </strong><br>
                  <small>SKU: {{ product.sku }}</small>
                  <p class="mb-0 text-muted" style="font-size: 12px" v-if="product.price_type === 2">
                          <span v-for="(variation, k) in product.product_details" :key="k" class="mr-2">
                            <span class="font-weight-bold text-capitalize">{{ k }}: </span>{{ variation }}
                          </span>
                  </p>
                </td>
                <td class="text-right"><span>৳{{ numberWithCommas(product.unit_price) }}</span></td>
                <td class="text-right">
                      <span v-if="product.discount === 1">
                        ৳{{ numberWithCommas(product.discount_price) }}<br>
                        - {{ product.discount_value }} {{ product.discount_type === "Percent" ? '%' : 'BDT' }}
                      </span>
                </td>
                <td class="text-center"> {{ product.quantity }}</td>
                <td class="text-right"><span>৳{{ numberWithCommas(product.total) }}</span></td>
              </tr>
              </tbody>
            </table>
          </div>
        </div>
        <div class="clearfix float-right">
          <table class="table">
            <tbody>
            <tr>
              <td>
                <strong class="text-muted">Sub Total :</strong>
              </td>
              <td>
                <span>৳ {{ numberWithCommas(order.subtotal) }}</span>
              </td>
            </tr>
            <tr>
              <td>
                <strong class="text-muted">Shipping :</strong>
              </td>
              <td>
                <span>৳ {{ numberWithCommas(order.shipping) }}</span>
              </td>
            </tr>
            <tr>
              <td>
                <strong class="text-muted">TOTAL :</strong>
              </td>
              <td class="text-muted h5">
                <span>৳ {{ numberWithCommas(order.total) }}</span>
              </td>
            </tr>
            </tbody>
          </table>
        </div>
      </a-card>
    </a-spin>
  </div>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "OrderDetails",
  data() {
    return {
      order: '',
    };
  },
  methods: {
    checkStatus(e) {
      return e <= this.order.delivered_status && 4 !== this.order.delivered_status ? 'finish' : 'wait'
    }
  },
  async mounted() {
    if (!this.orderList.length > 0) await this.$store.dispatch('ORDER_LIST');
    let order = this.getOrderByCode(this.decode(this.$route.params.code));
    if (order) {
      setTimeout(() => {
        this.order = order
      }, 500);
    } else await this.$router.push({name: "error-404"});
  },
  computed: {
    ...mapGetters(["getOrderByCode", "orderList"])
  },
}
</script>

<style scoped>
span {
  font-size: 12px;
}
</style>
