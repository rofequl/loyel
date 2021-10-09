import ApiService from "@/core/services/api.service";

export default {
    state: {
        user: [],
        role: [],
        permission: [],
    },

    getters: {
        userList: state => state.user,
        userListIndex: state => id => state.user.findIndex(value => value.id === id) + 1,
        roleList: state => state.role,
        permissionList: state => state.permission,
        hasPermission: state => data => state.permission.some(value => value.permission_id === data.permission && value.role_id === data.role),
        roleIndex: state => id => state.role.findIndex(value => value.id === id) + 1,
    },

    actions: {
        ROLE_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("role")
                    .then(({data}) => {
                        commit('SET_ROLE_LIST', data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        PERMISSION_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("permission-list")
                    .then(({data}) => {
                        commit('SET_PERMISSION_LIST', data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        PERMISSION_UPDATE({commit, dispatch}, data) {
            commit('PERMISSION_UPDATE', data);
            return new Promise((resolve, reject) => {
                ApiService.post("permission-update", data)
                    .then(() => {
                        dispatch('UPDATE_PERMISSION')
                        resolve()
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        USER_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("user-list")
                    .then(({data}) => {
                        commit('SET_USER_LIST', data);
                        resolve();
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        USER_BLOCK({commit}, data) {
            return new Promise((resolve, reject) => {
                commit('SET_USER_BLOCK', data);
                ApiService.post("user-block", data)
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
        SET_USER_LIST: (state, user) => {
            state.user = user;
        },
        SET_ROLE_LIST: (state, data) => {
            state.role = data;
        },
        SET_PERMISSION_LIST: (state, data) => {
            state.permission = data;
        },
        ROLE_MODIFY: (state, data) => {
            Object.assign(state.role.find(element => element.id === data.id), data);
        },
        ROLE_ADD: (state, data) => {
            state.role.unshift(data);
        },
        ROLE_REMOVE: (state, data) => {
            let index = state.role.findIndex(value => value.id === data);
            state.role.splice(index, 1);
        },
        PERMISSION_UPDATE(state, data) {
            if (data.type === 'add') state.permission.unshift({permission_id: data.permission, role_id: data.role});
            else {
                let index = state.permission.findIndex(value => value.permission_id === data.permission && value.role_id === data.role);
                state.permission.splice(index, 1);
            }
        },
        USER_ADD: (state, data) => {
            state.user.unshift(data);
        },
        SET_USER_BLOCK: (state, data) => {
            state.user.find(element => element.id === data.id).status = data.active;
        },
        USER_MODIFY: (state, data) => {
            Object.assign(state.user.find(element => element.id === data.id), data);
        },
        USER_REMOVE: (state, data) => {
            let index = state.user.findIndex(value => value.id === data);
            state.user.splice(index, 1);
        },
    }

}
