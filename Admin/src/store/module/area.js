import ApiService from "@/core/services/api.service";

export default {
    state: {
        area: [],
    },

    getters: {
        areaList: state => state.area,
        areaIndex: state => id => state.area.findIndex(value => value.id === id) + 1,
        areaById: state => id => state.area.filter(value => value.city_id === id),
    },

    actions: {
        AREA_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("area")
                    .then(({data}) => {
                        commit('SET_AREA_LIST', data);
                        resolve();
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
        AREA_SHIPPING_COST({commit}, data) {
            return new Promise((resolve, reject) => {
                ApiService.post("area-shipping-cost", data)
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
        },
        AREA_SHIPPING_COST: (state, data) => {
            state.area.find(value => value.id === data.id).shipping_cost = data.shipping_cost;
        }
    }

}
