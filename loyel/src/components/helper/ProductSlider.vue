<template>
  <swiper class="swiper product-detail-section mt-0" :options="swiperOption">
    <swiper-slide class="owl-carousel" v-for="(products, k) in product" :key="k">
      <div class="single-product">
        <div class="product-image">
          <router-link :to="{name: 'Product', params: { slug: products.slug}}"><img
              :src="showImage(products.thumbnail_img)" alt="product Image">
          </router-link>
        </div>
        <div class="product-text">
          <div class="product-name">
            <router-link :to="{name: 'Product', params: { slug: products.slug}}">{{ products.name }}
            </router-link>
          </div>
          <div class="product-amount">৳ {{ products.discount }}</div>
          <div class="product-discount" v-if="products.discount_value > 0">
            <span class="old-amount">৳ {{ products.price }}</span>
            <span class="discount-amount">
              {{ products.discount_type == 'Percent' ? '' : '৳' }}
                        {{ products.discount_value }}
                        {{ products.discount_type == 'Percent' ? '%' : '' }}
              Off</span>
          </div>
        </div>
      </div>
    </swiper-slide>
    <div class="swiper-button-prev" slot="button-prev"></div>
    <div class="swiper-button-next" slot="button-next"></div>
  </swiper>
</template>

<script>
export default {
  props: {
    product: {
      type: [Array],
      required: true
    },
  },
  name: "ProductSlider",
  data() {
    return {
      swiperOption: {
        spaceBetween: 10,
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev'
        },
        breakpoints: {
          1500: {
            slidesPerView: 8,
          },
          1200: {
            slidesPerView: 7,
          },
          1000: {
            slidesPerView: 6,
          },
          800: {
            slidesPerView: 5,
          },
          600: {
            slidesPerView: 4,
          },
          500: {
            slidesPerView: 3,
          },
          300: {
            slidesPerView: 2,
          },
        }
      }
    }
  }
}
</script>

<style scoped lang="scss">
.swiper {
  width: 100%;

  .swiper-slide {
    justify-content: center;
    position: relative;
    min-height: 1px;
    float: left;
    display: flex;
    align-items: stretch;
    touch-action: pan-y;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    width: 262.5px;
    margin-right: 20px;
  }

  .swiper-button-prev,
  .swiper-button-next {
    background-color: white;
    border-radius: 5%;
    width: 36px;
    height: 80px;
    border: 1px solid #d2caca;
    z-index: 99999;
    top: 30%;
  }

  .swiper-button-prev:hover,
  .swiper-button-next:hover {
    box-shadow: 0 0 5px 1px rgb(0 0 0 / 15%);
  }

  .swiper-button-prev:after, .swiper-button-next:after {
    font-size: 14px !important;
    font-weight: bold;
    color: black;
  }
}
</style>
