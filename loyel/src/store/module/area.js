import ApiService from "@/core/services/api.service";

export default {
    state: {
        area: [],
    },

    getters: {
        areaList: state => state.area,
        areaById: state => id => state.area.filter(value => value.city_id === id),
    },

    actions: {
        AREA_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("area")
                    .then(({data}) => {
                        commit('SET_AREA_LIST', data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_AREA_LIST: (state, data) => {
            state.area = data;
        },
        AREA_MODIFY: (state, data) => {
            Object.assign(state.area.find(element => element.id === data.id), data);
        },
        AREA_ADD: (state, data) => {
            state.area.unshift(data);
        },
        AREA_REMOVE: (state, data) => {
            let index = state.area.findIndex(value => value.id === data);
            state.area.splice(index, 1);
        }
    }

}
