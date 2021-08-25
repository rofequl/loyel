import ApiService from "@/core/services/api.service";

export default {
    state: {
        subsubcategory: [],
    },

    getters: {
        subsubcategoryList: state => state.subsubcategory,
        subsubcategoryById: state => id => state.subsubcategory.filter(value => value.subcategory_id === id),
        subsubcategoryNameById: state => id => state.subsubcategory.find(value => value.id === id),
        subsubcategoryNameBySlug: state => slug => state.subsubcategory.find(value => value.slug === slug),
    },

    actions: {
        SUBSUBCATEGORY_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("subsubcategory")
                    .then(({data}) => {
                        commit('SET_SUBSUBCATEGORY_LIST', data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },

    mutations: {
        SET_SUBSUBCATEGORY_LIST: (state, data) => {
            state.subsubcategory = data;
        },
    }
}
