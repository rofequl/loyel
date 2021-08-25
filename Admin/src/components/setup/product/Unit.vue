<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <h3 class="page-title">Unit</h3>
      </div>
      <div class="col-12 col-sm-6 d-flex align-items-center">
        <div class="mx-auto ml-sm-auto mr-sm-0">
          <CButton @click="$refs.child.modal()" block size="sm" color="info">Add New Unit</CButton>
        </div>
      </div>
    </div>
    <!-- End Page Header -->
    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer my-5">
      <v-client-table ref="table" :data="unitList" :columns="columns" :options="options" class="text-center">
        <div slot="serial" slot-scope="props">
          {{ unitIndex(props.row.id) }}
        </div>
        <div slot="action" slot-scope="props">
          <a-button-group>
            <a-button @click="$refs.child.modal(props.row)" icon="edit"/>
            <a-popconfirm placement="topRight"
                          title="Are you sure delete this unit?"
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
    <UnitAdd ref="child"/>
    <!-- End Modal -->
  </div>
</template>

<script>
import UnitAdd from "@/components/setup/product/UnitAdd";
import ApiService from "@/core/services/api.service";
import {mapGetters} from "vuex";

export default {
  name: "Unit",
  components: {UnitAdd},
  mounted() {
    this.$refs.table.setLoadingState(true)
    if (!this.unitList.length > 0) this.$store.dispatch('UNIT_LIST');
  },
  methods: {
    confirm(id) {
      ApiService.delete('unit/' + id)
          .then((data) => {
            if (data.data.result === 'Error') {
              this.$notification['error']({
                message: 'Warning',
                description: data.data.message,
                style: {marginTop: '41px'},
              });
            } else {
              this.$store.commit('UNIT_REMOVE', id);
              this.$notification['success']({
                message: 'Congratulations',
                description: 'Unit delete successfully.',
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
    ...mapGetters(["unitList", "unitIndex"]),
    columns() {
      return ['serial', 'name', 'action'];
    },
    options() {
      return {
        headings: {
          serial: '#',
          name: 'Unit Name',
        },
        sortable: ['name'],
        filterable: ['name']
      }
    }
  }
}
</script>

<style scoped>

</style>
