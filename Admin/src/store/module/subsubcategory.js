import ApiService from "@/core/services/api.service";

export default {
    state: {
        subsubcategory: [],
    },

    getters: {
        subsubcategoryList: state => state.subsubcategory,
        subsubcategoryIndex: state => id => state.subsubcategory.findIndex(value => value.id === id) + 1,
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
                        resolve();
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        SUBSUBCATEGORY_SERIAL({commit}, data) {
            return new Promise((resolve, reject) => {
                if (Number.isInteger(data.serial)) {
                    ApiService.post("subsubcategory-serial", data)
                        .then(() => {
                            resolve()
                        })
                        .catch(error => {
                            reject(error)
                        })
                } else reject()
            });
        },
    },

    mutations: {
        SET_SUBSUBCATEGORY_LIST: (state, data) => {
            state.subsubcategory = data;
        },
        SUBSUBCATEGORY_MODIFY: (state, data) => {
            Object.assign(state.subsubcategory.find(element => element.id === data.id), data);
        },
        SUBSUBCATEGORY_ADD: (state, data) => {
            state.subsubcategory.unshift(data);
        },
        SUBSUBCATEGORY_REMOVE: (state, data) => {
            let index = state.subsubcategory.findIndex(value => value.id === data);
            state.subsubcategory.splice(index, 1);
        },
        SUBSUBCATEGORY_SERIAL: (state, data) => {
            state.subsubcategory.find(value => value.id === data.id).serial = data.serial;
        }
    }
}
