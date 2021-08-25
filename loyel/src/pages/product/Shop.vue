<template>
  <div>
    <TopInfo/>
    <a-spin size="large" style="min-height: 400px; " :spinning="loading" tip="Loading...">
      <div class="container my-5" v-if="shop !== ''">
        <div class="row">

          <div class="col-md-6 mx-auto">
            <div class="d-flex justify-content-center">
              <img height="70" class="ls-is-cached lazyloaded" :src="showImage(shop.shop_details.shop_logo)"
                   alt="Zara Fashion">
              <div class="pl-4 text-left">
                <h1 class="fw-600 h4 mb-0">{{ shop.shop_details.shop_name }}</h1>
                <div class="rating rating-sm mb-1">
                  <a-rate :value="2"/>
                </div>
                <div class="location opacity-60">{{ shop.shop_details.shop_description }}</div>
              </div>
            </div>
          </div>
          <div class="col-12">
            <a-carousel :autoplay="true" class="custom-container mb-5">
              <div class="single-slider" v-for="(photo, k) in JSON.parse(shop.shop_details.shop_banner)" :key="k">
                <img width="100%" :style="{height: '385px!important'}" :src="showImage(photo)" alt="Slider Image">
              </div>
            </a-carousel>

            <a-tabs default-active-key="1">
              <a-tab-pane key="1" tab="All Products">

                <div class="row product-list-area">
                  <div class="col-lg-3 col-md-4 col-sm-6 col-6 mt-4 owl-carousel" v-for="(products, k) in shop.all_product" :key="k">
                    <Product :products="products"/>
                  </div>
                </div>

              </a-tab-pane>
              <a-tab-pane key="2" tab="Top Selling" disabled>
                Content of Tab Pane 2
              </a-tab-pane>
            </a-tabs>
          </div>

        </div>
      </div>
    </a-spin>
  </div>
</template>

<script>
import TopInfo from "@/components/helper/TopInfo";
import ApiService from "@/core/services/api.service";
import Product from "@/components/product/Product";

export default {
  components: {TopInfo, Product},
  name: "Shop",
  data() {
    return {
      shop: '',
      loading: false,
    }
  },
  async mounted() {
    this.loading = true
    await this.loadShopDetails();
    this.loading = false
  },
  methods: {
    async loadShopDetails() {
      let url = 'shop/' + this.decode(this.$route.params.id);
      await ApiService.get(url)
          .then(({data}) => {
            this.shop = data;
          })
          .catch(err => {
            this.$router.push('/');
          })
    }
  }
}
</script>

<style scoped>
.custom-container {
  height: 65vh;
  margin: 0 auto;
}

.ant-carousel >>> .slick-dots {
  bottom: 35px;
}

.ant-carousel >>> .slick-dots li button {
  height: 15px;
  width: 15px;
  border-radius: 50%;
  background: #625c5c;
  border: 1px solid #090808 !important;
}

.ant-carousel >>> .slick-dots li.slick-active button {
  background: #ffffff !important;
  border: 1px solid #ffffff !important;
}
</style>
