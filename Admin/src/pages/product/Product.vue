<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">Product
        </span>
        <h3 class="page-title">Product List</h3>
      </div>
      <div class="col-12 col-sm-6 d-flex align-items-center">
        <div class="mx-auto ml-sm-auto mr-sm-0">
          <CButton @click="$router.push('/product/product-create')" block size="sm" color="info">Add New Product
          </CButton>
        </div>
      </div>
    </div>
    <!-- End Page Header -->
    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer my-5">
      <v-client-table ref="table" :data="productList" :columns="columns" :options="options" class="text-center">
        <div slot="serial" slot-scope="props">
          {{ productIndex(props.row.id) }}
        </div>
        <div slot="thumbnail_img" slot-scope="props">
          <img :src="showImage(props.row.thumbnail_img)" class="border" width="80px">
        </div>
        <div slot="featured" slot-scope="props">
          <a-switch checked-children="Yes" un-checked-children="No"
                    :checked="props.row.featured === 1" @change="value => onChange(value, props.row.id)"/>
        </div>
        <div slot="published" slot-scope="props">
          <a-switch checked-children="Yes" un-checked-children="No"
                    :checked="props.row.published === 1" @change="value => onChangeP(value, props.row.id)"/>
        </div>
        <div slot="action" slot-scope="props">
          <a-button-group>
            <!--            <a-button @click="$refs.child.modal(props.row)" icon="edit"/>-->
            <a-popconfirm placement="topRight"
                          title="Are you sure delete this product?"
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
import ApiService from "@/core/services/api.service";
import {mapActions, mapGetters} from "vuex";

export default {
  name: "Product",
  mounted() {
    this.$refs.table.setLoadingState(true)
  },
  created() {
    if (!this.productList.length > 0) this.$store.dispatch('PRODUCT_LIST');
  },
  methods: {
    ...mapActions(['FEATURES_PRODUCT_ACTIVE', 'PUBLISHED_PRODUCT_ACTIVE']),
    confirm(id) {
      ApiService.delete('product/' + id)
          .then((data) => {
            if (data.data.result === 'Error') {
              this.$notification['error']({
                message: 'Warning',
                description: data.data.message,
                style: {marginTop: '41px'},
              });
            } else {
              this.$store.commit('PRODUCT_REMOVE', id);
              this.$notification['success']({
                message: 'Congratulations',
                description: 'Product delete successfully.',
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
      const {FEATURES_PRODUCT_ACTIVE} = this;
      if (checked)
        FEATURES_PRODUCT_ACTIVE({active: 1, id: id})
      else
        FEATURES_PRODUCT_ACTIVE({active: 0, id: id})
    },
    onChangeP(checked, id) {
      const {PUBLISHED_PRODUCT_ACTIVE} = this;
      if (checked)
        PUBLISHED_PRODUCT_ACTIVE({active: 1, id: id})
      else
        PUBLISHED_PRODUCT_ACTIVE({active: 0, id: id})
    },
  },
  computed: {
    ...mapGetters(["productList", "productIndex"]),
    columns() {
      return ['serial', 'thumbnail_img', 'name', 'featured', 'published', 'action'];
    },
    options() {
      return {
        headings: {
          serial: '#',
          name: 'Product Name',
          thumbnail_img: 'Product Image',
          featured: 'Featured Product',
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
