import ApiService from "@/core/services/api.service";

export default {
    state: {
        quotation: [],
    },

    getters: {
        quotationList: state => state.quotation,
        quotationIndex: state => id => state.quotation.findIndex(value => value.id === id) + 1,
    },

    actions: {
        QUOTATION_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("quotation")
                    .then(({data}) => {
                        commit('SET_QUOTATION_LIST', data);
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },

    mutations: {
        SET_QUOTATION_LIST: (state, data) => {
            state.quotation = data;
        },
        QUOTATION_REMOVE: (state, data) => {
            let index = state.quotation.findIndex(value => value.id === data);
            state.quotation.splice(index, 1);
        },
    }

}
