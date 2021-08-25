import ApiService from "@/core/services/api.service";

export default {
    state: {
        address: [],
    },

    getters: {
        addressList: state => state.address,
        defaultAddress: state => state.address.find(value => value.default_shipping === 1),
    },

    actions: {
        ADDRESS_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("address")
                    .then(({data}) => {
                        commit('SET_ADDRESS_LIST', data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_ADDRESS_LIST: (state, data) => {
            state.address = data;
        },
        ADDRESS_MODIFY: (state, data) => {
            Object.assign(state.address.find(element => element.id === data.id), data);
        },
        ADDRESS_ADD: (state, data) => {
            state.address.unshift(data);
        },
        ADDRESS_REMOVE: (state, data) => {
            let index = state.address.findIndex(value => value.id === data);
            state.address.splice(index, 1);
        }
    }

}
