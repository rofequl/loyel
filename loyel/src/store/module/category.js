import ApiService from "@/core/services/api.service";

export default {
    state: {
        category: [],
    },

    getters: {
        categoryList: state => state.category,
        categoryNameById: state => id => state.category.find(value => value.id === id),
        categoryNameBySlug: state => slug => state.category.find(value => value.slug === slug),
    },
    actions: {
        CATEGORY_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("category")
                    .then(({data}) => {
                        commit('SET_CATEGORY_LIST', data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_CATEGORY_LIST: (state, data) => {
            state.category = data;
        },
    }
}
