import ApiService from "@/core/services/api.service";

export default {
    state: {
        notification: [],
        allNotification: [],
    },

    getters: {
        notificationList: state => state.notification,
        allNotificationList: state => state.allNotification,
    },

    actions: {
        NOTIFICATION_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("notification")
                    .then(({data}) => {
                        commit('SET_ALL_NOTIFICATION_LIST', data);
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_NOTIFICATION_LIST: (state, data) => {
            state.notification = data;
        },
        SET_ALL_NOTIFICATION_LIST: (state, data) => {
            state.allNotification = data;
        },
    }

}
