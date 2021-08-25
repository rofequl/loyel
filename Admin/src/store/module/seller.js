import ApiService from "@/core/services/api.service";

export default {
    state: {
        seller: [],
        seller_details: [],
        loading: false,
    },

    getters: {
        sellerList: state => state.seller,
        sellerListIndex: state => id => state.seller.findIndex(value => value.id === id) + 1,
        singleSellerIsLoaded: state => !state.loading,
        getSellerById: state => code => state.seller_details.find(value => value.seller_id === code),
    },
    actions: {
        SELLER_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("seller-list")
                    .then(({data}) => {
                        commit('SET_SELLER_LIST', data);
                        resolve();
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        SELLER_UPDATE({getters, dispatch}, id) {
            if (getters.getSellerById(id)) dispatch('SELLER_DETAILS', id);
        },
        SELLER_BLOCK({commit}, data) {
            return new Promise((resolve, reject) => {
                commit('SET_SELLER_BLOCK', data);
                ApiService.post("user-block", data)
                    .then(() => {
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        SELLER_DETAILS({commit}, id) {
            commit('SINGLE_SELLER_LOADING')
            return new Promise((resolve, reject) => {
                ApiService.get("seller-details/" + id)
                    .then(({data}) => {
                        commit('SET_SINGLE_SELLER_DETAILS', data);
                        resolve(data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        SELLER_VERIFY({commit}, data) {
            return new Promise((resolve, reject) => {
                commit('SET_SELLER_VERIFY', data);
                ApiService.post("user-verify", data)
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
        SET_SELLER_LIST: (state, user) => {
            state.seller = user;
        },
        SELLER_ADD: (state, data) => {
            state.seller.unshift(data);
        },
        SELLER_MODIFY: (state, data) => {
            Object.assign(state.seller.find(element => element.id === data.id), data);
        },
        SET_SELLER_BLOCK: (state, data) => {
            state.seller.find(element => element.id === data.id).status = data.active;
        },
        SET_SINGLE_SELLER_DETAILS: (state, data) => {
            let index = state.seller_details.find(value => value.seller_id === data.seller_id);
            if (!index) state.seller_details.unshift(data);
            else Object.assign(state.seller_details.find(element => element.seller_id === data.seller_id), data);
            state.loading = false;
        },
        SINGLE_SELLER_LOADING(state, loading = true) {
            state.loading = loading;
        },
        SET_SELLER_VERIFY: (state, data) => {
            state.seller.find(element => element.id === data.id).seller_verify = data.active;
        },
    }

}
