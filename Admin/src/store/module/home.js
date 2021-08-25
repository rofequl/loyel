import ApiService from "@/core/services/api.service";

export default {
    state: {
        homeSlider: [],
        isTopBrand: false,
        featuredSeller: false,
        featuredShopList: [],
    },

    getters: {
        homeSlider: state => state.homeSlider,
        isTopBrand: state => state.isTopBrand,
        isFeaturedSeller: state => state.featuredSeller,
        featuredShopList: state => state.featuredShopList,
    },

    actions: {
        FEATURED_SHOP_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("featured_shop_list")
                    .then(({data}) => {
                        commit('SET_FEATURED_SHOP_LIST', data);
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        HOME_SETUP({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("home-setup")
                    .then(({data}) => {
                        commit('SET_HOME_SLIDER_LIST', data.home_slider);
                        commit('SET_TOP_BRAND_ACTIVE', data.top_brand);
                        commit('SET_FEATURED_SELLER_ACTIVE', data.featured_seller);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        TOP_BRAND_ACTIVE({commit}, data) {
            return new Promise((resolve, reject) => {
                ApiService.post("top_brand_active", data)
                    .then(({data}) => {
                        commit('SET_TOP_BRAND_ACTIVE', data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        FEATURED_SELLER_ACTIVE({commit}, data) {
            return new Promise((resolve, reject) => {
                ApiService.post("featured_seller_active", data)
                    .then(({data}) => {
                        commit('SET_FEATURED_SELLER_ACTIVE', data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },

    mutations: {
        SET_HOME_SLIDER_LIST: (state, data) => {
            if (data) {
                data = JSON.parse(data);
                if (data.length > 0) {
                    state.homeSlider = data;
                }
            }
        },
        SET_TOP_BRAND_ACTIVE: (state, data) => {
            data === 1 ? state.isTopBrand = true : state.isTopBrand = false
        },
        SET_FEATURED_SELLER_ACTIVE: (state, data) => {
            data === 1 ? state.featuredSeller = true : state.featuredSeller = false
        },
        SET_FEATURED_SHOP_LIST: (state, data) => {
            state.featuredShopList = data;
        },
    }

}
