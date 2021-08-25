import ApiService from "@/core/services/api.service";

export default {
    state: {
        subcategory: [],
    },

    getters: {
        subcategoryList: state => state.subcategory,
        subcategoryById: state => id => state.subcategory.filter(value => value.category_id === id),
        subcategoryNameById: state => id => state.subcategory.find(value => value.id === id),
        subcategoryNameBySlug: state => slug => state.subcategory.find(value => value.slug === slug),
    },

    actions: {
        SUBCATEGORY_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("subcategory")
                    .then(({data}) => {
                        commit('SET_SUBCATEGORY_LIST', data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },

    mutations: {
        SET_SUBCATEGORY_LIST: (state, data) => {
            state.subcategory = data;
        },
    }
}
