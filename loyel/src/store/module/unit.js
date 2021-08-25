import ApiService from "@/core/services/api.service";

export default {
    state: {
        unit: [],
    },

    getters: {
        unitList: state => state.unit,
    },

    actions: {
        UNIT_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("unit")
                    .then(({data}) => {
                        commit('SET_UNIT_LIST', data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },

        QUOTATION({commit}, quotation) {
            return new Promise((resolve, reject) => {
                ApiService.post("quotation", quotation)
                    .then(() => {
                        resolve();
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_UNIT_LIST: (state, data) => {
            state.unit = data;
        }
    }
}
