<template>
  <div class="col-12 col-sm-9 col-md-5 col-lg-5 col-xl-5 mt-2 order-3 order-sm-2 ">
    <div class="search-box">
      <form>
        <input type="search" ref="input" placeholder="Search" aria-label="Search" @focus="debounceName"
               @keyup="debounceName" v-model="search" class="form-control position-relative">
        <button type="submit" class="btn-search"><i class="fa fa-search" aria-hidden="true"></i></button>
      </form>
      <div
          class="typed-search-box bg-white rounded shadow-lg position-absolute left-0 top-100 w-100"
          style="min-height: 200px" v-show="suggestion" v-closable="{exclude: ['input'],handler: 'onClose'}">
        <div class="search-nothing p-3 text-center fs-16" v-if="Object.keys(suggestion_list).length === 0">Sorry,
          nothing
          found for <strong>"{{ search }}"</strong></div>
        <div id="search-content" class="text-left" v-else>
          <div v-if="suggestion_list.keywords.length > 0">
            <div class="px-2 py-1 text-uppercase fs-10 text-right text-muted bg-soft-secondary">Popular Suggestions
            </div>
            <ul class="list-group list-group-raw">
              <li class="list-group-item py-1" v-for="(keywords, k) in suggestion_list.keywords" :key="k">
                <router-link class="text-reset hov-text-primary" @click.native="onClose"
                             :to="{name: 'category', query: { key: keywords}}">{{ keywords }}
                </router-link>
              </li>
            </ul>
          </div>
          <div v-if="suggestion_list.categories.length > 0">
            <div class="px-2 py-1 text-uppercase fs-10 text-right text-muted bg-soft-secondary">Category Suggestions
            </div>
            <ul class="list-group list-group-raw">
              <li class="list-group-item py-1" v-for="(categories, k) in suggestion_list.categories" :key="k">
                <router-link class="text-reset hov-text-primary" @click.native="onClose"
                             :to="{name: 'category', params: { cat: categories.slug}}">{{
                    categories.name
                  }}
                </router-link>
              </li>
            </ul>
          </div>
          <div v-if="suggestion_list.products.length > 0">
            <div class="px-2 py-1 text-uppercase fs-10 text-right text-muted bg-soft-secondary">Products</div>
            <ul class="list-group list-group-raw">
              <li class="list-group-item" v-for="(products, k) in suggestion_list.products" :key="k">
                <router-link class="text-reset"
                             :to="{name: 'Product', params: { slug: products.slug}}" @click.native="onClose">
                  <div class="d-flex search-product align-items-center">
                    <div class="mr-3">
                      <img class="size-40px img-fit rounded"
                           :src="showImage(products.thumbnail_img)"
                           alt="">
                    </div>
                    <div class="flex-grow-1 overflow--hidden minw-0">
                      <div class="product-name text-truncate fs-14 mb-5px text-nowrap">
                        {{ products.name }}
                      </div>
                      <div class="">
                      <span class="fw-600 fs-16 text-primary"><span class="currency">৳</span>{{
                          products.discount
                        }}</span>
                      </div>
                    </div>
                  </div>
                </router-link>
              </li>
            </ul>
          </div>
          <div v-if="suggestion_list.shop.length > 0">
            <div class="px-2 py-1 text-uppercase fs-10 text-right text-muted bg-soft-secondary">Shops</div>
            <ul class="list-group list-group-raw">
              <li class="list-group-item" v-for="(shop, k) in suggestion_list.shop" :key="k">
                <router-link class="text-reset"
                             :to="{name: 'shop', params: { id: encode(shop.id)}}" @click.native="onClose">
                  <div class="d-flex search-product align-items-center">
                    <div class="mr-3">
                      <img class="size-40px img-fit rounded"
                           :src="showImage(shop.shop_logo)"
                           alt="">
                    </div>
                    <div class="flex-grow-1 overflow--hidden minw-0">
                      <div class="product-name text-truncate fs-14 mb-5px text-nowrap">
                        {{ shop.shop_name }}
                      </div>
                      <span style="font-size: 11px;color: #91a6af">{{ shop.shop_description }}</span>
                    </div>
                  </div>
                </router-link>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import ApiService from "@/core/services/api.service";
import {debounce} from "lodash";

export default {
  name: "Search",
  data() {
    return {
      search: '',
      search_key: '',
      suggestion: false,
      suggestion_list: [],
    }
  },
  methods: {
    searching() {
      if (this.search === '') {
        this.suggestion_list = [];
        this.search_key = '';
        this.suggestion = false;
      } else {
        this.suggestion = true;
      }
      if (this.search !== this.search_key) {
        let url = 'search-result?' + 'keyword=' + this.search;
        ApiService.get(url)
            .then(({data}) => {
              this.suggestion_list = data;
              this.search_key = this.search;
            })
            .catch(err => {
              this.$message.warning(err);
              this.suggestion = false;
            })
      }
    },
    onClose() {
      this.suggestion = false
    },
  },
  created() {
    this.debounceName = debounce(this.searching, 500)
  },
}
</script>

<style scoped>
.typed-search-box {
  overflow-y: auto;
  max-height: 83vh;
}

.bg-soft-secondary {
  background-color: #8f97ab26 !important;
}

.fs-10 {
  font-size: 0.625rem !important;
}

.list-group-raw .list-group-item {
  border: 0;
}

.size-40px {
  width: 40px !important;
}

.img-fit {
  max-height: 100%;
  width: 100%;
  object-fit: cover;
}

.minw-0 {
  min-width: 0;
}

.text-primary {
  color: #27a243 !important;
}

.fs-16 {
  font-size: 1rem !important;
}

.fw-600 {
  font-weight: 600 !important;
}
</style>
