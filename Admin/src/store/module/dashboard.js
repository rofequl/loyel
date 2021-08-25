import ApiService from "@/core/services/api.service";

export default {
    state: {
        dashboard: [],
    },
    getters: {
        dashboardList: state => state.dashboard,
    },
    actions: {
        DASHBOARD_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("dashboard")
                    .then(({data}) => {
                        commit('SET_DASHBOARD_LIST', data);
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_DASHBOARD_LIST: (state, data) => {
            state.dashboard = data;
        },
    }
}