<template>
  <div class="container-fluid p-0">
    <div class="dashboard-title">
      <h4><i class="fa fa-shopping-basket mr-2"></i>Product List
        <a-button type="primary" class="float-right" @click="$router.push('/seller/product-create')">
          Add New Product
        </a-button>
      </h4>
    </div>
    <div class="clearfix"></div>
    <div class="section-wrapper">
      <!-- Datatable -->
      <div id="people" class="dataTables_wrapper no-footer my-5">
        <v-client-table ref="table" :data="sellerProductList" :columns="columns" :options="options" class="text-center">
          <div slot="serial" slot-scope="props">
            {{ sellerProductIndex(props.row.id) }}
          </div>
          <div slot="thumbnail_img" slot-scope="props">
            <img :src="showImage(props.row.thumbnail_img)" class="border" width="80px">
          </div>
          <div slot="featured" slot-scope="props">
            <a-tag v-if="props.row.featured === 1" color="#108ee9">Yes</a-tag>
            <a-tag v-else color="#f50">No</a-tag>
          </div>
          <div slot="published" slot-scope="props">
            <a-tag v-if="props.row.published === 1" color="#108ee9">Approve</a-tag>
            <a-tag v-else color="#f50">Not Approve</a-tag>
          </div>
          <div slot="action" slot-scope="props">
            <a-button-group>
              <!--            <a-button @click="$refs.child.modal(props.row)" icon="edit"/>-->
              <a-popconfirm placement="topRight"
                            title="Are you sure delete this product?"
                            ok-text="Yes"
                            cancel-text="No">
                <a-button icon="delete"/>
              </a-popconfirm>
            </a-button-group>
          </div>
        </v-client-table>
      </div>
      <!-- End Datatable -->

    </div>
  </div>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "Product",
  async mounted() {
    this.$refs.table.setLoadingState(true)
    if (!this.sellerProductList.length > 0) await this.$store.dispatch('SELLER_PRODUCT_LIST');
    this.$refs.table.setLoadingState(false)
  },
  computed: {
    ...mapGetters(["isBangla", "sellerProductList", "sellerProductIndex"]),
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
          published: 'Approval',
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
