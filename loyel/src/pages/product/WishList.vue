<template>
  <div>
    <TopInfo/>
    <a-spin size="large" style="min-height: 400px" :spinning="loading" tip="Loading...">
      <div v-if="wishlistProductList.length > 0" class="container my-5">
        <div class="row">
          <div class="col-12">
            <a-divider orientation="left"><h4 class="mb-0">Wishlist Product</h4></a-divider>
          </div>

          <div class="m-product-card m-product-card--full-width" v-for="(products, k) in wishlistProductList" :key="k">
            <router-link :to="{name: 'Product', params: { slug: products.slug}}">
              <div class="m-product-card__image"><img alt="Thai Boxing Short #  Retro"
                                                      :src="showImage(products.thumbnail_img)">
              </div>
              <div class="m-product-card__info">
                <div>
                  <div class="info__name  info__name--unwrapped">{{ products.name }}</div>
                  <div class="info__price">
                    <div class="price__amount"><span class="amount__original">৳ {{ products.discount }}</span></div>
                  </div>
                </div>
              </div>
            </router-link>
            <div class="m-product-card__remove sprite" @click="wishListRemove(products.slug)"></div>
            <div class="m-product-card__add-to-cart"><a
                href="#"
                class="add-to-cart__add btn btn--large btn--tertiary">Add to Cart</a></div>
          </div>
        </div>
      </div>
      <div v-else class="container my-5 text-center">
        <img src="@/assets/image/wishlist_empty.png" class="d-block mx-auto" width="30%">
        <h5 class="mb-0">Add items to your Wishlist</h5>
        <p class="text-muted mb-3">Your favourite items will be saved here</p>
        <router-link class="text-danger font-weight-bold" to="/">START SHOPPING</router-link>
      </div>
    </a-spin>
  </div>
</template>

<script>
import TopInfo from "@/components/helper/TopInfo";
import {mapGetters} from "vuex";

export default {
  components: {TopInfo},
  name: "WishList",
  data() {
    return {
      loading: false,
    }
  },
  async mounted() {
    this.loading = true
    if (!this.wishlistProductList.length > 0 && this.isAuthenticated) await this.$store.dispatch('WISHLIST_PRODUCT');
    this.loading = false
  },
  methods: {
    wishListRemove(slug) {
      this.$store.dispatch('ADD_TO_WISHLIST', {action: 'remove', slug: slug})
          .then((data) => {
            this.$store.commit('SET_USERS_WISHLIST', data.my_wishlist);
            this.$store.commit('REMOVE_WISHLIST_PRODUCT', slug);
            this.$store.commit('EMPTY_PRODUCT');
            this.$message.success('Remove from your Wishlist.', 2);
          })
          .catch(error => {
            this.$notification['error']({
              message: 'Warning',
              description: ((error.response || {}).data || {}).message || 'Something Wrong',
              style: {marginTop: '41px'},
              duration: 4
            })
          })
    }
  },
  computed: {
    ...mapGetters(["wishlistProductList", "isAuthenticated"]),
  }
}
</script>

<style lang="scss">
.m-product-card--full-width {
  padding: 0 16px 40px;
  flex-basis: 20%;
  max-width: 20%;
  box-sizing: border-box;
  margin-top: 16px;
  display: -ms-inline-flexbox;
  display: inline-flex;
  -ms-flex-negative: 0;
  flex-shrink: 0;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
  -webkit-box-pack: justify;
  -ms-flex-pack: justify;
  justify-content: space-between;
  position: relative;

  a {
    color: #33168c;

    .m-product-card__image {
      margin-bottom: 4px;
      border: 1px solid #e4e4e6;
      overflow: hidden;
      position: relative;
      padding-top: 112%;
      width: 100%;

      img {
        position: absolute;
        top: 0;
        min-height: 1px;
        -webkit-transition: all .2s ease-in-out;
        -o-transition: all .2s ease-in-out;
        transition: all .2s ease-in-out;
        width: 100%;
        border: 0;
      }
    }

    .m-product-card__info {
      display: -webkit-box;
      display: -ms-flexbox;
      display: flex;
      -webkit-box-orient: vertical;
      -webkit-box-direction: normal;
      -ms-flex-direction: column;
      flex-direction: column;
      -webkit-box-flex: 1;
      -ms-flex-positive: 1;
      flex-grow: 1;
      -webkit-box-pack: justify;
      -ms-flex-pack: justify;
      justify-content: space-between;

      .info__name {
        font-size: 14px;
        text-align: left;
        white-space: nowrap;
        color: #282c3f;
        margin: 0 auto 2px;
        overflow: hidden;
        -o-text-overflow: ellipsis;
        text-overflow: ellipsis;
        line-height: 1.2;
        padding-top: 8px;
      }

      .price__amount {
        text-align: left;
        white-space: normal;

        .amount__original {
          display: block;
          margin: 0 0 2px;
          color: #282c3f;
          padding: 0 4px 0 0;
          font-weight: 700;
        }
      }
    }
  }

  .sprite {
    background-image: url(https://assets1.zilingo.com/assets/images/zilingo/sprites/b5746c5267871de08addfea546b9dc53-WB-IconsSprite@2x.png);
    background-repeat: no-repeat;
    background-size: 300px 9900px;
  }

  .m-product-card__remove {
    position: absolute;
    right: 16px;
    top: 8px;
    width: 30px;
    height: 30px;
    cursor: pointer;
    background-position: 0 -4100px;
  }

  .add-to-cart__add {
    color: #e6420b;
    width: 100%;
    text-align: center;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    background: #fff;
    outline: none;
    font-size: 14px;
    text-transform: uppercase;
    font-weight: 400;
    font-family: circular, Arial, sans-serif;
    line-height: 1.4;
    border: 1px solid #e6420b;
    border-radius: 2px;
    margin: 8px 0 0;
    display: inline-block;
    cursor: pointer;
  }
}
</style>
