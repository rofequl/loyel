<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">Setup & Configurations
        </span>
        <h3 class="page-title">Business Type</h3>
      </div>
      <div class="col-12 col-sm-6 d-flex align-items-center">
        <div class="mx-auto ml-sm-auto mr-sm-0">
          <CButton @click="$refs.child.modal()" block size="sm" color="info">Add New Business Type</CButton>
        </div>
      </div>
    </div>
    <!-- End Page Header -->

    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer my-5">
      <v-client-table ref="table" :data="business_typeList" :columns="columns" :options="options" class="text-center">
        <div slot="serial" slot-scope="props">
          {{ business_typeIndex(props.row.id) }}
        </div>
        <div slot="action" slot-scope="props">
          <a-button-group>
            <a-button @click="$refs.child.modal(props.row)" icon="edit"/>
            <a-popconfirm placement="topRight"
                          title="Are you sure delete this business type?"
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
    <BusinessTypeAdd ref="child"/>
    <!-- End Modal -->
  </div>
</template>

<script>
import ApiService from "@/core/services/api.service";
import {mapGetters} from "vuex";
import BusinessTypeAdd from "@/components/setup/BusinessTypeAdd";

export default {
  name: "BusinessType",
  components: {BusinessTypeAdd},
  async mounted() {
    this.$refs.table.setLoadingState(true)
    if (!this.business_typeList.length > 0) await this.$store.dispatch('BUSINESS_TYPE_LIST');
    this.$refs.table.setLoadingState(false)
  },
  methods: {
    confirm(id) {
      ApiService.delete('business-type/' + id)
          .then((data) => {
            if (data.data.result === 'Error') {
              this.$notification['error']({
                message: 'Warning',
                description: data.data.message,
                style: {marginTop: '41px'},
              });
            } else {
              this.$store.commit('BUSINESS_TYPE_REMOVE', id);
              this.$notification['success']({
                message: 'Congratulations',
                description: 'Business type delete successfully.',
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
    ...mapGetters(["business_typeList", "business_typeIndex"]),
    columns() {
      return ['serial', 'name', 'action'];
    },
    options() {
      return {
        headings: {
          serial: '#',
          name: 'Business Type',
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
