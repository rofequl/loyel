<template>
  <div>
    <TopInfo/>
    <div class="container">
      <div class="row">
        <h5 class="font-weight-bold mt-4" style="color: #7e7474">Help Center</h5>
      </div>
      <b-row>
        <b-col cols="12" md="4" xl="3">
          <div class="sidebar-item-wrapper">
            <div class="collapse show" id="related-category">
              <ul>
                <li v-for="(category, k) in questionCategoryList" :key="k">
                  <router-link :to="{name: 'Questions', query: { cat: category.slug}}" class="font-weight-bold">
                    {{ category.name }}
                  </router-link>
                  <ul class="pl-2">
                    <li v-for="(subcategory, i) in questionSubcategoryById(category.id)" :key="i">
                      <router-link
                          :to="{name: 'Questions', query: { sub: subcategory.slug}}">{{ subcategory.name }}
                      </router-link>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </b-col>
        <b-col cols="12" md="8" xl="9">
          <div class="sidebar-item-wrapper py-2 px-4">
            <div class="border-bottom pb-2">
              <router-link to="/" class="router-link">Home</router-link>
              <router-link v-if="category !== ''" :to="{name: 'Questions', query: { cat: category.slug}}" class="router-link"><i
                  class="fa fa-chevron-right mx-2"></i>
                {{ category.name }}
              </router-link>
              <router-link v-if="subcategory !== ''" :to="{name: 'Questions', query: { sub: subcategory.slug}}" class="router-link"><i
                  class="fa fa-chevron-right mx-2"></i>
                {{ subcategory.name }}
              </router-link>
              <router-link v-if="question !== ''" :to="{name: 'Questions', query: { qu: question.slug}}" class="router-link"><i
                  class="fa fa-chevron-right mx-2"></i>
                {{ question.question }}
              </router-link>
            </div>
            <div>
              <div v-if="subcategory_list.length > 0" class="py-2 my-2 rounded"
                   style="background-color: #ddedf6">
                <router-link v-for="(subcategory, k) in subcategory_list" class="text-success mx-3"
                             :to="{name: 'Questions', query: { sub: subcategory.slug}}" :key="k">
                  {{ subcategory.name }}
                </router-link>
              </div>
              <div class="py-2 my-4" v-if="question_list.length > 0">
                <div v-for="(question, k) in question_list" :key="k" class="mb-2">
                  <router-link class="router-link"
                      :to="{name: 'Questions', query: { qu: question.slug}}">
                    <i class="fa fa-question-circle text-success"></i> {{ question.question }}
                  </router-link>
                </div>
              </div>
              <div class="deepselectors my-4" v-html="question.answer"></div>
            </div>
          </div>
        </b-col>
      </b-row>
    </div>


  </div>
</template>

<script>
import TopInfo from "@/components/helper/TopInfo";
import {mapGetters} from "vuex";

export default {
  name: "FaqDetails",
  components: {TopInfo},
  data() {
    return {
      category: '',
      subcategory: '',
      question: '',
      subcategory_list: [],
      question_list: [],
      child_position: '',
    }
  },
  methods: {
    loadQuery() {
      if (this.$route.query.qu) {
        let question = this.questionBySlug(this.$route.query.qu);
        if (question) {
          this.question = question;
          this.subcategory_list = [];
          this.question_list = [];
          this.category = this.questionCategoryById(this.question.category_id);
          this.subcategory = this.questionSubcategoryId(this.question.subcategory_id)
        } else this.$router.push({name: "error-404"});
      } else if (this.$route.query.sub) {
        let subcategory = this.questionSubcategoryBySlug(this.$route.query.sub);
        if (subcategory) {
          this.question = '';
          this.category = '';
          this.subcategory_list = [];
          this.subcategory = subcategory;
          this.category = this.questionCategoryById(this.subcategory.category_id);
          this.question_list = this.questionBySubcategoryId(this.subcategory.id)
        } else this.$router.push({name: "error-404"});
      } else if (this.$route.query.cat) {
        let category = this.questionCategoryBySlug(this.$route.query.cat);
        if (category) {
          this.question = '';
          this.subcategory = '';
          this.category = category;
          this.subcategory_list = this.questionSubcategoryById(category.id)
          this.question_list = this.questionByCategoryId(category.id)
        } else this.$router.push({name: "error-404"});
      }
    },
  },
  async mounted() {
    if (!this.questionCategoryList.length > 0) await this.$store.dispatch('FAQ_LIST');
    this.loadQuery();
  },
  watch: {
    '$route'() {
      this.loadQuery();
    }
  },
  computed: {
    ...mapGetters(["questionCategoryList", "questionSubcategoryById", "questionCategoryBySlug", "questionSubcategoryBySlug", "questionByCategoryId", "questionCategoryById",
      "questionBySubcategoryId", "questionBySlug", "questionSubcategoryId"]),
  }
}
</script>

<style scoped lang="scss">
.deepselectors > > > img {
  width: 100%;
}

.router-link{
  color: #7b6d6d;
}

.sidebar-item-wrapper {
  margin-bottom: 10px;
  background: #f6f3f3;
  border-radius: 5px;

  ul {
    margin: 0;
    padding: 8px 12px;
    list-style: none;

    li a {
      color: #6e6a80;
      font-size: 13px;
    }

    ul {
      margin: 0;
      padding: 3px 5px;
      list-style: none;

      li {
        position: relative;
      }

      li:before {
        content: "- ";
        color: #6e6a80;
      }
    }
  }
}
</style>