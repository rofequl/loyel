import CartService from "@/core/services/cart.service";
import store from '../index'

export default {
    state: {
        cart_list: [],
    },

    getters: {
        cartProductCount: state => state.cart_list.length,
        cartProductList: state => state.cart_list,
    },

    actions: {
        STORE_CART({commit}, data) {
            commit('SET_PRODUCT_CART', data);
            commit('STORE_CART_PRODUCT')
        },

        CART_PRODUCT_LIST({commit}) {
            commit('LOAD_CART_PRODUCT')
        },
    },
    mutations: {
        SET_PRODUCT_CART: (state, data) => {
            store.commit('CART_REMOVE_SINGLE', data);
            state.cart_list.push(data);
        },
        STORE_CART_PRODUCT: (state, data) => {
            CartService.destroyCartProduct();
            if (state.cart_list.length > 0) CartService.saveCartProduct(state.cart_list);
        },
        UPDATE_CART_PRODUCT: (state, data) => {
            for (let i = 0; i < state.cart_list.length; i++) {
                if (state.cart_list[i].id === data.id) {
                    if (state.cart_list[i].variation === 0) {
                        state.cart_list[i].qty = data.qty;
                    } else {
                        if (state.cart_list[i].variation_sku === data.variation_sku) {
                            state.cart_list[i].qty = data.qty;
                        }
                    }
                }
            }
        },
        CART_REMOVE_SINGLE: (state, data) => {
            for (let i = 0; i < state.cart_list.length; i++) {
                if (state.cart_list[i].id === data.id) {
                    if (state.cart_list[i].variation === 0) {
                        let index = state.cart_list.findIndex(value => value.id === data.id);
                        state.cart_list.splice(index, 1);
                    } else {
                        if (state.cart_list[i].variation_sku === data.variation_sku) {
                            let index = state.cart_list.findIndex(value => value.variation_sku === data.variation_sku);
                            state.cart_list.splice(index, 1);
                        }
                    }
                }
            }
        },
        LOAD_CART_PRODUCT: (state) => {
            if (CartService.getCartProduct()) {
                state.cart_list = CartService.getCartProduct();
                let slug = state.cart_list.map(x => x.slug).filter((value, index, self) => self.indexOf(value) === index);
                store.dispatch('MULTIPLE_PRODUCT', slug);
            }
        },
    }

}
