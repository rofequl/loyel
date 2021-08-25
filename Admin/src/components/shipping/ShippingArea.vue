<template>
  <!-- Datatable -->
  <div id="people" class="dataTables_wrapper no-footer my-5">
    <v-client-table ref="table" :data="areaList" :columns="columns" :options="options" class="text-center">
      <div slot="serial" slot-scope="props">
        {{ areaIndex(props.row.id) }}
      </div>
      <div slot="cost" slot-scope="props">
        <a-input-number step=".02" :formatter="value => `৳ ${value}`"
                        :parser="value => value.replace('৳', '')" style="width: 100%"
                        v-model="props.row.shipping_cost"
                        :min="0" @change="e=>{onSerial({id: props.row.id, shipping_cost: e})}"/>
      </div>
    </v-client-table>
  </div>
  <!-- End Datatable -->
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "ShippingArea",
  async mounted() {
    this.$refs.table.setLoadingState(true)
    if (!this.areaList.length > 0) await this.$store.dispatch('AREA_LIST');
    this.$refs.table.setLoadingState(false)
  },
  methods: {
    onSerial(data) {
      this.$store.commit('AREA_SHIPPING_COST', data)
      this.serial(data);
    },
    serial: _.debounce(function (data) {
      this.$store.dispatch('AREA_SHIPPING_COST', data)
    }, 1000)
  },
  computed: {
    ...mapGetters(["areaList", "areaIndex"]),
    columns() {
      return ['serial', 'name', 'city', 'region', 'cost'];
    },
    options() {
      return {
        headings: {
          serial: '#',
          name: 'Area Name',
          city: 'City Name',
          region: 'Region Name',
          cost: 'Shipping Cost',
        },
        sortable: ['name', 'region', 'city'],
        filterable: ['name', 'region', 'city']
      }
    }
  }
}
</script>

<style scoped>

</style>
