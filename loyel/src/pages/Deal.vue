<template>
  <div>
    <TopInfo/>
    <a-spin size="large" style="min-height: 400px" :spinning="loading" tip="Loading...">
      <div class="container mb-5">
        <div class="row justify-content-center">
          <div class="col-xl-2 col-md-2 col-sm-8 col-8">
            <img :src="showImage(banner)" :alt="title" class="d-block mx-auto" width="100%">
          </div>
        </div>
        <h3 class="mb-0 text-center">{{ title }}</h3>
        <div class="row product-list-area">
          <div class="col-12">
            <a-divider orientation="right"><h6 v-if="expired" class="mb-0 d-flex">Ends in:
              <Timer class="ml-md-3"  :endtime="expired_date"/>
            </h6></a-divider>
          </div>
          <div class="col-lg-2 col-md-3 col-sm-4 col-6 mt-4 owl-carousel" v-for="(products, k) in product_list" :key="k">
            <Product :products="products"/>
          </div>
        </div>
      </div>

    </a-spin>
  </div>
</template>

<script>
import ApiService from "@/core/services/api.service";
import TopInfo from "@/components/helper/TopInfo";
import Product from "@/components/product/Product";
import Timer from "@/components/helper/Timer";

export default {
  name: "Deal",
  components: {TopInfo, Product, Timer},
  data() {
    return {
      loading: false,
      expired: false,
      expired_date: '',
      title: '',
      banner: '',
      product_list: [],
    }
  },
  methods: {
    async loadFlashData() {
      this.loading = true;
      await ApiService.get('deal-product-list/' + this.$route.params.slug)
          .then(({data}) => {
            this.title = data.title;
            this.expired = data.expired === 1;
            this.expired_date = data.expired_date;
            this.banner = data.banner;
            this.product_list = data.product;
            console.log(data);
          })
      this.loading = false;
    }
  },
  created() {
    if (this.$route.params.slug) this.loadFlashData();
  }
}
</script>

<style scoped>

</style>
