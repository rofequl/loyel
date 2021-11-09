<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">Reports
        </span>
        <h3 class="page-title">Most Viewed Products</h3>
      </div>
    </div>
    <!-- End Page Header -->
    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer my-5">
      <v-client-table :data="mostViewedList" :columns="columns" :options="options" class="text-center" ref="table">
        <div slot="serial" slot-scope="props">
          {{ mostViewedIndex(props.row.sku) }}
        </div>
      </v-client-table>
    </div>
    <!-- End Datatable -->
  </div>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "MostViewed",
  async mounted() {
    this.$refs.table.setLoadingState(true)
    if (!this.mostViewedList.length > 0) await this.$store.dispatch('MOST_VIEWED_LIST');
    this.$refs.table.setLoadingState(false)
  },
  computed: {
    ...mapGetters(["mostViewedList", "mostViewedIndex"]),
    columns() {
      return ['serial', 'name', 'sku', 'store', 'view'];
    },
    options() {
      return {
        headings: {
          serial: '#',
          name: 'Product Name',
          view: 'Total Views',
        },
        sortable: ['name'],
        filterable: ['name', 'sku']
      }
    }
  }
}
</script>

<style scoped>

</style>