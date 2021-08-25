<template>
  <div class="product-detail-section">
    <a-spin size="large" style="min-height: 400px" :spinning="product === ''" tip="Loading...">
      <div class="container">
        <div class="row">
          <div class="col-12 my-3" v-if="product !== ''">
            <a-breadcrumb>
              <template slot="separator">
                <i class="fa fa-angle-double-right"></i>
              </template>
              <a-breadcrumb-item>
                <router-link to="/"><i class="fa fa-home"></i> Home</router-link>
              </a-breadcrumb-item>
              <a-breadcrumb-item>
                <router-link :to="{name: 'category', params: { cat: product.category.slug }}">
                  {{ product.category.name }}
                </router-link>
                <a-menu slot="overlay">
                  <a-menu-item v-for="category in categoryList" :key="category.id">
                    <router-link :to="{name: 'category', params: { cat: category.slug }}">
                      {{ category.name }}
                    </router-link>
                  </a-menu-item>
                </a-menu>
              </a-breadcrumb-item>
              <a-breadcrumb-item v-if="product.position >= 2">
                <router-link
                    :to="{name: 'category', params: { cat: product.category.slug, sub: product.subcategory.slug }}">
                  {{ product.subcategory.name }}
                </router-link>
              </a-breadcrumb-item>
              <a-breadcrumb-item v-if="product.position >= 3">
                <router-link
                    :to="{name: 'category', params: { cat: product.category.slug, sub: product.subcategory.slug, subcat: product.subsubcategory.slug }}">
                  {{ product.subsubcategory.name }}
                </router-link>
              </a-breadcrumb-item>
            </a-breadcrumb>
            <div style="width: 100%" class="my-4">
              <a-row>
                <a-col :sm="8">
                  <ProductImage @imageChange="data =>{main_image = showImage(data)}" :thumb="main_image"
                                :carousel="product.caro_image"/>
                </a-col>
                <a-col :sm="16" class="px-3">
                  <div class="product-details">
                    <h5 class="mb-0">{{ product.name }}</h5>
                    <a-rate :value="5"/>
                    <span class="ant-rate-text">(5 Reviews)</span>
                    <div class="mb-3">
                      <label class="mb-0 mr-3">Condition: <span
                          style="color: #999999">{{ product.condition === 1 ? 'New' : 'Used' }}</span></label>
                      <label class="mb-0 mr-3" v-if="product.weight">Weight:
                        <span style="color: #999999">{{ product.weight * 1000 + ' Gram' }}</span></label>
                      <label class="mb-0 mr-3" v-if="product.dimension">Dimension :
                        <span style="color: #999999">{{ product.dimension }}</span></label>
                      <label class="mb-0 float-right">
                        <a-popover title="Share this product" trigger="click" placement="bottomRight">
                          <template slot="content">
                            <ShareNetwork
                                :style="{backgroundColor: '#1877f2'}"
                                class="text-white px-2 py-1 mr-2 rounded"
                                network="facebook"
                                :url="currentUrl"
                                :title="product.name"
                                :description="'Buy ' + product.name + 'online at '+ $store.getters.generalSettings.app_name +' Bangladesh with ✓ Ease &amp; Speed ✓ 100% Genuine Product ✓ Fastest Delivery all over Bangladesh.'"
                                :quote="$store.getters.generalSettings.app_name + 'Online Shop is a B2C marketplace network for fashion and lifestyle buyers and sellers in categories including fashion, lifestyle, and health & beauty to buy and sell effortlessly online.'"
                                :hashtags="product.name">
                              <i class="fa fa-lg fa-facebook"></i>
                            </ShareNetwork>
                            <ShareNetwork
                                :style="{backgroundColor: '#333333'}"
                                class="text-white px-2 py-1 mr-2 rounded"
                                network="email"
                                :url="currentUrl"
                                :title="product.name"
                                :description="'Buy ' + product.name + 'online at '+ $store.getters.generalSettings.app_name +' Bangladesh with ✓ Ease &amp; Speed ✓ 100% Genuine Product ✓ Fastest Delivery all over Bangladesh.'"
                                :quote="$store.getters.generalSettings.app_name + 'Online Shop is a B2C marketplace network for fashion and lifestyle buyers and sellers in categories including fashion, lifestyle, and health & beauty to buy and sell effortlessly online.'"
                                :hashtags="product.name">
                              <i class="fa fa-lg fa-envelope"></i>
                            </ShareNetwork>
                            <ShareNetwork
                                :style="{backgroundColor: '#0084ff'}"
                                class="text-white px-2 py-1 mr-2 rounded"
                                network="messenger"
                                :url="currentUrl"
                                :title="product.name"
                                :description="'Buy ' + product.name + 'online at '+ $store.getters.generalSettings.app_name +' Bangladesh with ✓ Ease &amp; Speed ✓ 100% Genuine Product ✓ Fastest Delivery all over Bangladesh.'"
                                :quote="$store.getters.generalSettings.app_name + 'Online Shop is a B2C marketplace network for fashion and lifestyle buyers and sellers in categories including fashion, lifestyle, and health & beauty to buy and sell effortlessly online.'"
                                :hashtags="product.name">
                              <i class="fa fa-lg fa-comments"></i>
                            </ShareNetwork>
                            <ShareNetwork
                                :style="{backgroundColor: '#1da1f2'}"
                                class="text-white px-2 py-1 mr-2 rounded"
                                network="twitter"
                                :url="currentUrl"
                                :title="product.name"
                                :description="'Buy ' + product.name + 'online at '+ $store.getters.generalSettings.app_name +' Bangladesh with ✓ Ease &amp; Speed ✓ 100% Genuine Product ✓ Fastest Delivery all over Bangladesh.'"
                                :quote="$store.getters.generalSettings.app_name + 'Online Shop is a B2C marketplace network for fashion and lifestyle buyers and sellers in categories including fashion, lifestyle, and health & beauty to buy and sell effortlessly online.'"
                                :hashtags="product.name">
                              <i class="fa fa-lg fa-twitter"></i>
                            </ShareNetwork>
                            <ShareNetwork
                                :style="{backgroundColor: '#25d366'}"
                                class="text-white px-2 py-1 mr-2 rounded"
                                network="whatsapp"
                                :url="currentUrl"
                                :title="product.name"
                                :description="'Buy ' + product.name + 'online at '+ $store.getters.generalSettings.app_name +' Bangladesh with ✓ Ease &amp; Speed ✓ 100% Genuine Product ✓ Fastest Delivery all over Bangladesh.'"
                                :quote="$store.getters.generalSettings.app_name + 'Online Shop is a B2C marketplace network for fashion and lifestyle buyers and sellers in categories including fashion, lifestyle, and health & beauty to buy and sell effortlessly online.'"
                                :hashtags="product.name">
                              <i class="fa fa-lg fa-whatsapp"></i>
                            </ShareNetwork>
                          </template>
                          <i class="pointer fa fa-share-alt fa-2x"></i>
                        </a-popover>
                      </label>
                    </div>
                    <a-divider class="my-2"/>

                    <table class="table text-center" style="border-bottom: 1px solid #ece1e1" v-if="volume.length > 0">
                      <tr>
                        <td class="border-0" v-for="(quantity, k) in volume" :key="k">
                          {{ volume.length - 1 === k ? '>= ' + quantity.min_qty : quantity.min_qty }}
                          {{ volume.length - 1 === k ? '' : ' - ' + quantity.max_qty }}
                          Pieces
                        </td>
                      </tr>
                      <tr>
                        <td class="border-0 pt-0 font-weight-bold" style="font-size: 18px"
                            v-for="(quantity, k) in volume" :key="k">
                          BDT {{ numberWithCommas(quantity.price) }}
                        </td>
                      </tr>
                    </table>


                    <div class="product-price">
                      {{ discount_price }}
                      <small v-if="discount" class="old-price ml-2">( {{ price }} )</small>
                      <small v-if="discount" class="text-danger bg-light p-1 ml-2" style="font-size: 12px">
                        {{ discount_value }}
                      </small>
                    </div>
                    <div class="mb-1 mt-1 font-weight-bold" v-if="product.brand">Brand:
                      <span style="color: #999999">{{ product.brand.name }}</span></div>
                    <label class="mb-1 font-weight-bold" v-if="product.color.condition === 1">Color:
                      <span style="color: #999999">{{ color_value }}</span></label>
                    <div class="product-nav product-nav-thumbs"
                         v-if="product.color.condition === 1 && product.color.type === 2">
                      <p v-for="(value, index) in product.color.option"
                         :ref="'colorImage'" @click="clickColorImage(value,index)"
                         class="attribute_option" :key="index">{{ value.name }}</p>
                    </div>
                    <div class="details-filter-row details-row-size"
                         v-if="product.color.condition === 1 && product.color.type === 1">
                      <div class="product-nav product-nav-thumbs">
                        <a :ref="'colorImage'" class="color_image_link" @click="clickColorImage(color,index)"
                           v-for="(color, index) in product.color.option" :key="index">
                          <img :src="showImage(color.image)" alt="product desc" class="color_image" width="50px"
                               height="50px">
                        </a>
                      </div>
                    </div>
                    <div v-if="product.attribute.condition === 1">
                      <div v-for="(attribute, index) in product.attribute.option" :key="index">
                        <label class="font-weight-bold mb-0">{{ attribute.name }}: <span
                            style="color: #999999">{{ attribute.result }}</span></label>
                        <div class="product-nav product-nav-thumbs">
                          <p :ref="'attribute_option'+index"
                             @click="clickAttributeButton(attribute.name, value,index,index2)"
                             v-for="(value, index2) in attribute.value"
                             class="attribute_option" :key="index2">{{ value }}</p>
                        </div>
                      </div>
                    </div>
                    <a-row class="mt-4">
                      <a-col :md="6">
                        <Quantity v-model="quantity" :min="product.quantity.min_qty" :max="max_quantity"
                                  @input="calculationPrice"/>
                      </a-col>
                      <a-col :md="16">
                        <span v-if="product.quantity.stock === 2">{{ product.quantity.total }} {{ product.unit.name }} available. </span>
                      </a-col>
                    </a-row>
                    <div class="product-details-action my-4">
                      <a-popover v-model="buy_popover" trigger="change">
                        <template slot="content">
                          {{ cart_popover_message }}
                        </template>
                        <a-button type="danger" class="mr-3 px-5" size="large" @mouseover="checkToCart('buy')"
                                  @mouseleave="buy_popover = false" @click="buyNow">
                          BUY NOW
                        </a-button>
                      </a-popover>
                      <a-popover v-model="cart_popover" trigger="change" placement="topRight">
                        <template slot="content">
                          {{ cart_popover_message }}
                        </template>
                        <a-button class="bg-success text-white mr-3 px-5" size="large" @mouseover="checkToCart('cart')"
                                  @mouseleave="cart_popover = false" @click="addToCart">
                          <i class="fa fa-shopping-cart mr-1"></i>
                          ADD TO CART
                        </a-button>
                      </a-popover>
                      <a-button size="large" @click="wishList(product.wishlist.active? 'remove' : 'add')">
                        <i v-if="product.wishlist.active" class="fa fa-heart mr-1"></i>
                        <i v-else class="fa fa-heart-o mr-1"></i>
                        {{ product.wishlist.total }}
                      </a-button>
                    </div>
                  </div>
                </a-col>
              </a-row>
              <a-row>
                <a-col :sm="4">

                </a-col>
                <a-col :sm="20">
                  <Detail class="product-details" :product="product"/>
                </a-col>
              </a-row>
            </div>
          </div>
        </div>
      </div>
    </a-spin>
  </div>
</template>

<script>
import {mapGetters} from "vuex";
import ProductImage from "@/components/product/ProductImage";
import Quantity from "@/components/product/Quantity";
import Detail from "@/components/product/Detail";

export default {
  name: "Product",
  components: {ProductImage, Quantity, Detail},
  data() {
    return {
      product: '',
      main_image: '',
      value: 1,
      discount: false,
      discount_price: '',
      price: '',
      volume: [],
      discount_value: '',
      deal_product: [],
      product_variant: '',
      variation_sku: '',
      color_value: '',
      quantity: '',
      max_quantity: 0,
      cart_popover: false,
      buy_popover: false,
      cart_popover_message: '',
    }
  },
  methods: {
    getProduct() {
      let product = this.getProductBySlug(this.$route.params.slug);
      if (product) {
        setTimeout(() => {
          this.product = product;
        }, 500);
      } else this.$store.dispatch('SINGLE_PRODUCT', this.$route.params.slug);
    },
    clickColorImage(image, index) {
      this.$refs.colorImage.map(e => e.classList.remove('active'))
      this.$refs.colorImage[index].classList.add('active');
      this.color_value = image.name;
      if (this.product.color.type === 1) this.main_image = this.showImage(image.image);
      this.makeVariant();
    },
    clickAttributeButton(name, value, index, index2) {
      let id = 'attribute_option' + index;
      this.$refs[id].map(e => e.classList.remove('attribute_option_active'))
      this.$refs[id][index2].classList.add('attribute_option_active');
      this.product.attribute.option.find(x => x.name === name).result = value;
      this.makeVariant();
    },
    calculationPrice() {
      if (this.product) {
        let quantity = this.quantity;
        let discount = this.product.discount;
        let price = this.product.price;
        let total_price = 0;
        let total_discount = 0;
        let discount_value = 0;
        let discount_type = 'Percent';

        if (discount.type !== 0) {
          this.discount = true;
          if (discount.type === 1) {
            discount_value = discount.details.discount_value;
            discount_type = discount.details.discount_type;
          } else if (discount.type === 2) {
            let data = discount.details.filter((item, key) => {
              if (item.min_qty <= quantity && discount.details.length == (key + 1)) {
                return item;
              } else if (item.min_qty <= quantity && quantity < discount.details[(key + 1)].min_qty) {
                return item;
              }
            });
            if (data.length > 0) {
              discount_value = data[0].percent_off;
              discount_type = 'Percent';
            } else this.discount = false;
          } else if (discount.type === 3) {
            discount_value = discount.details.discount_value;
            discount_type = discount.details.discount_type;
            this.deal_product = discount.details;
          }
        }

        if (this.discount) {
          switch (discount_type) {
            case 'Flat':
              this.discount_value = '- ৳' + discount_value;
              break;
            default:
              this.discount_value = '- ' + discount_value + '%';
              break;
          }
        }

        if (price.method === 1) {
          total_price = price.value;
          if (this.discount) {
            switch (discount_type) {
              case 'Flat':
                total_discount = price.value - discount_value;
                break;
              default:
                total_discount = price.value - Math.round((price.value / 100) * discount_value);
                break;
            }
          } else {
            total_discount = price.value;
          }
        } else if (price.method === 2) {
          let e = price.stock;
          if (this.product_variant !== '') {
            let result = e.find(x => x.variant === JSON.stringify(this.product_variant));
            this.variation_sku = result.sku;
            if (this.product.quantity.stock === 2) {
              this.max_quantity = this.product.quantity.max_qty > result.qty ? result.qty : this.product.quantity.max_qty;
              this.quantity = this.quantity > result.qty ? result.qty : this.quantity;
            }
            this.product.quantity.total = result.qty;
            total_price = result.price;
            if (this.discount) {
              switch (discount_type) {
                case 'Flat':
                  total_discount = result.price - discount_value;
                  break;
                default:
                  total_discount = result.price - Math.round((result.price / 100) * discount_value);
                  break;
              }
            } else {
              total_discount = result.price;
            }
          } else {
            let max = e.reduce((a, b) => Number(a.price) > Number(b.price) ? a : b)
            let min = e.reduce((a, b) => Number(a.price) < Number(b.price) && 0 !== Number(a.price) ? a : b)
            total_price = max.price === min.price ? max.price : min.price + ' - ' + max.price;
            let maxprice, minprice;
            if (this.discount) {
              switch (discount_type) {
                case 'Flat':
                  maxprice = max.price - discount_value;
                  minprice = min.price - discount_value;
                  total_discount = maxprice === minprice ? maxprice : minprice + ' - ' + maxprice;
                  break;
                default:
                  maxprice = max.price - Math.round((max.price / 100) * discount_value);
                  minprice = min.price - Math.round((min.price / 100) * discount_value);
                  total_discount = maxprice === minprice ? maxprice : minprice + ' - ' + maxprice;
                  break;
              }
            } else {
              total_discount = max.price === min.price ? max.price : min.price + ' - ' + max.price;
            }
          }
        } else if (price.method === 3) {
          let e = price.variation;
          let volume = e.find(a => Number(a.min_qty) <= quantity && Number(a.max_qty) >= quantity)
          if (!volume) volume = e[e.length - 1]
          total_price = volume.price;
          if (this.discount) {
            switch (discount_type) {
              case 'Flat':
                total_discount = volume.price - discount_value;
                break;
              default:
                total_discount = volume.price - Math.round((volume.price / 100) * discount_value);
                break;
            }
          } else {
            total_discount = volume.price;
          }
          this.volume = e;
        }
        this.discount_price = '৳' + total_discount;
        this.price = '৳' + total_price;
      }
    },
    makeVariant() {
      let variant = [];
      let color = false;
      let attribute = false;
      if (this.product.color.condition === 1) {
        if (this.color_value !== '') {
          variant.push(this.color_value);
          color = true;
        } else color = false
      } else color = true
      let attributes = this.product.attribute.option;
      if (this.product.attribute.condition === 1) {
        for (let i = 0; i < attributes.length; i++) {
          if (attributes[i].result !== "") {
            variant.push(attributes[i].result);
            attribute = true;
          } else {
            attribute = false;
            break;
          }
        }
      } else attribute = false
      color !== false && attribute !== false ? this.product_variant = variant : this.product_variant = '';
    },
    addToCart() {
      if (this.checkToCart('cart')) {
        this.productAddCart();
        this.$message.success('A new item has been added to your Shopping Cart.', 2);
      }
    },
    checkToCart(e) {
      if (this.product.color.condition === 1) {
        if (this.color_value === '') {
          e === 'cart' ? this.cart_popover = true : this.buy_popover = true;
          this.cart_popover_message = 'Please provide the missing information first';
          return false;
        }
      }
      if (this.product.attribute.condition === 1) {
        let attributes = this.product.attribute.option;
        for (let i = 0; i < attributes.length; i++) {
          if (attributes[i].result === "") {
            e === 'cart' ? this.cart_popover = true : this.buy_popover = true;
            this.cart_popover_message = 'Please provide the missing information first';
            return false;
          }
        }
      }
      if (this.quantity < this.product.quantity.min_qty) {
        this.cart_popover = true;
        this.cart_popover_message = 'Product order minimum quantity was ' + this.product.quantity.min_qty;
        return false;
      } else if (this.quantity > this.product.quantity.max_qty) {
        e === 'cart' ? this.cart_popover = true : this.buy_popover = true;
        this.cart_popover_message = 'Product order maximum quantity was ' + this.product.quantity.max_qty;
        return false;
      }
      return true;
    },
    productAddCart() {
      let data = {};
      data['id'] = this.product.id;
      data['slug'] = this.product.slug;
      data['qty'] = this.quantity;
      if (this.product_variant !== '') {
        let variation = {};
        if (this.product.color.condition === 1) {
          if (this.color_value !== '') {
            variation['color'] = this.color_value;
          }
        }
        let attributes = this.product.attribute.option;
        if (this.product.attribute.condition === 1) {
          for (let i = 0; i < attributes.length; i++) {
            if (attributes[i].result !== "") {
              variation[attributes[i].name] = attributes[i].result;
            }
          }
        }
        data['variation'] = 1;
        data['variation_value'] = variation;
        data['variation_sku'] = this.variation_sku;
      } else data['variation'] = 0;
      this.$store.dispatch('STORE_CART', data)
    },
    buyNow() {
      if (this.checkToCart('buy')) {
        if (!this.isAuthenticated) {
          this.$router.push('/login')
        }
        this.productAddCart();
        this.$router.push('/cart');
      }
    },
    wishList(e) {
      const that = this;
      if (!this.isAuthenticated) {
        this.$confirm({
          title: 'You have to login first..',
          okText: 'Log In',
          centered: true,
          onOk() {
            that.$router.push('/login')
          },
          onCancel() {
          },
        });
      } else {
        this.$store.dispatch('ADD_TO_WISHLIST', {action: e, slug: this.product.slug})
            .then((data) => {
              this.product.wishlist = data;
              this.$store.commit('SET_USERS_WISHLIST', data.my_wishlist);
              this.$store.commit('EMPTY_WISHLIST');
            })
            .catch(error => {
              this.$notification['error']({
                message: 'Warning',
                description: ((error.response || {}).data || {}).message || 'Something Wrong',
                style: {marginTop: '41px'},
                duration: 4
              })
            })
      }
    },
  },
  created() {
    this.getProduct();
    if (!this.categoryList.length > 0) this.$store.dispatch('CATEGORY_LIST');
  },
  watch: {
    singleProductIsLoaded(data) {
      if (data) {
        this.getProduct();
      }
    },
    product: function (data) {
      this.main_image = this.showImage(data.main_image);
      this.quantity = this.product.quantity.min_qty;
      this.max_quantity = Number(this.product.quantity.max_qty);
      this.calculationPrice();
    },
    product_variant: function () {
      this.calculationPrice();
    },
  },
  computed: {
    ...mapGetters(["getProductBySlug", "categoryList", "singleProductIsLoaded", "isAuthenticated"]),
    currentUrl: () => encodeURI(window.location),
  },
}
</script>

<style scoped lang="scss">
@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap");

.color_image {
  border: 1px solid #80808057;
  cursor: pointer;
}

.attribute_option {
  border: 1px solid #80808057;
  padding: 2px 8px;
  margin: 2px 6px 2px 4px;
  cursor: pointer;
  color: black;
  border-radius: 4px;
}

.attribute_option.active {
  box-shadow: 0 0 0 1px #f90000d1;
}


.attribute_option_active {
  box-shadow: 0 0 0 1px #f90000d1;
}

.attribute_option:hover, .product_caro_image:hover {
  box-shadow: 0 0 0 1px #f90000d1;
}

.product-details {
  margin-bottom: 2rem;
  font-family: sans-serif !important;
  font-size: 12px;

  .product-price {
    display: flex;
    align-items: center;
    flex-flow: wrap;
    font-weight: 600;
    font-size: 1.5rem;
    line-height: 1.5;
    color: #7fb82e;
    margin-bottom: 2px;
  }

  .details-filter-row {
    display: flex;
    align-items: center;
    flex-flow: row wrap;
    margin-bottom: 1.2rem;
  }

  .product-nav {
    display: flex;
    align-items: center;

    .color_image_link {
      display: flex;
      align-items: center;
      border-radius: .2rem;
      border: .2rem solid #fff;
      margin-right: .4rem;
      transition: box-shadow .35s ease;
    }
  }

  .product-nav-thumbs {
    padding-top: 0;

    a,
    span {
      display: flex;
      align-items: center;
      border-radius: 0.2rem;
      border: 0.2rem solid #fff;
      margin-right: 0.4rem;
      transition: box-shadow 0.35s ease;
    }

    a:last-child,
    span:last-child {
      margin-right: 0;
    }

    img {
      border-radius: 0.2rem;
    }
  }

  .details-filter-row {
    display: flex;
    align-items: center;
    flex-flow: row wrap;
    margin-bottom: 1.2rem;

    label {
      display: inline-block;
      width: 67px;
      font-weight: 400;
      font-size: 1rem;
      margin-bottom: 0;
    }

    .select-custom {
      margin-bottom: 0;
      margin-right: 1.5rem;
    }
  }

}
</style>
