import ApiService from "@/core/services/api.service";

export default {
    state: {
        color: [],
    },

    getters: {
        colorList: state => state.color,
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
        }
    }
}
