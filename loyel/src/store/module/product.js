import ApiService from '@/core/services/api.service';

export default {
    state: {
        product: [],
        featured: [],
        featured_button: true,
        featured_page: 1,
        loading: false,
        seller_product: [],
    },

    getters: {
        featured: state => state.featured,
        featuredButton: state => state.featured_button,
        getProductBySlug: state => slug => state.product.find(value => value.slug === slug),
        singleProductIsLoaded: state => !state.loading,
        sellerProductList: state => state.seller_product,
        sellerProductIndex: state => id => state.seller_product.findIndex(value => value.id === id) + 1,
    },

    actions: {
        FEATURED_PRODUCT({commit, state}) {
            return new Promise((resolve, reject) => {
                ApiService.get("featured-product?page=" + state.featured_page)
                    .then(({data}) => {
                        commit('SET_FEATURED_PRODUCT', data);
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        SINGLE_PRODUCT({commit}, slug) {
            commit('SINGLE_PRODUCT_LOADING')
            return new Promise((resolve, reject) => {
                ApiService.get("product/" + slug)
                    .then(({data}) => {
                        commit('SET_SINGLE_PRODUCT_LIST', data);
                        resolve(data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        MULTIPLE_PRODUCT({commit}, slug) {
            commit('SINGLE_PRODUCT_LOADING')
            return new Promise((resolve, reject) => {
                ApiService.get("multiple-product/" + slug)
                    .then(({data}) => {
                        commit('SET_MULTIPLE_PRODUCT_LIST', data);
                        resolve(data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        SELLER_PRODUCT_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("seller-product")
                    .then(({data}) => {
                        commit('SET_SELLER_PRODUCT_LIST', data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },

    mutations: {
        SET_FEATURED_PRODUCT: (state, data) => {
            data.forEach(value => {
                state.featured.push(value)
            })
            state.featured_page = state.featured_page + 1;
            if (data.length < 30) state.featured_button = false;
        },
        SET_SINGLE_PRODUCT_LIST: (state, data) => {
            let index = state.product.find(value => value.id === data.id);
            if (!index) state.product.unshift(data);
            state.loading = false;
        },
        EMPTY_PRODUCT: (state) => {
            state.product = [];
        },
        SET_MULTIPLE_PRODUCT_LIST: (state, data) => {
            for (let i = 0; i < data.length; i++) {
                let index = state.product.find(value => value.id === data[i].id);
                if (!index) {
                    state.product.unshift(data[i]);
                }
            }
            state.loading = false;
        },
        SINGLE_PRODUCT_LOADING(state, loading = true) {
            state.loading = loading;
        },
        SET_SELLER_PRODUCT_LIST: (state, data) => {
            state.seller_product = data;
        },
    }

}
