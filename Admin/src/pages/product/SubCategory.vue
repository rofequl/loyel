<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">Product
        </span>
        <h3 class="page-title">Sub Category</h3>
      </div>
      <div class="col-12 col-sm-6 d-flex align-items-center">
        <div class="mx-auto ml-sm-auto mr-sm-0">
          <CButton @click="$refs.child.modal()" block size="sm" color="info">Add New Sub Category</CButton>
        </div>
      </div>
    </div>
    <!-- End Page Header -->

    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer my-5">
      <v-client-table ref="table" :data="subcategoryList" :columns="columns" :options="options" class="text-center">
        <div slot="serial" slot-scope="props">
          {{ subcategoryIndex(props.row.id) }}
        </div>
        <div slot="listing" slot-scope="props">
          <a-input-number size="small" :min="1" :max="100000" v-model="props.row.serial"
                          @change="e=>{onSerial({id: props.row.id, serial: e})}"/>
        </div>
        <div slot="action" slot-scope="props">
          <a-button-group>
            <a-button @click="$refs.child.modal(props.row)" icon="edit"/>
            <a-popconfirm placement="topRight"
                          title="Are you sure delete this subcategory?"
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
    <SubCategoryAdd ref="child"/>
    <!-- End Modal -->

  </div>
</template>

<script>
import SubCategoryAdd from "@/components/product/SubCategoryAdd";
import {mapGetters} from "vuex";
import ApiService from "@/core/services/api.service";

export default {
  name: "SubCategory",
  components: {SubCategoryAdd},
  async mounted() {
    this.$refs.table.setLoadingState(true)
    if (!this.subcategoryList.length > 0) await this.$store.dispatch('SUBCATEGORY_LIST');
    this.$refs.table.setLoadingState(false)
  },
  methods: {
    confirm(id) {
      ApiService.delete('subcategory/' + id)
          .then((data) => {
            if (data.data.result === 'Error') {
              this.$notification['error']({
                message: 'Warning',
                description: data.data.message,
                style: {marginTop: '41px'},
              });
            } else {
              this.$store.commit('SUBCATEGORY_REMOVE', id);
              this.$notification['success']({
                message: 'Congratulations',
                description: 'Sub category delete successfully.',
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
    onSerial(data) {
      this.$store.commit('SUBCATEGORY_SERIAL', data)
      this.serial(data);
    },
    serial: _.debounce(function (data) {
      this.$store.dispatch('SUBCATEGORY_SERIAL', data)
    }, 1000)
  },
  computed: {
    ...mapGetters(["isBangla", "subcategoryList", "subcategoryIndex"]),
    columns() {
      return this.isBangla ? ['serial', 'name', 'category', 'name_bd', 'listing', 'action'] : ['serial', 'name', 'category', 'listing', 'action'];
    },
    options() {
      return {
        headings: {
          serial: '#',
          name: 'Sub category Name',
          category: 'Category Name',
          name_bd: 'বিভাগের নাম',
        },
        sortable: ['name', 'category'],
        filterable: ['name', 'category']
      }
    }
  }
}
</script>

<style scoped>

</style>
