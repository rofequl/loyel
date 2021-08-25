<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">Marketing
        </span>
        <h3 class="page-title">Subscribers List</h3>
      </div>
    </div>
    <!-- End Page Header -->
    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer my-5">
      <v-client-table :data="subscriberList" :columns="columns" :options="options" class="text-center" ref="table">
        <div slot="serial" slot-scope="props">
          {{ subscriberIndex(props.row.id) }}
        </div>
        <div slot="action" slot-scope="props">
          <a-button-group>
            <a-popconfirm placement="topRight"
                          title="Are you sure delete this subscriber?"
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
  </div>
</template>

<script>
import {mapGetters} from "vuex";
import ApiService from "@/core/services/api.service";

export default {
  name: "Subscribers",
  async mounted() {
    this.$refs.table.setLoadingState(true)
    if (!this.subscriberList.length > 0) await this.$store.dispatch('SUBSCRIBER_LIST');
    this.$refs.table.setLoadingState(false)
  },
  methods: {
    confirm(id) {
      ApiService.delete('subscriber/' + id)
          .then((data) => {
            if (data.data.result === 'Error') {
              this.$notification['error']({
                message: 'Warning',
                description: data.data.message,
                style: {marginTop: '41px'},
              });
            } else {
              this.$store.commit('SUBSCRIBER_REMOVE', id);
              this.$notification['success']({
                message: 'Congratulations',
                description: 'Subscriber delete successfully.',
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
    ...mapGetters(["subscriberList", "subscriberIndex"]),
    columns() {
      return ['serial', 'email', 'action'];
    },
    options() {
      return {
        headings: {
          serial: '#',
        },
        sortable: ['Email'],
        filterable: ['Email']
      }
    }
  }
}
</script>

<style scoped>

</style>
