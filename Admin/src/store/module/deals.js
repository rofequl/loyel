import ApiService from "@/core/services/api.service";

export default {
    state: {
        deals: [],
    },

    getters: {
        dealsList: state => state.deals,
        dealsIndex: state => id => state.deals.findIndex(value => value.id === id) + 1,
    },

    actions: {
        DEALS_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("flash-deals")
                    .then(({data}) => {
                        commit('SET_DEALS_LIST', data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        DEALS_ACTIVE({commit}, data) {
            return new Promise((resolve, reject) => {
                commit('SET_DEALS_ACTIVE', data);
                ApiService.post("flash_deal_active", data)
                    .then(() => {
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_DEALS_LIST: (state, data) => {
            state.deals = data;
        },
        DEALS_MODIFY: (state, data) => {
            Object.assign(state.deals.find(element => element.id === data.id), data);
        },
        DEALS_ADD: (state, data) => {
            state.deals.unshift(data);
        },
        DEALS_REMOVE: (state, data) => {
            let index = state.deals.findIndex(value => value.id === data);
            state.deals.splice(index, 1);
        },
        SET_DEALS_ACTIVE: (state, data) => {
            state.deals.find(element => element.id === data.id).status = data.active;
        },
    }

}
