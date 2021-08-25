import ApiService from "@/core/services/api.service";

export default {
    state: {
        staff: [],
    },

    getters: {
        staffList: state => state.staff,
        staffListIndex: state => id => state.staff.findIndex(value => value.id === id) + 1,
    },

    actions: {
        STAFF_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("staffs")
                    .then(({data}) => {
                        commit('SET_STAFF_LIST', data);
                        resolve();
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_STAFF_LIST: (state, data) => {
            state.staff = data;
        },
        STAFF_ADD: (state, data) => {
            state.staff.unshift(data);
        },
        STAFF_MODIFY: (state, data) => {
            Object.assign(state.staff.find(element => element.id === data.id), data);
        },
        STAFF_REMOVE: (state, data) => {
            let index = state.staff.findIndex(value => value.id === data);
            state.staff.splice(index, 1);
        },
    }

}
