import ApiService from "@/core/services/api.service";

export default {
    state: {
        brand: [],
    },

    getters: {
        brandList: state => state.brand,
        brandIndex: state => id => state.brand.findIndex(value => value.id === id) + 1,
        brandListingId(state) {
            let data = [];
            for (let i = 0; i < state.brand.length; i++) {
                if (state.brand[i].top != null) {
                    data.push(state.brand[i].id);
                }
            }
            return data;
        }
    },

    actions: {
        BRAND_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("brand")
                    .then(({data}) => {
                        commit('SET_BRAND_LIST', data);
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        // eslint-disable-next-line no-unused-vars
        BRAND_SERIAL({commit}, data) {
            return new Promise((resolve, reject) => {
                if (Number.isInteger(data.serial)) {
                    ApiService.post("brand-serial", data)
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
        SET_BRAND_LIST: (state, data) => {
            state.brand = data;
        },
        BRAND_MODIFY: (state, data) => {
            Object.assign(state.brand.find(element => element.id === data.id), data);
        },
        BRAND_ADD: (state, data) => {
            state.brand.unshift(data);
        },
        BRAND_REMOVE: (state, data) => {
            let index = state.brand.findIndex(value => value.id === data);
            state.brand.splice(index, 1);
        },
        BRAND_SERIAL: (state, data) => {
            state.brand.find(value => value.id === data.id).serial = data.serial;
        }
    }

}
