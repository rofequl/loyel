<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">Seller
        </span>
        <h3 class="page-title">Seller List</h3>
      </div>
      <div class="col-12 col-sm-6 d-flex align-items-center">
        <div class="mx-auto ml-sm-auto mr-sm-0">
          <CButton @click="$refs.child.modal()" block size="sm" color="info">Add New Seller</CButton>
        </div>
      </div>
    </div>
    <!-- End Page Header -->

    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer my-5">
      <v-client-table :data="sellerList" :columns="columns" :options="options" class="text-center" ref="table">
        <div slot="serial" slot-scope="props">
          {{ sellerListIndex(props.row.id) }}
        </div>
        <div slot="photo" slot-scope="props">
          <img :src="showImage(props.row.photo)" width="60px" class="avatar img-fluid img-thumbnail">
        </div>
        <div slot="status" slot-scope="props">
          <a-switch checked-children="Yes" un-checked-children="No"
                    :checked="props.row.status === 0" @change="value => onChange(value, props.row.id)"/>
        </div>
        <div slot="verify" slot-scope="props">
          <a-switch checked-children="Yes" un-checked-children="No"
                    :checked="props.row.seller_verify === 1" @change="value => verifiedSeller(value, props.row.id)"/>
        </div>
        <div slot="action" slot-scope="props">
          <a-button-group>
            <a-button @click="$router.push({name: 'seller-profile',params: {id: props.row.seller_id}})"
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
    <SellerAdd ref="child"/>
    <!-- End Modal -->
  </div>
</template>

<script>
import {mapActions, mapGetters} from "vuex";
import SellerAdd from "@/components/seller/SellerAdd";

export default {
  name: "Seller",
  components: {SellerAdd},
  async mounted() {
    this.$refs.table.setLoadingState(true)
    if (!this.sellerList.length > 0) await this.$store.dispatch('SELLER_LIST');
    this.$refs.table.setLoadingState(false)
  },
  methods: {
    ...mapActions(['SELLER_BLOCK', 'SELLER_VERIFY']),
    onChange(checked, id) {
      const {SELLER_BLOCK} = this;
      if (checked)
        SELLER_BLOCK({active: 0, id: id})
      else
        SELLER_BLOCK({active: 1, id: id})
    },
    verifiedSeller(checked, id) {
      const {SELLER_VERIFY} = this;
      if (checked)
        SELLER_VERIFY({active: 1, id: id})
      else
        SELLER_VERIFY({active: 0, id: id})
    },
  },
  computed: {
    ...mapGetters(["sellerList", "sellerListIndex", "isSellerVerify"]),
    columns() {
      return this.isSellerVerify ? ['serial', 'photo', 'name', 'status', 'verify', 'action'] : ['serial', 'photo', 'name', 'status', 'action']
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
