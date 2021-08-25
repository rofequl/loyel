import ApiService from "@/core/services/api.service";
import JwtService from "@/core/services/jwt.service";
import router from "../../router";

const auth = {
    state: {
        user: {},
        store: {},
        financial: {},
        contact: {},
        isLoad: false,
        sellerAccess: false,
        isAuthenticated: !!JwtService.getToken()
    },
    getters: {
        isAuthenticated: state => state.isAuthenticated,
        currentUser: state => state.user,
        userStore: state => state.store,
        userFinancial: state => state.financial,
        userContact: state => state.contact,
        isLoadProfile: state => state.isLoad,
        vacation: state => state.store.vacation,
        isCustomerOrLogin: state => state.isAuthenticated && (state.user.user_type === 0 || state.user.user_type === 3),
        isSellerOrLogin: state => state.isAuthenticated && (state.user.user_type === 2 || state.user.user_type === 3),
        isSellerAccess: state => state.isAuthenticated && (state.user.seller_access === 'Yes'),

    },
    actions: {
        REGISTER({commit}, credentials) {
            return new Promise((resolve, reject) => {
                ApiService.post("user/registers", credentials)
                    .then(({data}) => {
                        commit('SET_AUTH', data);
                        resolve();
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        LOGIN({commit}, credentials) {
            return new Promise((resolve, reject) => {
                ApiService.post("user/login", credentials)
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
                ApiService.post("user/logout")
                commit('PURGE_AUTH');
                router.push({name: 'home'}).catch(() => {
                });
            }
        },
        VERIFY_AUTH({commit, state}) {
            return new Promise((resolve, reject) => {
                if (JwtService.getToken()) {
                    ApiService.setHeader();
                    ApiService.get("user/profile")
                        .then(({data}) => {
                            commit('SET_AUTH_USERS', data.user);
                            commit('SET_USERS_STORE', data.store);
                            commit('SET_USERS_FINANCIAL', data.financial);
                            commit('SET_USERS_CONTACT', data.contact);
                            commit('SET_USERS_WISHLIST', data.wishlist);
                            commit('SET_TOTAL_NOTIFICATION', data.notification.total);
                            commit('SET_NOTIFICATION_LIST', data.notification.list);
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
        VACATION_UPDATE({commit}, data) {
            commit('VACATION_UPDATE', data.active);
            return new Promise((resolve, reject) => {
                ApiService.post("vacation-mode", data)
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
        SET_AUTH: (state, user) => {
            state.isAuthenticated = true;
            JwtService.saveToken(user.token);
        },
        PURGE_AUTH: (state) => {
            state.isAuthenticated = false;
            state.user = {};
            JwtService.destroyToken();
        },
        SET_AUTH_USERS: (state, user) => {
            state.user = user;
        },
        SET_USERS_STORE: (state, store) => {
            state.store = store;
        },
        SET_USERS_FINANCIAL: (state, financial) => {
            state.financial = financial;
        },
        SET_USERS_CONTACT: (state, contact) => {
            state.contact = contact;
        },
        VACATION_UPDATE: (state, vacation) => {
            state.store.vacation = vacation;
        }
    }
};

export default auth
