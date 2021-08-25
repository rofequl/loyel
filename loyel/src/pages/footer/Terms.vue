<template>
  <div>
    <TopInfo/>
    <a-spin size="large" class="w-100" style="min-height: 400px" :spinning="loading" tip="Loading...">
      <div class="container">
        <div class="row">
          <b-col class="my-3">
            <div class="deepSelectors" v-html="terms_condition"></div>
          </b-col>
        </div>
      </div>
    </a-spin>
  </div>
</template>

<script>
import TopInfo from "@/components/helper/TopInfo";
import {mapGetters} from "vuex";

export default {
  name: "Terms",
  components: {TopInfo},
  data() {
    return {
      loading: false,
    }
  },
  async mounted() {
    this.loading = true
    if (this.terms_condition === '') await this.$store.dispatch('PAGE_SETUP');
    this.loading = false
  },
  computed: {
    ...mapGetters(["terms_condition"])
  },
}
</script>

<style scoped>

</style>
