<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">Shipping
        </span>
        <h3 class="page-title">City</h3>
      </div>
      <div class="col-12 col-sm-6 d-flex align-items-center">
        <div class="mx-auto ml-sm-auto mr-sm-0">
          <CButton @click="$refs.child.modal()" block size="sm" color="info">Add New City</CButton>
        </div>
      </div>
    </div>
    <!-- End Page Header -->

    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer my-5">
      <v-client-table ref="table" :data="cityList" :columns="columns" :options="options" class="text-center">
        <div slot="serial" slot-scope="props">
          {{ cityIndex(props.row.id) }}
        </div>
        <div slot="action" slot-scope="props">
          <a-button-group>
            <a-button @click="$refs.child.modal(props.row)" icon="edit"/>
            <a-popconfirm placement="topRight"
                          title="Are you sure delete this city?"
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

    <!-- Modal -->
    <CityAdd ref="child"/>
    <!-- End Modal -->
  </div>
</template>

<script>
import CityAdd from "@/components/shipping/CityAdd";
import {mapGetters} from "vuex";
import ApiService from "@/core/services/api.service";

export default {
  name: "City",
  components: {CityAdd},
  async mounted() {
    this.$refs.table.setLoadingState(true)
    if (!this.cityList.length > 0) await this.$store.dispatch('CITY_LIST');
    this.$refs.table.setLoadingState(false)
  },
  methods: {
    confirm(id) {
      ApiService.delete('city/' + id)
          .then((data) => {
            if (data.data.result === 'Error') {
              this.$notification['error']({
                message: 'Warning',
                description: data.data.message,
                style: {marginTop: '41px'},
              });
            } else {
              this.$store.commit('CITY_REMOVE', id);
              this.$notification['success']({
                message: 'Congratulations',
                description: 'City delete successfully.',
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
    ...mapGetters(["cityList", "cityIndex"]),
    columns() {
      return ['serial', 'name', 'region', 'action'];
    },
    options() {
      return {
        headings: {
          serial: '#',
          name: 'City Name',
          region: 'Region Name',
        },
        sortable: ['name', 'region'],
        filterable: ['name', 'region']
      }
    }
  }
}
</script>

<style scoped>

</style>
