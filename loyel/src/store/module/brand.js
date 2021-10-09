import ApiService from "@/core/services/api.service";

export default {
    state: {
        brand: [],
    },

    getters: {
        brandList: state => state.brand,
        brandNameBySlug: state => slug => state.brand.find(value => value.slug === slug),
        brandNameById: state => id => state.brand.find(value => value.id === id),
    },

    actions: {
        BRAND_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("brand")
                    .then(({data}) => {
                        commit('SET_BRAND_LIST', data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_BRAND_LIST: (state, data) => {
            state.brand = data;
        }
    }

}
