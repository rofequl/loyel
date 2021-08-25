import ApiService from "@/core/services/api.service";

export default {
    state: {
        business_type: [],
    },

    getters: {
        business_typeList: state => state.business_type,
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
    }

}
