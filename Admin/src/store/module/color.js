import ApiService from "@/core/services/api.service";

export default {
    state: {
        color: [],
    },

    getters: {
        colorList: state => state.color,
        colorIndex: state => id => state.color.findIndex(value => value.id === id) + 1,
    },

    actions: {
        COLOR_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("color")
                    .then(({data}) => {
                        commit('SET_COLOR_LIST', data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_COLOR_LIST: (state, data) => {
            state.color = data;
        },
        COLOR_MODIFY: (state, data) => {
            Object.assign(state.color.find(element => element.id === data.id), data);
        },
        COLOR_ADD: (state, data) => {
            state.color.unshift(data);
        },
        COLOR_REMOVE: (state, data) => {
            let index = state.color.findIndex(value => value.id === data);
            state.color.splice(index, 1);
        }
    }
}
