<template>
  <section id="promo-part">
    <div class="row">
      <div class="col-lg-3 col-sm-3">
        <div class="promo-box">
          <h2 class="area-title shock">SHOCKING DEAL</h2>
        </div>
      </div>
      <div class="col-lg-9 col-sm-9">
        <div class="deals">
          <div class="deal" v-for="(deals, i) in deal" :key="i">
            <router-link :to="{name: 'Campaign', params: { slug: deals.slug }}"><img :src="showImage(deals.banner)"
                                                                                     :alt="deals.title"></router-link>
          </div>
        </div>
      </div>

    </div>
  </section>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "Deal",
  computed: {
    ...mapGetters(["deal"]),
  }
}
</script>

<style scoped>

</style>
