<template>
  <a-col span="16">
    <a-card style="width: 100%;border-radius: 20px" class="mt-4 p-0 bg-light">
      <h5 class="font-weight-bold">Shopping Cart ({{ cartProductCount }})</h5>
      <div class="row mt-4">
        <div class="col-6">
          <a-checkbox :checked="checkAll" :indeterminate="indeterminate"
                      @change="(e)=>{cart_list.map((m)=>{m.check_list = e.target.checked}); checkAll = e.target.checked}">
            Select All
          </a-checkbox>
        </div>
        <div class="col-6 text-right">
          <a href="delete" @click.prevent="emptyCartList" v-if="checkAll || indeterminate"
             class="text-secondary"><i class="far fa-trash-alt"></i> DELETE</a>
        </div>
      </div>
    </a-card>
    <a-card style="width: 100%;border-radius: 20px" class="mt-4 p-0" v-if="cartProductCount === 0">
      <a-result status="404" title="Your Shopping Cart is empty"
                sub-title="Sorry, There are no items in this cart."></a-result>
    </a-card>
    <a-card style="width: 100%;border-radius: 20px" class="mt-4 p-0">
      <table v-for="(cart, i) in cart_list" :key="i" class="mt-4">
        <tr>
          <td style="width: 5%">
            <a-checkbox :checked="cart.check_list" @change="(e)=>{checkCart(e, cart)}"></a-checkbox>
          </td>
          <td style="width: 15%">
            <router-link :to="'/product/'+cart.slug" target="_blank">
              <img :src="showImage(cart.main_image)" fluid
                     alt="Responsive image" class="border"
                     style="max-width: 80px">
            </router-link>
          </td>
          <td style="width: 80%" class="p-2 break">
            <router-link :to="'/product/'+cart.slug" target="_blank" style="color: #2f2c2c">
              <h6 class="mb-0" style="font-size: 15px">{{ cart.name }}</h6>
              <p class="mb-0 text-muted" style="font-size: 12px" v-if="cart.variation === 1">
                          <span v-for="(variation, k) in cart.variation_value" :key="k" class="mr-2">
                            <span class="font-weight-bold text-capitalize">{{ k }}: </span>{{ variation }}
                          </span>
              </p>
            </router-link>
            <h4 style="font-size: 14px" class="product-price font-weight-bold mt-1">৳ {{ cart.total_discount }}
              <small v-if="cart.discount" style="text-decoration: line-through" class="old-price ml-2">( ৳ {{
                  cart.price
                }} )</small>
              <small v-if="cart.discount" class="text-danger bg-light p-1 ml-2" style="font-size: 12px">
                {{ cart.discount_value }}
              </small></h4>
            <p class="mb-0 font-weight-bold" style="font-size: 12px;color: #00aced">
              Free Shipping</p>
          </td>
          <td style="width: 20%" class="break">
            <a href="delete" class="float-right mr-2" @click.prevent="deleteCartProduct(cart, i)"
               style="color: #d00000;font-size: 20px">
              <i class="fa fa-trash"></i>
            </a>
            <a href="#" class="float-right mr-3"
               style="color: #d00000;font-size: 20px">
              <i class="fa fa-heart"></i>
            </a>
            <div class="clearfix"></div>
            <div class="product-details-quantity mt-3">
              <Quantity v-model="cart.qty" :min="cart.min_qty" @input="updateCart(cart)" :max="cart.max_qty"/>
            </div>
          </td>
        </tr>
      </table>
    </a-card>
  </a-col>
</template>

<script>
import Quantity from "@/components/product/Quantity";
import {mapGetters} from "vuex";

export default {
  name: "SelectProduct",
  components: {Quantity},
  data() {
    return {
      cart_list: [],
      indeterminate: false,
      checkAll: false,
    }
  },
  methods: {
    loadCart() {
      this.cart_list = [];
      if (this.cartProductCount > 0) {
        for (let i = 0; i < this.cartProductList.length; i++) {
          let price = this.calculationPrice(this.cartProductList[i]);
          if (price) {
            let product = {
              'check_list': false,
              'main_image': this.loadProductDetails(this.cartProductList[i].slug, 'main_image'),
              'name': this.loadProductDetails(this.cartProductList[i].slug, 'name'),
              'seller': this.loadProductDetails(this.cartProductList[i].slug, 'seller'),
              'price_type': price.price_type,
              'total_discount': price.total_discount,
              'price': price.total_price,
              'discount': price.discount,
              'discount_value': price.discount_value,
              'sku': price.sku,
              'discount_amount': price.discount_amount,
              'discount_type': price.discount_type,
              'min_qty': this.minQty(this.cartProductList[i]),
              'max_qty': this.maxQty(this.cartProductList[i]),
              ...this.cartProductList[i]
            };
            this.cart_list.push(product)
          }
        }
      }
    },
    loadProductDetails(slug, dataType) {
      let product = this.getProductBySlug(slug);
      if (product) return product[dataType];
    },
    deleteCartProduct(cart, index) {
      let that = this;
      this.$confirm({
        title: 'Are you sure about this?',
        content: 'This action will remove this item from your shopping cart.',
        okText: 'OK',
        okType: 'danger',
        cancelText: 'Cancel',
        onOk() {
          that.cart_list.splice(index, 1);
          that.$store.commit('CART_REMOVE_SINGLE', cart);
          that.$store.commit('STORE_CART_PRODUCT', cart);
        }
      });
    },
    updateCart(cart) {
      let price = this.calculationPrice(cart);
      cart.total_discount = price.total_discount
      cart.price = price.total_price
      cart.discount = price.discount
      cart.discount_value = price.discount_value
      cart.sku = price.sku
      cart.discount_amount = price.discount_amount
      this.$store.commit('UPDATE_CART_PRODUCT', cart);
      this.$store.commit('STORE_CART_PRODUCT', cart);
    },
    minQty(cart) {
      let product = this.getProductBySlug(cart.slug);
      if (product) {
        if (product.quantity.qty_manage === 1) return product.quantity.min_qty;
        else return 1;
      }
    },
    maxQty(cart) {
      let product = this.getProductBySlug(cart.slug);
      if (product) {
        let qty = 999999;
        if (product.quantity.stock === 2) {
          if (cart.variation === 1 && product.price.method === 2) {
            let e = product.price.stock;
            let result = e.find(value => value.sku === cart.variation_sku);
            qty = result.qty;
          } else qty = product.quantity.total;
          if (product.quantity.qty_manage === 1) return product.quantity.max_qty > qty ? qty : product.quantity.max_qty;
          else return qty;
        } else {
          if (product.quantity.qty_manage === 1) return product.quantity.max_qty;
          else return qty;
        }
      }
    },
    calculationPrice(cart) {
      let product = this.getProductBySlug(cart.slug);
      if (product) {
        let quantity = cart.qty;
        let price_list = {};
        let discount = product.discount;
        let price = product.price;
        let discount_value = 0;
        let discount_type = 'Percent';

        if (discount.type !== 0) {
          price_list.discount = true;
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
            } else price_list.discount = false;
          } else if (discount.type === 3) {
            discount_value = discount.details.discount_value;
            discount_type = discount.details.discount_type;
          }
        } else price_list.discount = false;
        price_list.price_type = price.method;
        if (price.method === 1) {
          price_list.total_price = price.value;
          price_list.sku = product.sku;
          if (price_list.discount) {
            switch (discount_type) {
              case 'Flat':
                price_list.total_discount = price.value - discount_value;
                price_list.discount_value = '- ৳' + discount_value;
                break;
              default:
                price_list.total_discount = price.value - Math.round((price.value / 100) * discount_value);
                price_list.discount_value = '- ' + discount_value + '%';
                break;
            }
          } else {
            price_list.total_discount = price.value;
          }
        } else if (price.method === 2) {
          let e = price.stock;
          let result = e.find(value => value.sku === cart.variation_sku)
          price_list.total_price = result.price;
          price_list.sku = result.sku;
          if (price_list.discount) {
            switch (discount_type) {
              case 'Flat':
                price_list.total_discount = result.price - discount_value;
                price_list.discount_value = '- ৳' + discount_value;
                break;
              default:
                price_list.total_discount = result.price - Math.round((result.price / 100) * discount_value);
                price_list.discount_value = '- ' + discount_value + '%';
                break;
            }
          } else {
            price_list.total_discount = result.price;
          }
        } else if (price.method === 3) {
          let e = price.variation;
          let volume = e.find(a => Number(a.min_qty) <= quantity && Number(a.max_qty) >= quantity)
          if (!volume) volume = e[e.length - 1]
          price_list.total_price = volume.price;
          if (price_list.discount) {
            switch (discount_type) {
              case 'Flat':
                price_list.total_discount = volume.price - discount_value;
                price_list.discount_value = '- ৳' + discount_value;
                break;
              default:
                price_list.total_discount = volume.price - Math.round((volume.price / 100) * discount_value);
                price_list.discount_value = '- ' + discount_value + '%';
                break;
            }
          } else {
            price_list.total_discount = volume.price;
          }
          this.volume = e;
        }
        price_list.discount_amount = discount_value;
        price_list.discount_type = discount_type;
        return price_list;
      }
    },
    checkCart(e, cart) {
      cart.check_list = e.target.checked;
    },
    purchases() {
      let data = []
      let any_false = true;
      this.indeterminate = false
      this.checkAll = false
      for (let i = 0; i < this.cart_list.length; i++) {
        if (this.cart_list[i].check_list) {
          let product = this.cart_list[i];
          product['total_price'] = product.total_discount * product.qty
          data.push(product)
          this.checkAll = true
          this.indeterminate = true
        } else {
          any_false = false;
        }
      }
      this.$emit('order', data)
      if (!any_false) this.checkAll = false
      if (this.checkAll) this.indeterminate = false
    },
    emptyCartList() {
      let that = this;
      this.$confirm({
        title: 'Remove from cart',
        content: 'Are you sure you want to delete these item(s)',
        okText: 'OK',
        okType: 'danger',
        cancelText: 'Cancel',
        onOk() {
          that.cart_list = that.cart_list.filter(cart => {
            if (cart.check_list) {
              that.$store.commit('CART_REMOVE_SINGLE', cart);
              that.$store.commit('STORE_CART_PRODUCT', cart);
              return false
            } else return true;
          });
        }
      });
    }
  },
  created() {
    this.loadCart();
  },
  watch: {
    singleProductIsLoaded: function (data) {
      if (data) this.loadCart();
    },
    cart_list: {
      deep: true,
      handler() {
        this.purchases();
      }
    },
  },
  computed: {
    ...mapGetters(["cartProductCount", "cartProductList", "getProductBySlug", "singleProductIsLoaded"]),
  }
}
</script>

<style scoped>
@media (max-width: 480px) {
  .break {
    display: table-row;
  }
}
</style>
