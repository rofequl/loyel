import ApiService from "@/core/services/api.service";

export default {
    state: {
        notification: 0,
        notificationMessage: [],
        allNotification: [],
    },
    getters: {
        totalNotification: state => state.notification,
        notificationList: state => state.notificationMessage,
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
        SET_TOTAL_NOTIFICATION: (state, data) => {
            state.notification = data;
        },
        SET_NOTIFICATION_LIST: (state, data) => {
            state.notificationMessage = data;
        },
        SET_ALL_NOTIFICATION_LIST: (state, data) => {
            state.allNotification = data;
        },
    }
}
