<template>
  <CCard>
    <CCardHeader>
      Home Slider :
    </CCardHeader>
    <CCardBody>
      <ImagesUpload v-model="photos"/>
      <a-button type="primary" :loading="busy" :disabled="busy" @click="slideUpdate" class="float-right">
        Update
      </a-button>
    </CCardBody>
  </CCard>
</template>

<script>
import ImagesUpload from "@/components/helper/ImagesUpload";
import ApiService from "@/core/services/api.service";
import {mapGetters} from "vuex";

export default {
  name: "Slider",
  components: {ImagesUpload},
  data() {
    return {
      busy: false,
      photos: [],
    };
  },
  methods: {
    slideUpdate: function () {
      this.busy = true;
      ApiService.post('home-slider-update', {imageList: this.photos})
          .then(({data}) => {
            this.$notification['success']({
              message: 'congratulations',
              description: 'Slider update successfully.',
              style: {marginTop: '41px'},
            });
            this.$store.commit('SET_HOME_SLIDER_LIST', JSON.stringify(data));
          })
      let that = this;
      setTimeout(() => {
        that.busy = false
      }, 1000)
    },
    loadSlider() {
      if (this.homeSlider.length > 0) {
        this.photos = this.homeSlider.map(x => {
          return this.showImage(x)
        });
      }
    }
  },
  created() {
    if (!this.homeSlider.length > 0) this.$store.dispatch('HOME_SETUP');
    this.loadSlider();
  },
  watch: {
    homeSlider: function () {
      this.loadSlider();
    }
  },
  computed: {
    ...mapGetters(["homeSlider"])
  },
}
</script>

<style scoped>
.ant-upload-select-picture-card i {
  font-size: 32px;
  color: #999;
}

.ant-upload-select-picture-card .ant-upload-text {
  margin-top: 8px;
  color: #666;
}
</style>
