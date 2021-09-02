<template>
  <div class="category-menu-section">
    <div class="container">
      <div class="row">
        <div class="col">
          <div class="bg-white all-category-menu">
            <ul class="d-flex flex-wrap no-scrollbar">
              <li v-for="categories in categoryList" :key="categories.id">
                <a href="javascript:" v-scroll-to="'#na'+categories.id" class="row align-items-center">
                  <div class="col-md-3">
                    <b-img-lazy class="cat-image"
                                :src="showImage(categories.icon)"
                                alt="cat-image"></b-img-lazy>
                  </div>
                  <div class="col-md-9">
                    <div class="cat-name">{{ categories.name }}</div>
                  </div>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>

      <div class="my-3 bg-white rounded" v-for="categories in categoryList" :key="categories.id" :id="'na'+categories.id" style="border: 1px solid #e2e3e4;">
        <div class="sub-category-menu active" id="0">
          <h3 class="category-name border-bottom pb-2">
            <router-link
                :to="'category/'+categories.slug">{{ categories.name }}
            </router-link>
          </h3>
          <div class="card-columns">
            <div class="card shadow-none border-0" v-for="subcategories in subcategoryById(categories.id)"
                 :key="subcategories.id">
              <h6 class="mb-3">
                <router-link :to="'category/'+categories.slug+'/'+subcategories.slug">{{
                    subcategories.name
                  }}
                </router-link>
              </h6>
              <ul class="mb-3">
                <li class="w-100" v-for="subsubcategories in subsubcategoryById(subcategories.id)"
                    :key="subsubcategories.id">
                  <router-link :to="'category/'+categories.slug+'/'+subcategories.slug+'/'+subsubcategories.slug">
                    {{ subsubcategories.name }}
                  </router-link>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import {mapGetters} from "vuex";

export default {
  name: "Category",
  created() {
    if (!this.categoryList.length > 0) this.$store.dispatch('CATEGORY_LIST');
    if (!this.subcategoryList.length > 0) this.$store.dispatch('SUBCATEGORY_LIST');
    if (!this.subsubcategoryList.length > 0) this.$store.dispatch('SUBSUBCATEGORY_LIST');
  },
  computed: {
    ...mapGetters(["categoryList", "subcategoryList", "subsubcategoryList", "subcategoryById", "subsubcategoryById", "homeSlider"])
  },
}
</script>

<style scoped lang="scss">
.all-category-menu {
  ul {
    margin: 30px 0 10px;
    padding: 0;
    list-style: none;
    background-color: white;
    position: relative;
    box-shadow: 0 8px 8px rgba(0, 0, 0, 0.05);

    li {
      float: left;
      width: 16.667%;
      padding: 12px 10px;
      position: relative;
      transition: all 0.3s;
      -webkit-transition: all 0.3s;
      min-height: 59px;
      display: -ms-flexbox;
      display: flex;
      -ms-flex-align: center;
      align-items: center;
      border: 0.002rem solid #eae3e3;

      a {
        color: #5d5d5d;
        font-weight: 700;
        font-size: 12px;
        line-height: 1.3;
        flex: 1 1 auto;
        margin-right: 0;
        margin-left: 0;

        .cat-image {
          max-width: 27px;
          min-width: 27px;
          padding-left: 5px;
          height: auto;
          opacity: 0.5;
        }

        .cat-name {
          overflow: hidden;
          text-overflow: ellipsis;
          display: -webkit-box;
          -webkit-line-clamp: 2;
          -webkit-box-orient: vertical;
        }
      }
    }

    li:before {
      border-left: 1px solid #f3f1f1;
      border-bottom: 1px solid #f3f1f1;
      height: calc(100% + 4px);
      width: calc(100% + 4px);
      top: -2px;
      left: -2px;
      transition: all 0.3s;
      -webkit-transition: all 0.3s;
    }
  }

  ul:before {
    border-top: 1px solid #f3f1f1;
    border-right: 1px solid #f3f1f1;
    height: 100%;
    width: 100%;
    top: 0;
    left: 0;
  }
}

.sub-category-menu {
  padding: 50px 100px;

  h3 {
    font-size: 22px;
    margin-bottom: 22px;

    a {
      color: #e62e04;
      font-weight: 500;
    }
  }

  h6 {
    a {
      color: #e62e04;
      font-weight: 500;
    }
  }

  ul {
    padding: 0;
    list-style: none;
    width: calc(100% + 20px);
    margin: 0 0 0 -10px;

    li {
      float: left;

      a {
        display: block;
        padding: 3px 10px;
        color: #777474;
      }
    }
  }
}

</style>

