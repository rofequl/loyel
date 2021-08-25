import ApiService from "@/core/services/api.service";

export default {
    state: {
        wishlist: 0,
        wishlistProduct: [],
    },
    getters: {
        totalWishlist: state => state.wishlist,
        wishlistProductList: state => state.wishlistProduct,
    },
    actions: {
        WISHLIST_PRODUCT({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("wishlist")
                    .then(({data}) => {
                        commit('SET_WISHLIST_PRODUCT', data);
                        resolve();
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        ADD_TO_WISHLIST({commit}, value) {
            return new Promise((resolve, reject) => {
                ApiService.post("wishlist", value)
                    .then(({data}) => {
                        resolve(data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        }
    },
    mutations: {
        SET_USERS_WISHLIST: (state, data) => {
            state.wishlist = data;
        },
        SET_WISHLIST_PRODUCT: (state, data) => {
            state.wishlistProduct = data;
        },
        REMOVE_WISHLIST_PRODUCT: (state, data) => {
            let index = state.wishlistProduct.findIndex(value => value.slug === data);
            state.wishlistProduct.splice(index, 1);
        },
        EMPTY_WISHLIST: (state) => {
            state.wishlistProduct = [];
        },
    }
}
