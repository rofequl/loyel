import ApiService from "@/core/services/api.service";

export default {
    state: {
        order_list: [],
        order_details: [],
        loading: false,
    },

    getters: {
        orderList: state => state.order_list,
        orderIndex: state => id => state.order_list.findIndex(value => value.id === id) + 1,
        singleOrderIsLoaded: state => !state.loading,
        getOrderByCode: state => code => state.order_details.find(value => value.order_code == code),
    },

    actions: {
        ORDER_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("order-list")
                    .then(({data}) => {
                        commit('SET_ORDER_LIST', data);
                        resolve();
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        SINGLE_ORDER({commit}, slug) {
            commit('SINGLE_ORDER_LOADING')
            return new Promise((resolve, reject) => {
                ApiService.get("order-details/" + slug)
                    .then(({data}) => {
                        commit('SET_SINGLE_ORDER_LIST', data);
                        resolve(data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        ORDER_PAYMENT_UPDATE({commit}, data) {
            return new Promise((resolve, reject) => {
                commit('ORDER_PAYMENT_UPDATE', data);
                ApiService.post("order-payment", data)
                    .then(() => {
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        ORDER_DELIVERY_UPDATE({commit}, data) {
            return new Promise((resolve, reject) => {
                commit('ORDER_DELIVERY_UPDATE', data);
                ApiService.post("order-delivery", data)
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
        SET_ORDER_LIST: (state, data) => {
            state.order_list = data;
        },
        ORDER_REMOVE: (state, data) => {
            let index = state.order_list.findIndex(value => value.id === data);
            state.order_list.splice(index, 1);
        },
        ORDER_PAYMENT_UPDATE: (state, data) => {
            state.order_details.find(element => element.order_code === data.order_code).payment_status = data.value;
            if (state.order_list.length > 0) state.order_list.find(element => element.order_code === data.order_code).payment_status = data.value;
        },
        ORDER_DELIVERY_UPDATE: (state, data) => {
            state.order_details.find(element => element.order_code === data.order_code).delivered_status = data.value;
            if (state.order_list.length > 0) state.order_list.find(element => element.order_code === data.order_code).delivered_status = data.value;
        },
        SET_SINGLE_ORDER_LIST: (state, data) => {
            let index = state.order_details.find(value => value.order_code === data.order_code);
            if (!index) state.order_details.unshift(data);
            state.loading = false;
        },
        SINGLE_ORDER_LOADING(state, loading = true) {
            state.loading = loading;
        }
    }

}
