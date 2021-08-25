<template>
  <div>
    <a-row>
      <a-col :sm="5">
        <swiper class="swiper" :options="swiperOption">
          <swiper-slide v-for="(image, k) in carousel" :key="k">
            <img @mouseover="$emit('imageChange',image)" :src="showImage(image)"
                 class="product_caro_image rounded"
                 width="60px"
                 height="60px">
          </swiper-slide>
        </swiper>
      </a-col>
      <a-col :sm="19">
        <image-magnifier :src="thumb"
                         :zoom-src="thumb"
                         width="100%"
                         height="320px"
                         zoom-width="500"
                         class="w-100 border"
                         zoom-height="320"></image-magnifier>
      </a-col>
    </a-row>
  </div>
</template>

<script>
import {ImageMagnifier} from 'vue-image-magnifier'

export default {
  name: "ProductImage",
  props: {
    thumb: {
      type: [String],
      required: true
    },
    carousel: {
      type: [Array],
      required: true
    },
  },
  data() {
    return {
      swiperOption: {
        slidesPerView: 4,
        spaceBetween: 6,
        slidesPerGroup: 1,
        mousewheel: true,
        direction: 'vertical',
      }
    }
  },
  components: {ImageMagnifier}
}
</script>

<style scoped lang="scss">
.swiper {
  height: 320px;
  width: 100%;

  .swiper-slide {
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    font-weight: bold;
    background-color: white;
  }
}

.product_caro_image {
  border: 1px solid #80808057;
  cursor: pointer;
  padding: 2px;
}

.product_caro_image:hover {
  box-shadow: 0 0 0 1px #f90000d1;
}
</style>
