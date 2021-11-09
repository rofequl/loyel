<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">Reports
        </span>
        <h3 class="page-title">Sales Report</h3>
      </div>
    </div>
    <!-- End Page Header -->
    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer my-5">
      <v-client-table :data="salesReportList" :columns="columns" :options="options" class="text-center" ref="table">
        <div slot="serial" slot-scope="props">
          {{ salesReportIndex(props.row.sku) }}
        </div>
        <div slot="price" slot-scope="props">
          {{ numberWithCommas(props.row.price) }}
        </div>
        <div slot="discount" slot-scope="props">
          {{ numberWithCommas(props.row.discount) }}
        </div>
        <div slot="total_price" slot-scope="props">
          {{ numberWithCommas(props.row.total_price) }}
        </div>
        <div slot="payment_status" slot-scope="props">
          <span v-if="props.row.payment_status === 0">Unpaid</span>
          <span v-else>Paid</span>
        </div>
      </v-client-table>
    </div>
    <!-- End Datatable -->
  </div>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "SalesReport",
  async mounted() {
    this.$refs.table.setLoadingState(true)
    if (!this.salesReportList.length > 0) await this.$store.dispatch('SALES_REPORT_LIST');
    this.$refs.table.setLoadingState(false)
  },
  computed: {
    ...mapGetters(["salesReportList", "salesReportIndex"]),
    columns() {
      return ['serial', 'date', 'order_code', 'sku', 'quantity', 'price', 'discount', 'shipping', 'total_price', 'payment_status'];
    },
    options() {
      return {
        headings: {
          serial: '#',
        },
        sortable: ['order_code'],
        filterable: ['order_code', 'sku']
      }
    }
  }
}
</script>

<style scoped>

</style>