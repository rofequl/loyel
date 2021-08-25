import ApiService from "@/core/services/api.service";

export default {
    state: {
        product: [],
        seller_product: [],
    },

    getters: {
        productList: state => state.product,
        productIndex: state => id => state.product.findIndex(value => value.id === id) + 1,
        sellerProductList: state => state.seller_product,
        sellerProductIndex: state => id => state.seller_product.findIndex(value => value.id === id) + 1,
    },

    actions: {
        PRODUCT_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("product")
                    .then(({data}) => {
                        commit('SET_PRODUCT_LIST', data);
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        FEATURES_PRODUCT_ACTIVE({commit}, data) {

            return new Promise((resolve, reject) => {
                commit('SET_FEATURES_PRODUCT_ACTIVE', data);
                ApiService.post("featured_product_active", data)
                    .then(() => {
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        PUBLISHED_PRODUCT_ACTIVE({commit}, data) {

            return new Promise((resolve, reject) => {
                commit('SET_PUBLISHED_PRODUCT_ACTIVE', data);
                ApiService.post("published_product_active", data)
                    .then(() => {
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        SELLER_PRODUCT_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("selling-product")
                    .then(({data}) => {
                        commit('SET_SELLER_PRODUCT_LIST', data);
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_PRODUCT_LIST: (state, data) => {
            state.product = data;
        },
        PRODUCT_MODIFY: (state, data) => {
            Object.assign(state.product.find(element => element.id === data.id), data);
        },
        PRODUCT_ADD: (state, data) => {
            state.product.unshift(data);
        },
        PRODUCT_REMOVE: (state, data) => {
            let index = state.product.findIndex(value => value.id === data);
            state.product.splice(index, 1);
        },
        SET_FEATURES_PRODUCT_ACTIVE: (state, data) => {
            if (state.product.length > 0) state.product.find(element => element.id === data.id).featured = data.active;
            if (state.seller_product.length > 0) state.seller_product.find(element => element.id === data.id).featured = data.active;
        },
        SET_SELLER_PRODUCT_LIST: (state, data) => {
            state.seller_product = data;
        },
        SET_PUBLISHED_PRODUCT_ACTIVE: (state, data) => {
            if (state.product.length > 0) state.product.find(element => element.id === data.id).published = data.active;
            if (state.seller_product.length > 0) state.seller_product.find(element => element.id === data.id).published = data.active;
        },
    }

}
