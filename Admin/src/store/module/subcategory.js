import ApiService from "@/core/services/api.service";

export default {
    state: {
        subcategory: [],
    },

    getters: {
        subcategoryList: state => state.subcategory,
        subcategoryIndex: state => id => state.subcategory.findIndex(value => value.id === id) + 1,
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
                        resolve();
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        SUBCATEGORY_SERIAL({commit}, data) {
            return new Promise((resolve, reject) => {
                if (Number.isInteger(data.serial)) {
                    ApiService.post("subcategory-serial", data)
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
        SET_SUBCATEGORY_LIST: (state, data) => {
            state.subcategory = data;
        },
        SUBCATEGORY_MODIFY: (state, data) => {
            Object.assign(state.subcategory.find(element => element.id === data.id), data);
        },
        SUBCATEGORY_ADD: (state, data) => {
            state.subcategory.unshift(data);
        },
        SUBCATEGORY_REMOVE: (state, data) => {
            let index = state.subcategory.findIndex(value => value.id === data);
            state.subcategory.splice(index, 1);
        },
        SUBCATEGORY_SERIAL: (state, data) => {
            state.subcategory.find(value => value.id === data.id).serial = data.serial;
        }
    }
}
