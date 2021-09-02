<template>
  <section style="margin-top: 81px" id="categorie">


        <div class="container categorie-menu d-none d-lg-block">
          <swiper class="swiper" :options="swiperOption">
            <swiper-slide class="ml-4">
              <router-link to="/categories">
                All Category
              </router-link></swiper-slide>
            <swiper-slide v-for="categories in categoryList" :key="categories.id">
              <router-link :to="{name: 'category', params:{cat: categories.slug}}">
                {{ isLangBn ? categories.name_bd : categories.name }}
              </router-link>
            </swiper-slide>
            <div class="swiper-button-prev" slot="button-prev"></div>
            <div class="swiper-button-next" slot="button-next"></div>
          </swiper>
        </div>


  </section>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "CategoryMenu",
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
            slidesPerView: 9,
          },
          1200: {
            slidesPerView: 8,
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
  },
  computed: {
    ...mapGetters(["subcategoryList", "subsubcategoryList", "categoryList", "subcategoryById", "subsubcategoryById", "isLangBn"])
  },
}
</script>

<style scoped lang="scss">
.swiper {
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
    white-space: nowrap;

    a {
      font-size: 13px !important;
      color: #3b3c42 !important;
      text-overflow: ellipsis;
      line-height: 20px;
      display: -webkit-box;
    }

    a:hover {
      color: #ff0000 !important;
    }


  }

  .swiper-button-prev,
  .swiper-button-next {
    background-color: #d9c5c5;
    border-radius: 50%;
    width: 20px;
    height: 20px;
    border: 1px solid #d2caca;
    z-index: 99999;
    top: 110%;
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
