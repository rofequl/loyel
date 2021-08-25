<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">Marketing
        </span>
        <h3 class="page-title">Flash Deals</h3>
      </div>
      <div class="col-12 col-sm-6 d-flex align-items-center">
        <div class="mx-auto ml-sm-auto mr-sm-0">
          <CButton @click="$router.push('/marketing/flash-deals-create')" block size="sm" color="info">Add New Flash
            Deals
          </CButton>
        </div>
      </div>
    </div>
    <!-- End Page Header -->
    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer my-5">
      <v-client-table :data="dealsList" :columns="columns" :options="options" class="text-center">
        <div slot="serial" slot-scope="props">
          {{ dealsIndex(props.row.id) }}
        </div>
        <div slot="banner" slot-scope="props">
          <img :src="showImage(props.row.banner)" class="border" width="80px">
        </div>
        <div slot="expired" slot-scope="props">
          <span v-if="props.row.expired === 1">{{ props.row.expired_date | moment("dddd, MMMM Do YYYY") }}</span>
        </div>
        <div slot="status" slot-scope="props">
          <a-switch checked-children="Yes" un-checked-children="No"
                    :checked="props.row.status === 1" @change="value => onChange(value, props.row.id)"/>
        </div>
        <div slot="action" slot-scope="props">
          <a-button-group>
            <a-button @click="$router.push({name: 'flash-edit', params :{slug : props.row.slug}})" icon="edit"/>
            <a-popconfirm placement="topRight"
                          title="Are you sure delete this deal?"
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
import {mapActions, mapGetters} from "vuex";
import ApiService from "@/core/services/api.service";

export default {
  name: "FlashDeal",
  methods: {
    ...mapActions(['DEALS_ACTIVE']),
    confirm(id) {
      ApiService.delete('flash-deals/' + id)
          .then((data) => {
            if (data.data.result === 'Error') {
              this.$notification['error']({
                message: 'Warning',
                description: data.data.message,
                style: {marginTop: '41px'},
              });
            } else {
              this.$store.commit('DEALS_REMOVE', id);
              this.$notification['success']({
                message: 'Congratulations',
                description: 'Deal delete successfully.',
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
    onChange(checked, id) {
      const {DEALS_ACTIVE} = this;
      if (checked)
        DEALS_ACTIVE({active: 1, id: id})
      else
        DEALS_ACTIVE({active: 0, id: id})
    },
  },
  created() {
    if (!this.dealsList.length > 0) this.$store.dispatch('DEALS_LIST');
  },
  computed: {
    ...mapGetters(["dealsList", "dealsIndex"]),
    columns() {
      return ['serial', 'title', 'banner', 'expired', 'status', 'action'];
    },
    options() {
      return {
        headings: {
          serial: '#',
          title: 'Deal Title',
          logo: 'Deal Banner',
          expired: 'Expired Date',
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
