import ApiService from "@/core/services/api.service";

export default {
    state: {
        order_list: [],
    },

    getters: {
        orderList: state => state.order_list,
        getOrderByCode: state => code => state.order_list.find(value => value.order_code == code),
    },

    actions: {
        ORDER_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("order")
                    .then(({data}) => {
                        commit('SET_ORDER_LIST', data);
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        ORDER_CANCEL({commit}, data) {
            return new Promise((resolve, reject) => {
                commit('ORDER_DELIVERY_UPDATE', data);
                ApiService.post("order-cancel", data)
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
        ORDER_DELIVERY_UPDATE: (state, data) => {
            state.order_list.find(element => element.order_code === data.order_code).delivered_status = data.value;
        },
    }

}
