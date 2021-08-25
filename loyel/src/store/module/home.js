import ApiService from "@/core/services/api.service";

export default {
    state: {
        homeSlider: [],
        deal: [],
        topBrand: [],
    },

    getters: {
        homeSlider: state => state.homeSlider,
        deal: state => state.deal,
        topBrand: state => state.topBrand,
        dealListBySlug: state => slug => state.deal.find(value => value.slug === slug),
    },

    actions: {
        HOME_SETUP({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("home-setup")
                    .then(({data}) => {
                        commit('SET_HOME_SLIDER_LIST', data.home_slider);
                        commit('SET_DEAL_LIST', data.deal);
                        commit('SET_TOP_BRAND_LIST', data.top_brands);
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
        SET_DEAL_LIST: (state, data) => {
            state.deal = data;
        },
        SET_TOP_BRAND_LIST: (state, data) => {
            state.topBrand = data;
        },
    }

}
