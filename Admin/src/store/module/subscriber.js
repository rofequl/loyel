import ApiService from "@/core/services/api.service";

export default {
    state: {
        subscriber: [],
        newsletter: [{
            title: '',
            elements: []
        }],
        bulkSMS: [{
            title: '',
            elements: []
        }],
    },

    getters: {
        subscriberList: state => state.subscriber,
        newsletterList: state => state.newsletter,
        bulkSMSList: state => state.bulkSMS,
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
        NEWSLETTER_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("newsletter-email")
                    .then(({data}) => {
                        commit('SET_NEWSLETTER_LIST', data);
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        BULKSMS_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("newsletter-mobile")
                    .then(({data}) => {
                        commit('SET_BULKSMS_LIST', data);
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
        SET_NEWSLETTER_LIST: (state, data) => {
            data.length > 0 ? state.newsletter = data : '';
        },
        SET_BULKSMS_LIST: (state, data) => {
            data.length > 0 ? state.bulkSMS = data : '';
        },
        SUBSCRIBER_REMOVE: (state, data) => {
            let index = state.subscriber.findIndex(value => value.id === data);
            state.subscriber.splice(index, 1);
        },
    }

}
