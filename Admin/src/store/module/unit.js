import ApiService from "@/core/services/api.service";

export default {
    state: {
        unit: [],
    },

    getters: {
        unitList: state => state.unit,
        unitIndex: state => id => state.unit.findIndex(value => value.id === id) + 1,
    },

    actions: {
        UNIT_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("unit")
                    .then(({data}) => {
                        commit('SET_UNIT_LIST', data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_UNIT_LIST: (state, data) => {
            state.unit = data;
        },
        UNIT_MODIFY: (state, data) => {
            Object.assign(state.unit.find(element => element.id === data.id), data);
        },
        UNIT_ADD: (state, data) => {
            state.unit.unshift(data);
        },
        UNIT_REMOVE: (state, data) => {
            let index = state.unit.findIndex(value => value.id === data);
            state.unit.splice(index, 1);
        }
    }
}
