import ApiService from "@/core/services/api.service";

export default {
    state: {
        customer: [],
        customer_details: [],
        loading: false,
    },

    getters: {
        customerList: state => state.customer,
        customerListIndex: state => id => state.customer.findIndex(value => value.id === id) + 1,
        singleCustomerIsLoaded: state => !state.loading,
        getCustomerById: state => code => state.customer_details.find(value => value.customer_id === code),
    },

    actions: {
        CUSTOMER_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("customer-list")
                    .then(({data}) => {
                        commit('SET_CUSTOMER_LIST', data);
                        resolve();
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        CUSTOMER_BLOCK({commit}, data) {
            return new Promise((resolve, reject) => {
                commit('SET_CUSTOMER_BLOCK', data);
                ApiService.post("user-block", data)
                    .then(() => {
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        CUSTOMER_DETAILS({commit}, id) {
            commit('SINGLE_CUSTOMER_LOADING')
            return new Promise((resolve, reject) => {
                ApiService.get("customer-details/" + id)
                    .then(({data}) => {
                        commit('SET_SINGLE_CUSTOMER_DETAILS', data);
                        resolve(data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_CUSTOMER_LIST: (state, user) => {
            state.customer = user;
        },
        CUSTOMER_ADD: (state, data) => {
            state.customer.unshift(data);
        },
        CUSTOMER_MODIFY: (state, data) => {
            Object.assign(state.customer.find(element => element.id === data.id), data);
        },
        SET_CUSTOMER_BLOCK: (state, data) => {
            state.customer.find(element => element.id === data.id).status = data.active;
        },
        SET_SINGLE_CUSTOMER_DETAILS: (state, data) => {
            let index = state.customer_details.find(value => value.customer_id === data.customer_id);
            if (!index) state.customer_details.unshift(data);
            else Object.assign(state.customer_details.find(element => element.customer_id === data.customer_id), data);
            state.loading = false;
        },
        SINGLE_CUSTOMER_LOADING(state, loading = true) {
            state.loading = loading;
        }
    }

}
