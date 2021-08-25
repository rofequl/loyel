<template>
  <div class="home-slider">
    <a-carousel :autoplay="true" class="custom-container">
      <div class="single-slider" v-for="(photo, k) in homeSlider" :key="k">
        <img width="100%" :style="{height: '385px!important'}" :src="showImage(photo)" alt="Slider Image">
      </div>
    </a-carousel>
  </div>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "Slider",
  computed: {
    ...mapGetters(["homeSlider"])
  },
}
</script>

<style scoped>
.custom-container {
  height: 65vh;
  margin: 0 auto;
}
.ant-carousel >>> .slick-dots{
  bottom: 35px;
}
.ant-carousel >>> .slick-dots li button{
  height: 15px;
  width: 15px;
  border-radius: 50%;
  background: #625c5c;
  border: 1px solid #090808 !important;
}

.ant-carousel >>> .slick-dots li.slick-active button{
  background: #ffffff!important;
  border: 1px solid #ffffff!important;
}

</style>
