<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">Customers
        </span>
        <h3 class="page-title">Customers List</h3>
      </div>
      <div class="col-12 col-sm-6 d-flex align-items-center">
        <div class="mx-auto ml-sm-auto mr-sm-0">
          <CButton @click="$refs.child.modal()" block size="sm" color="info">Add New Customer</CButton>
        </div>
      </div>
    </div>
    <!-- End Page Header -->

    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer my-5">
      <v-client-table :data="customerList" :columns="columns" :options="options" class="text-center" ref="table">
        <div slot="serial" slot-scope="props">
          {{ customerListIndex(props.row.id) }}
        </div>
        <div slot="photo" slot-scope="props">
          <img :src="showImage(props.row.photo)" width="60px" class="avatar img-fluid img-thumbnail">
        </div>
        <div slot="status" slot-scope="props">
          <a-switch checked-children="Yes" un-checked-children="No"
                    :checked="props.row.status === 0" @change="value => onChange(value, props.row.id)"/>
        </div>
        <div slot="action" slot-scope="props">
          <a-button-group>
            <a-button @click="$router.push({name: 'customer-profile',params: {id: props.row.customer_id}})"
                      icon="user"/>
            <a-button @click="$refs.child.modal(props.row)" icon="edit"/>
            <a-popconfirm placement="topRight"
                          title="Are you sure delete this seller?"
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
    <CustomerAdd ref="child"/>
    <!-- End Modal -->
  </div>
</template>

<script>
import {mapActions, mapGetters} from "vuex";
import CustomerAdd from "@/components/customer/CustomerAdd";

export default {
  name: "Customer",
  components: {CustomerAdd},
  async mounted() {
    this.$refs.table.setLoadingState(true)
    if (!this.customerList.length > 0) await this.$store.dispatch('CUSTOMER_LIST');
    this.$refs.table.setLoadingState(false)
  },
  methods: {
    ...mapActions(['CUSTOMER_BLOCK']),
    onChange(checked, id) {
      const {CUSTOMER_BLOCK} = this;
      if (checked)
        CUSTOMER_BLOCK({active: 0, id: id})
      else
        CUSTOMER_BLOCK({active: 1, id: id})
    },
  },
  computed: {
    ...mapGetters(["customerList", "customerListIndex"]),
    columns() {
      return ['serial', 'photo', 'name', 'status', 'action']
    },
    options() {
      return {
        headings: {
          serial: '#',
          name: 'Name',
          photo: 'Image',
          status: 'Block',
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
