<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">Marketing
        </span>
        <h3 class="page-title">Request for Quotation</h3>
      </div>
    </div>
    <!-- End Page Header -->
    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer my-5">
      <v-client-table :data="quotationList" :columns="columns" :options="options" class="text-center" ref="table">
        <div slot="serial" slot-scope="props">
          {{ quotationIndex(props.row.id) }}
        </div>
        <div slot="quantity" slot-scope="props">
          {{ props.row.quantity ? props.row.quantity : ''}} {{props.row.unit ? props.row.unit : ''}}
        </div>
        <div slot="action" slot-scope="props">
          <a-button-group>
            <a-button @click="$refs.child.modal(props.row.email)" icon="mail"/>
            <a-popconfirm placement="topRight"
                          title="Are you sure delete this quotation?"
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
    <SingleMail ref="child"/>
    <!-- End Modal -->
  </div>
</template>

<script>
import {mapGetters} from "vuex";
import ApiService from "@/core/services/api.service";
import SingleMail from "@/components/email/SingleMail";

export default {
  name: "Quotation",
  components: {SingleMail},
  async mounted() {
    this.$refs.table.setLoadingState(true)
    if (!this.quotationList.length > 0) await this.$store.dispatch('QUOTATION_LIST');
    this.$refs.table.setLoadingState(false)
  },
  methods: {
    confirm(id) {
      ApiService.delete('quotation/' + id)
          .then((data) => {
            if (data.data.result === 'Error') {
              this.$notification['error']({
                message: 'Warning',
                description: data.data.message,
                style: {marginTop: '41px'},
              });
            } else {
              this.$store.commit('QUOTATION_REMOVE', id);
              this.$notification['success']({
                message: 'Congratulations',
                description: 'Quotation delete successfully.',
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
    }
  },
  computed: {
    ...mapGetters(["quotationList", "quotationIndex"]),
    columns() {
      return ['serial', 'product', 'email', 'quantity', 'action'];
    },
    options() {
      return {
        headings: {
          serial: '#',
          product: 'Product Name',
        },
        filterable: ['email']
      }
    }
  }
}
</script>

<style scoped>

</style>
