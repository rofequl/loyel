import ApiService from "@/core/services/api.service";

export default {
    state: {
        subscriber: [],
    },

    getters: {
        subscriberList: state => state.subscriber,
        subscriberIndex: state => id => state.subscriber.findIndex(value => value.id === id) + 1,
    },

    actions: {
        SUBSCRIBER_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("subscriber")
                    .then(({data}) => {
                        commit('SET_SUBSCRIBER_LIST', data);
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_SUBSCRIBER_LIST: (state, data) => {
            state.subscriber = data;
        },
        SUBSCRIBER_REMOVE: (state, data) => {
            let index = state.subscriber.findIndex(value => value.id === data);
            state.subscriber.splice(index, 1);
        },
    }

}
