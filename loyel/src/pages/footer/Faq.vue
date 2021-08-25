<template>
  <div>
    <TopInfo/>
    <div class="container">
      <div class="row">
        <h5 class="font-weight-bold mt-4" style="color: #7e7474">Help Center</h5>
      </div>
    </div>
    <b-container style="color: #7e7474">
      <b-row>
        <b-col cols="12" class="mb-4">
          <p class="text-center" style="text-decoration: underline;text-decoration-color: #f05931;">TOP QUESTION</p>
        </b-col>

        <b-col v-for="(question, k) in topQuestionList" cols="12" md="4" class="mb-3" :key="k">
          <router-link :to="{name: 'Questions', query: { qu: question.slug}}" class="router-link"><i
              class="fa fa-question-circle font-12"></i> {{ question.question }}
          </router-link>
        </b-col>
      </b-row>

      <b-row>
        <b-col cols="12" class="mb-4">
          <p class="text-center" style="text-decoration: underline;text-decoration-color: #f05931;">CATEGORIES</p>
        </b-col>
        <b-col v-for="(category, k) in questionCategoryList" sm="12" md="4" lg="3" class="mb-3" :key="k">
          <router-link :to="{name: 'Questions', query: { cat: category.slug}}" class="w-100">
            <b-card class="p-2 background-change">
              <div>
                <b-img center :src="showImage(category.icon)" width="40" height="40" rounded="circle"
                       alt="Center image"></b-img>
              </div>
              <p class="text-center mt-2">
                {{ category.name }}
              </p>
            </b-card>
          </router-link>
        </b-col>
      </b-row>
    </b-container>
  </div>
</template>

<script>
import {mapGetters} from "vuex";
import TopInfo from "@/components/helper/TopInfo";

export default {
  name: "Faq",
  components: {TopInfo},
  created() {
    if (!this.questionCategoryList.length > 0) this.$store.dispatch('FAQ_LIST');
  },
  computed: {
    ...mapGetters(["questionCategoryList", "topQuestionList"]),
  }
}
</script>

<style scoped>
.font-12 {
  font-size: 14px;
  color: #f05931;
}

.router-link{
  color: #444;
}

.background-change:hover {
  background-color: #f5f6fc;
}
</style>