<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">Staffs
        </span>
        <h3 class="page-title">Staffs List</h3>
      </div>
      <div class="col-12 col-sm-6 d-flex align-items-center">
        <div class="mx-auto ml-sm-auto mr-sm-0">
          <CButton @click="$refs.child.modal()" block size="sm" color="info">Add New Staffs</CButton>
        </div>
      </div>
    </div>
    <!-- End Page Header -->
    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer my-5">
      <v-client-table :data="staffList" :columns="columns" :options="options" class="text-center" ref="table">
        <div slot="serial" slot-scope="props">
          {{ staffListIndex(props.row.id) }}
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
            <a-button @click="$refs.child.modal(props.row)" icon="edit"/>
            <a-popconfirm placement="topRight"
                          title="Are you sure delete this staff?"
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
    <add-staffs ref="child"/>
    <!-- End Modal -->

  </div>
</template>

<script>
import AddStaffs from "@/components/staffs/AddStaffs";
import {mapGetters} from "vuex";
import ApiService from "@/core/services/api.service";

export default {
  name: "Staffs",
  components: {AddStaffs},
  async mounted() {
    this.$refs.table.setLoadingState(true)
    if (!this.staffList.length > 0) await this.$store.dispatch('STAFF_LIST');
    this.$refs.table.setLoadingState(false)
  },
  methods: {
    confirm(id) {
      ApiService.delete('staffs/' + id)
          .then((data) => {
            if (data.data.result === 'Error') {
              this.$notification['error']({
                message: 'Warning',
                description: data.data.message,
                style: {marginTop: '41px'},
              });
            } else {
              this.$store.commit('STAFF_REMOVE', id);
              this.$notification['success']({
                message: 'Congratulations',
                description: 'Staff info delete successfully.',
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
    ...mapGetters(["staffList", "staffListIndex"]),
    columns() {
      return ['serial', 'photo', 'name', 'email', 'mobile', 'address', 'designation', 'action']
    },
    options() {
      return {
        headings: {
          serial: '#',
          name: 'Name',
          photo: 'Image',
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