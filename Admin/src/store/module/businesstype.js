import ApiService from "@/core/services/api.service";

export default {
    state: {
        business_type: [],
    },

    getters: {
        business_typeList: state => state.business_type,
        business_typeIndex: state => id => state.business_type.findIndex(value => value.id === id) + 1,
    },

    actions: {
        BUSINESS_TYPE_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("business-type")
                    .then(({data}) => {
                        commit('SET_BUSINESS_TYPE_LIST', data);
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_BUSINESS_TYPE_LIST: (state, data) => {
            state.business_type = data;
        },
        BUSINESS_TYPE_MODIFY: (state, data) => {
            Object.assign(state.business_type.find(element => element.id === data.id), data);
        },
        BUSINESS_TYPE_ADD: (state, data) => {
            state.business_type.unshift(data);
        },
        BUSINESS_TYPE_REMOVE: (state, data) => {
            let index = state.business_type.findIndex(value => value.id === data);
            state.business_type.splice(index, 1);
        }
    }

}
