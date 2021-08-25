<template>
  <div>
    <TopInfo/>
    <a-spin size="large" style="min-height: 400px" :spinning="loading" tip="Loading...">
      <div class="container my-5">
        <div class="row">
          <div class="col-md-12 col-lg-3 col-xl-3 col-sm-12 col-12">
            <div class="sidebar-filter-wrapper">
              <ul>
                <li>
                  <p class="filter-title text-dark" v-if="category_id !== '' && child_position === 1">{{
                      categoryNameById(category_id).name
                    }}
                  </p>
                  <p v-else class="filter-title text-dark"><span>Related Category</span></p>
                </li>
                <li v-for="subcategories in subcategory_list" :key="subcategories.id">
                  <a href="/"
                     :class="subcategories.id === subcategory_id?'font-weight-bold':''"
                     @click.prevent="changeURL(categoryNameById(category_id).slug, subcategories.slug)">
                    {{ subcategories.name }}
                  </a>
                  <ul v-if="subcategories.id === subcategory_id">
                    <li v-for="sub_subcategories in sub_subcategory_list" :key="sub_subcategories.id">
                      <a href="/"
                         @click.prevent="changeURL(categoryNameById(category_id).slug, subcategories.slug,sub_subcategories.slug )"
                         :class="sub_subcategories.id === sub_subcategory_id?'font-weight-bold':''">
                        {{ sub_subcategories.name }}
                      </a>
                    </li>
                  </ul>
                </li>
                <li v-for="category in category_list" :key="category.id">
                  <a href="#" @click.prevent="changeURL(category.slug)">
                    {{ category.name }}
                  </a>
                </li>
              </ul>
              <hr>
              <ul v-for="(attribute, k) in attribute_option" :key="k">
                <li>
                  <p class="filter-title text-dark"><span>{{ attribute.label }}</span></p>
                </li>
                <li>
                  <a-checkbox-group style="display: grid" v-model="attribute.value" :options="attribute.data"/>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-md-12 col-lg-9 col-xl-9 col-sm-12 col-12">
            <a-breadcrumb class="float-left mt-1">
              <a-breadcrumb-item v-if="category_id !== ''">
                <router-link :to="{name: 'category', params: { cat: categoryNameById(category_id).slug }}">
                  {{ categoryNameById(category_id).name }}
                </router-link>
                <a-menu slot="overlay" v-if="child_position !== 1">
                  <a-menu-item v-for="category in categoryList" :key="category.id">
                    <a href="#" @click.prevent="changeURL(category.slug)">
                      {{ category.name }}
                    </a>
                  </a-menu-item>
                </a-menu>
              </a-breadcrumb-item>
              <a-breadcrumb-item v-if="subcategory_id !== ''">
                <router-link
                    :to="{name: 'category', params: { cat: categoryNameById(category_id).slug, sub: subcategoryNameById(subcategory_id).slug, }}">
                  {{ subcategoryNameById(subcategory_id).name }}
                </router-link>
              </a-breadcrumb-item>
              <a-breadcrumb-item v-if="sub_subcategory_id !== ''">
                {{ subsubcategoryNameById(sub_subcategory_id).name }}
              </a-breadcrumb-item>
              <a-breadcrumb-item>({{ product_list.length }} Results)</a-breadcrumb-item>
            </a-breadcrumb>
            <a-select default-value="lucy" size="small" class="float-right">
              <a-select-option value="jack">
                New Items
              </a-select-option>
              <a-select-option value="lucy">
                Price - high to low
              </a-select-option>
              <a-select-option value="disabled">
                Price - low to high
              </a-select-option>
              <a-select-option value="Yiminghe">
                Old items
              </a-select-option>
            </a-select>
            <div class="clearfix"></div>
            <div class="product-item-categoryHeader">
              <hr class="first">
              <div class="name" v-if="category_id !== '' && child_position === 1">{{
                  categoryNameById(category_id).name
                }}
              </div>
              <div class="name" v-if="subcategory_id !== '' && child_position === 2">
                {{ subcategoryNameById(subcategory_id).name }}
              </div>
              <div class="name" v-if="sub_subcategory_id !== '' && child_position === 3">
                {{ subsubcategoryNameById(sub_subcategory_id).name }}
              </div>
              <hr class="last">
            </div>
            <div class="row product-list-area">
              <div class="col-lg-3 col-md-4 col-sm-6 col-6 mt-4 owl-carousel" v-for="(products, k) in product_list" :key="k">
                <Product :products="products"/>
              </div>
            </div>
          </div>
        </div>
      </div>
    </a-spin>
  </div>
</template>

<script>
import TopInfo from "@/components/helper/TopInfo";
import ApiService from "@/core/services/api.service";
import {mapGetters} from "vuex";
import Product from "@/components/product/Product";

export default {
  name: "ProductList",
  data() {
    return {
      loading: true,
      attribute_option: [],
      category_list: [],
      category_id: '',
      subcategory_id: '',
      sub_subcategory_id: '',
      subcategory_list: [],
      sub_subcategory_list: [],
      child_id: '',
      child_position: 0,
      product_list: [],
      keyword: '',
    }
  },
  methods: {
    changeURL(category = false, subcategory = false, subsubcategory = false) {
      let param = '';
      let query = {};
      if (category) param += '/' + category;
      if (subcategory) param += '/' + subcategory;
      if (subsubcategory) param += '/' + subsubcategory;
      if (this.keyword !== '') query.pro = this.keyword;

      this.$router.push({path: `/category${param}`, query: query});
    },
    loadChild() {
      if (this.$route.params.subcat) {
        this.child_position = 3;
      } else {
        if (this.$route.params.sub) {
          this.child_position = 2;
        } else {
          if (this.$route.params.cat) {
            this.child_position = 1;
          }
        }
      }
    },
    loadCategory() {
      if (this.$route.params.cat) {
        if (this.categoryList.length > 0) {
          let category = this.categoryNameBySlug(this.$route.params.cat);
          if (category) {
            this.category_id = category.id;
            this.child_position === 1 ? this.child_id = category.id : '';
          } else this.$router.push({name: "error-404"});
        }
      } else {
        if (this.categoryList.length > 0) {
          this.category_list = this.categoryList;
          this.child_position = 0;
          this.loadProduct();
        }
      }
    },
    loadSubcategory() {
      if (this.category_id !== '' && this.subcategoryList.length > 0) {
        this.subcategory_list = this.subcategoryById(this.category_id);
        if (this.$route.params.sub) {
          let subcategory = this.subcategoryNameBySlug(this.$route.params.sub);
          if (subcategory) {
            this.subcategory_id = subcategory.id;
            this.child_position === 2 ? this.child_id = subcategory.id : '';
          } else this.$router.push({name: "error-404"});
        }
      }
    },
    loadSubSubcategory() {
      if (this.subcategory_id !== '' && this.subsubcategoryList.length > 0) {
        this.sub_subcategory_list = this.subsubcategoryById(this.subcategory_id);
        if (this.$route.params.subcat) {
          let sub_subcategory = this.subsubcategoryNameBySlug(this.$route.params.subcat);
          if (sub_subcategory) {
            this.sub_subcategory_id = sub_subcategory.id;
            this.child_position === 3 ? this.child_id = sub_subcategory.id : '';
          } else this.$router.push({name: "error-404"});
        }
      }
    },
    loadAttribute() {
      if (this.attributeList.length > 0) {
        this.attribute_option = [];
        let attribute = this.attributeById({position: this.child_position, id: this.child_id})
        for (let i = 0; i < attribute.length; i++) {
          if (attribute[i].value.length > 0) {
            this.attribute_option.unshift({
              label: attribute[i].name,
              data: attribute[i].value,
              value: [],
            });
          }
        }
      }
    },
    async loadProduct() {
      let url = '';
      if (this.child_position === 1) url += 'category=' + this.child_id;
      if (this.child_position === 2) url += 'subcategory=' + this.child_id;
      if (this.child_position === 3) url += 'subsubcategory=' + this.child_id;
      url = 'product-listing?' + url;
      await ApiService.get(url)
          .then(({data}) => {
            this.product_list = data.product_details;
          })
      this.loading = false;
    },
  },
  components: {TopInfo, Product},
  created() {
    if (this.$route.query.pro) this.keyword = this.$route.query.pro;
    this.loadChild();
    if (!this.attributeList.length > 0) this.$store.dispatch('ATTRIBUTE_LIST');
    this.loadCategory();
  },
  computed: {
    ...mapGetters(["categoryList", "subcategoryList", "subsubcategoryList", "attributeList", "subcategoryById", "subsubcategoryById", "categoryNameBySlug",
      "subcategoryNameBySlug", "subsubcategoryNameBySlug", "categoryNameById", "subcategoryNameById", "subsubcategoryNameById", "attributeById"])
  },
  watch: {
    attributeList() {
      this.loadAttribute();
    },
    categoryList() {
      this.loadCategory();
    },
    subcategoryList() {
      this.loadSubcategory();
    },
    category_id() {
      this.loadSubcategory();
    },
    subsubcategoryList() {
      this.loadSubSubcategory();
    },
    subcategory_id() {
      this.loadSubSubcategory();
    },
    child_id() {
      this.loadAttribute();
      this.loadProduct();
    },
    '$route.query.pro'() {

    }
  }
}
</script>

<style scoped lang="scss">
.sidebar-filter-wrapper ul {
  margin: 0 0 15px;
  padding: 0;
  list-style: none;

  li {
    .filter-title {
      position: relative;
      margin-bottom: 7px;
      font-size: 15px;
      font-weight: 600;
      overflow: hidden;
    }

    a {
      color: #6e6a80;
      font-size: 13px;
      text-transform: capitalize;
    }

    ul {
      margin: 0;
      padding: 3px 5px;
      list-style: none;

      li:before {
        content: "- ";
        color: #6e6a80;
      }
    }
  }
}

.product-item-categoryHeader {
  clear: both;
  display: flex;
  margin-top: 20px;

  hr {
    margin-top: 18px;
    float: left;
    height: 1px;
    flex-grow: 4;
    background-color: #eee;
    border-bottom: none;
  }

  .name {
    flex-grow: 1;
    -webkit-flex-grow: 1;
    float: left;
    font-size: 23px;
    color: #888;
    padding-bottom: 10px;
    text-align: center;
  }
}
</style>
