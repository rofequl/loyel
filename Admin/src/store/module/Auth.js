import ApiService from "@/core/services/api.service";
import JwtService from "@/core/services/jwt.service";
import router from "../../router";

const auth = {
    state: {
        user: {},
        permission: [],
        isLoad: false,
        isAuthenticated: !!JwtService.getToken(),
    },
    getters: {
        isAuthenticated: state => state.isAuthenticated,
        isHasPermission: state => data => state.permission.indexOf(data) !== -1,
        currentUser: state => state.user,
        isLoadProfile: state => state.isLoad,
    },
    actions: {
        LOGIN({commit}, credentials) {
            return new Promise((resolve, reject) => {
                ApiService.post("admin/login", credentials)
                    .then(({data}) => {
                        commit('SET_AUTH', data);
                        resolve();
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        LOGOUT({commit, state}) {
            if (state.isAuthenticated) {
                ApiService.post("admin/logout")
                commit('PURGE_AUTH');
                router.push({name: 'login'});
            }
        },
        VERIFY_AUTH({commit, state}) {
            return new Promise((resolve, reject) => {
                if (JwtService.getToken()) {
                    ApiService.setHeader();
                    ApiService.get("admin/profile")
                        .then(({data}) => {
                            commit('SET_AUTH_USERS', data.user);
                            commit('SET_USER_PERMISSION', data.permission);
                            commit('SET_NOTIFICATION_LIST', data.notification);
                            resolve();
                        })
                        .catch(error => {
                            reject(error)
                        })
                        .finally(state.isLoad = true)
                } else {
                    resolve();
                }
            });
        },
        UPDATE_PERMISSION({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("admin/update-permission")
                    .then(({data}) => {
                        commit('SET_USER_PERMISSION', data);
                        resolve();
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_AUTH: (state, user) => {
            state.isAuthenticated = true;
            JwtService.saveToken(user.token);
        },
        SET_USER_PERMISSION: (state, user) => {
            state.permission = user;
        },
        PURGE_AUTH: (state) => {
            state.isAuthenticated = false;
            state.user = {};
            JwtService.destroyToken();
        },
        SET_AUTH_USERS: (state, user) => {
            state.user = user;
        },
    }
};

export default auth
