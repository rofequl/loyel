<template>
  <div>
    <TopInfo/>
    <a-spin size="large" style="min-height: 400px" :spinning="loading" tip="Loading...">
      <div class="container my-5">
        <div class="row">
          <div class="col-md-12 col-lg-3 col-xl-3 col-sm-12 col-12">
            <div class="sidebar-filter-wrapper">
              <ul>
                <li>
                  <p class="filter-title text-dark"><span>Brand List</span></p>
                </li>
                <li v-for="brand in brandList" :key="brand.id">
                  <router-link :to="'/brand/'+brand.slug" :class="brand.id === brand_id?'font-weight-bold':''">
                    {{ brand.name }}
                  </router-link>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-md-12 col-lg-9 col-xl-9 col-sm-12 col-12">
            <a-select default-value="lucy" size="small" class="float-right">
              <a-select-option value="jack">
                New Items
              </a-select-option>
              <a-select-option value="lucy">
                Price - high to low
              </a-select-option>
              <a-select-option value="disabled">
                Price - low to high
              </a-select-option>
              <a-select-option value="Yiminghe">
                Old items
              </a-select-option>
            </a-select>
            <div class="clearfix"></div>
            <div class="product-item-categoryHeader">
              <hr class="first">
              <div class="name" v-if="brand_id !== ''">{{ brandNameById(brand_id).name }}</div>
              <hr class="last">
            </div>
            <div class="row product-list-area">
              <div class="col-lg-3 col-md-4 col-sm-6 col-6 mt-4 owl-carousel" v-for="(products, k) in product_list" :key="k">
                <Product :products="products"/>
              </div>
            </div>
          </div>
        </div>
      </div>
    </a-spin>
  </div>
</template>

<script>
import TopInfo from "@/components/helper/TopInfo";
import {mapGetters} from "vuex";
import ApiService from "@/core/services/api.service";
import Product from "@/components/product/Product";

export default {
  name: "ProductListBrand",
  components: {TopInfo, Product},
  data() {
    return {
      loading: true,
      brand_id: '',
      product_list: [],
    }
  },
  methods: {
    loadBrand() {
      if (this.brandList.length > 0) {
        if (this.$route.params.brand) {
          let brand = this.brandNameBySlug(this.$route.params.brand);
          if (brand) {
            this.brand_id = brand.id;
            this.loadProduct();
          } else this.$router.push({name: "error-404"});
        } else this.loadProduct();
      }
    },
    async loadProduct() {
      let url = '';
      if (this.brand_id !== '') url += 'brand=' + this.brand_id;
      url = 'product-listing?' + url;
      await ApiService.get(url)
          .then(({data}) => {
            this.product_list = data.product_details;
          })
      this.loading = false;
    },
  },
  created() {
    if (!this.brandList.length > 0) this.$store.dispatch('BRAND_LIST');
    this.loadBrand();
  },
  computed: {
    ...mapGetters(["brandList", "brandNameBySlug", "brandNameById"])
  },
  watch: {
    brandList() {
      this.loadBrand();
    },
  }
}
</script>

<style scoped lang="scss">
.sidebar-filter-wrapper ul {
  margin: 0 0 15px;
  padding: 0;
  list-style: none;

  li {
    .filter-title {
      position: relative;
      margin-bottom: 7px;
      font-size: 15px;
      font-weight: 600;
      overflow: hidden;
    }

    a {
      color: #6e6a80;
      font-size: 13px;
      text-transform: capitalize;
    }

    ul {
      margin: 0;
      padding: 3px 5px;
      list-style: none;

      li:before {
        content: "- ";
        color: #6e6a80;
      }
    }
  }
}

.product-item-categoryHeader {
  clear: both;
  display: flex;
  margin-top: 20px;

  hr {
    margin-top: 18px;
    float: left;
    height: 1px;
    flex-grow: 4;
    background-color: #eee;
    border-bottom: none;
  }

  .name {
    flex-grow: 1;
    -webkit-flex-grow: 1;
    float: left;
    font-size: 23px;
    color: #888;
    padding-bottom: 10px;
    text-align: center;
  }
}
</style>
