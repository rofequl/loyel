import ApiService from "@/core/services/api.service";

export default {
    state: {
        region: [],
    },

    getters: {
        regionList: state => state.region,
    },

    actions: {
        REGION_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("region")
                    .then(({data}) => {
                        commit('SET_REGION_LIST', data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_REGION_LIST: (state, data) => {
            state.region = data;
        },
        REGION_MODIFY: (state, data) => {
            Object.assign(state.region.find(element => element.id === data.id), data);
        },
        REGION_ADD: (state, data) => {
            state.region.unshift(data);
        },
        REGION_REMOVE: (state, data) => {
            let index = state.region.findIndex(value => value.id === data);
            state.region.splice(index, 1);
        }
    }

}
