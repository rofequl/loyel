<template>
  <div>
    <TopInfo/>
    <a-spin size="large" class="w-100" style="min-height: 400px" :spinning="loading" tip="Loading...">
      <div class="container">
        <div class="row">
          <b-col class="my-3">
            <div class="deepSelectors" v-html="privacy"></div>
          </b-col>
        </div>
      </div>
    </a-spin>
  </div>
</template>

<script>
import {mapGetters} from "vuex";
import TopInfo from "@/components/helper/TopInfo";

export default {
  name: "Privacy",
  components: {TopInfo},
  data() {
    return {
      loading: false,
    }
  },
  async mounted() {
    this.loading = true
    if (this.privacy === '') await this.$store.dispatch('PAGE_SETUP');
    this.loading = false
  },
  computed: {
    ...mapGetters(["privacy"])
  },
}
</script>

<style scoped>
.deepSelectors >>> img {
  width: 100%;
}
</style>
