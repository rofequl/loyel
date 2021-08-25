<template>
  <CRow class="my-4 justify-content-center">
    <CCol md="12">
      <CCard>
        <a-spin size="large" style="min-height: 400px" :spinning="order === ''" tip="Loading...">
          <CCardHeader>
            Order Details
          </CCardHeader>
          <CCardBody v-if="order !== ''">
            <div class="clearfix float-right d-flex">
              <a-form-model-item label="Payment Status" class="mr-4">
                <a-select style="width: 90px" :default-value="order.payment_status"
                          @change="value => updatePayment(value, order.order_code)">
                  <a-select-option :value="0">
                    Unpaid
                  </a-select-option>
                  <a-select-option :value="1">
                    Paid
                  </a-select-option>
                </a-select>
              </a-form-model-item>

              <a-form-model-item label="Delivery Status">
                <a-select style="width: 120px" :default-value="order.delivered_status"
                          @change="value => updateDelivery(value, order.order_code)">
                  <a-select-option :value="0">
                    Pending
                  </a-select-option>
                  <a-select-option :value="1">
                    Confirmed
                  </a-select-option>
                  <a-select-option :value="2">
                    On Delivery
                  </a-select-option>
                  <a-select-option :value="3">
                    Delivered
                  </a-select-option>
                  <a-select-option :value="4">
                    Cancel
                  </a-select-option>
                </a-select>
              </a-form-model-item>

            </div>
            <div class="clearfix"></div>
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
                      <span v-if="order.delivered_status === 0" class="badge bg-secondary">Pending</span>
                      <span v-else-if="order.delivered_status === 1" class="badge bg-success">Confirmed</span>
                      <span v-else-if="order.delivered_status === 2" class="badge bg-info text-white">On Delivery</span>
                      <span v-else-if="order.delivered_status === 3" class="badge bg-primary text-white">Delivery</span>
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
                      {{ numberWithCommas(order.total) }}
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
            <hr>
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
                      <a :href="viewProduct('slug')"
                         target="_blank"><img height="50" :src="showImage(product.image)">
                      </a>
                    </td>
                    <td class="footable-last-visible" style="display: table-cell;">
                      <strong><a :href="viewProduct('slug')"
                                 target="_blank" class="text-muted">{{ product.name }}</a></strong><br>
                      <small>SKU: {{ product.sku }}</small>
                      <p class="mb-0 text-muted" style="font-size: 12px" v-if="product.price_type === 2">
                          <span v-for="(variation, k) in product.product_details" :key="k" class="mr-2">
                            <span class="font-weight-bold text-capitalize">{{ k }}: </span>{{ variation }}
                          </span>
                      </p>
                    </td>
                    <td class="text-right">{{ numberWithCommas(product.unit_price) }}</td>
                    <td class="text-right">
                      <span v-if="product.discount === 1">
                        {{ numberWithCommas(product.discount_price) }}<br>
                        - {{ product.discount_value }} {{ product.discount_type === "Percent" ? '%' : 'BDT' }}
                      </span>
                    </td>
                    <td class="text-center"> {{ product.quantity }}</td>
                    <td class="text-right">{{ numberWithCommas(product.total) }}</td>
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
                    {{ numberWithCommas(order.subtotal) }}
                  </td>
                </tr>
                <tr>
                  <td>
                    <strong class="text-muted">Shipping :</strong>
                  </td>
                  <td>
                    {{ numberWithCommas(order.shipping) }}
                  </td>
                </tr>
                <tr>
                  <td>
                    <strong class="text-muted">TOTAL :</strong>
                  </td>
                  <td class="text-muted h5">
                    {{ numberWithCommas(order.total) }}
                  </td>
                </tr>
                </tbody>
              </table>
              <div class="text-right mb-4">
                <a-button @click="pdfDownload(order.order_code)" icon="printer"/>
              </div>
            </div>
          </CCardBody>
        </a-spin>
      </CCard>
    </CCol>
  </CRow>
</template>

<script>
import {mapActions, mapGetters} from "vuex";
import {frontend_url} from "@/core/config/app";
import {api_base_url} from '@/core/config/app';

export default {
  name: "OrderDetails",
  data() {
    return {
      order: ''
    }

  },
  methods: {
    ...mapActions(['ORDER_PAYMENT_UPDATE', 'ORDER_DELIVERY_UPDATE']),
    viewProduct(slug) {
      return frontend_url + '/' + slug;
    },
    getOrderDetails() {
      let order = this.getOrderByCode(this.decode(this.$route.params.code));
      if (order) {
        setTimeout(() => {
          this.order = order
        }, 500);
      } else this.$store.dispatch('SINGLE_ORDER', this.decode(this.$route.params.code));
    },
    async updatePayment(value, id) {
      await this.ORDER_PAYMENT_UPDATE({value: value, order_code: id})
      this.customerDetailsUpdate(this.order.customer_id);
      this.$message.success('Payment status update successfully');
    },
    async updateDelivery(value, id) {
      await this.ORDER_DELIVERY_UPDATE({value: value, order_code: id})
      this.customerDetailsUpdate(this.order.customer_id);
      this.$message.success('Delivery Status update successfully');
    },
    customerDetailsUpdate(code) {
      if (this.getCustomerById(code)) this.$store.dispatch('CUSTOMER_DETAILS', code);
    },
    pdfDownload: e => window.location.href = api_base_url + '/invoice/' + e
  },
  created() {
    this.getOrderDetails();
    this.$message.config({
      top: '63px',
    });
  },
  watch: {
    singleOrderIsLoaded(data) {
      if (data) {
        this.getOrderDetails();
      }
    },
  },
  computed: {
    ...mapGetters(["getOrderByCode", "singleOrderIsLoaded", "getCustomerById"])
  },
}
</script>

<style scoped>

</style>
