<template>
  <div>
    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer">
      <v-client-table ref="table" :data="productList" :columns="columns" :options="options" class="text-center">
        <div slot="serial" slot-scope="props">
          {{ sellerProductIndex(props.row.id) }}
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

import {mapActions} from "vuex";
import ApiService from "@/core/services/api.service";

export default {
  name: "SellerProduct",
  props: {
    productList: {
      required: true
    },
    sellerCode: {
      required: true
    },
  },
  methods: {
    ...mapActions(['FEATURES_PRODUCT_ACTIVE', 'PUBLISHED_PRODUCT_ACTIVE', 'SELLER_UPDATE']),
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
              this.$store.commit('SELLER_UPDATE', this.sellerCode);
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
      const {FEATURES_PRODUCT_ACTIVE, SELLER_UPDATE} = this;
      if (checked)
        FEATURES_PRODUCT_ACTIVE({active: 1, id: id})
      else
        FEATURES_PRODUCT_ACTIVE({active: 0, id: id})
      SELLER_UPDATE(this.sellerCode)
    },
    onChangeP(checked, id) {
      const {PUBLISHED_PRODUCT_ACTIVE, SELLER_UPDATE} = this;
      if (checked)
        PUBLISHED_PRODUCT_ACTIVE({active: 1, id: id})
      else
        PUBLISHED_PRODUCT_ACTIVE({active: 0, id: id})
      SELLER_UPDATE(this.sellerCode)
    },
    sellerProductIndex(id) {
      return this.productList.findIndex(value => value.id === id) + 1;
    }
  },
  computed: {
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
