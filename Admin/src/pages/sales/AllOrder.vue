<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">Sales
        </span>
        <h3 class="page-title">All Order</h3>
      </div>
    </div>
    <!-- End Page Header -->

    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer my-5">
      <v-client-table ref="table" :data="orderList" :columns="columns" :options="options" class="text-center">
        <div slot="serial" slot-scope="props">
          {{ orderIndex(props.row.id) }}
        </div>
        <div slot="amount" slot-scope="props">
          {{ numberWithCommas(props.row.total) }}
        </div>
        <div slot="delivered_status" slot-scope="props">
          <a-tag v-if="props.row.delivered_status === 0" color="#8c6b73">Pending</a-tag>
          <a-tag v-else-if="props.row.delivered_status === 1" color="#23aa49">Confirmed</a-tag>
          <a-tag v-else-if="props.row.delivered_status === 2" color="#81309c">On Delivery</a-tag>
          <a-tag v-else-if="props.row.delivered_status === 3" color="#2379e4">Delivery</a-tag>
          <a-tag v-else color="#f50">Cancel</a-tag>
        </div>
        <div slot="payment_status" slot-scope="props">
          <a-tag v-if="props.row.payment_status === 0" color="#f50">
            Unpaid
          </a-tag>
          <a-tag v-else color="#23aa49">
            Paid
          </a-tag>
        </div>
        <div slot="action" slot-scope="props">
          <a-button-group>
            <a-button @click="$router.push({name: 'orders-details', params: { code: encode(props.row.order_code)}})"
                      icon="eye"/>
            <a-popconfirm placement="topRight"
                          title="Are you sure delete this order?"
                          ok-text="Yes"
                          cancel-text="No"
                          @confirm="confirm(props.row.id)">
              <a-button icon="delete"/>
            </a-popconfirm>
          </a-button-group>
        </div>
      </v-client-table>
    </div>
    <!-- End Datatable -->


  </div>
</template>

<script>
import {mapGetters} from "vuex";
import ApiService from "@/core/services/api.service";

export default {
  name: "AllOrder",
  async mounted() {
    this.$refs.table.setLoadingState(true)
    if (!this.orderList.length > 0) await this.$store.dispatch('ORDER_LIST');
    this.$refs.table.setLoadingState(false)
  },
  methods: {
    confirm(id) {
      ApiService.delete('order/' + id)
          .then((data) => {
            if (data.data.result === 'Error') {
              this.$notification['error']({
                message: 'Warning',
                description: data.data.message,
                style: {marginTop: '41px'},
              });
            } else {
              this.$store.commit('ORDER_REMOVE', id);
              this.$notification['success']({
                message: 'Congratulations',
                description: 'Order delete successfully.',
                style: {marginTop: '41px'},
              });
            }
          })
          .catch(err => {
            this.$notification['error']({
              message: 'Warning',
              description: ((err.response || {}).data || {}).message || 'Something Wrong',
              style: {marginTop: '41px'},
              duration: 4
            })
          })
    },
  },
  computed: {
    ...mapGetters(["orderList", "orderIndex"]),
    columns() {
      return ['serial', 'order_code', 'no_of_product', 'user_name', 'mobile', 'amount', 'delivered_status', 'payment_status', 'action'];
    },
    options() {
      return {
        headings: {
          serial: '#',
          no_of_product: 'Num. of Products ',
          user_name: 'Customer',
        },
        filterable: ['order_code', 'user_name','mobile']
      }
    }
  }
}
</script>

<style scoped>

</style>
