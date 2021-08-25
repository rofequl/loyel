import ApiService from "@/core/services/api.service";

export default {
    state: {
        city: [],
    },

    getters: {
        cityList: state => state.city,
        cityById: state => id => state.city.filter(value => value.region_id === id),
    },

    actions: {
        CITY_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("city")
                    .then(({data}) => {
                        commit('SET_CITY_LIST', data);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_CITY_LIST: (state, data) => {
            state.city = data;
        },
        CITY_MODIFY: (state, data) => {
            Object.assign(state.city.find(element => element.id === data.id), data);
        },
        CITY_ADD: (state, data) => {
            state.city.unshift(data);
        },
        CITY_REMOVE: (state, data) => {
            let index = state.city.findIndex(value => value.id === data);
            state.city.splice(index, 1);
        }
    }

}
