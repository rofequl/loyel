import ApiService from "@/core/services/api.service";

export default {
    state: {
        attribute: [],
    },

    getters: {
        attributeList: state => state.attribute,
        attributeById: (state) => (data) => {
            if (data.position === 1) return state.attribute.filter(value => value.category_id === data.id);
            if (data.position === 2) return state.attribute.filter(value => value.subcategory_id === data.id);
            if (data.position === 3) return state.attribute.filter(value => value.sub_subcategory_id === data.id);
        },
    },

    actions: {
        ATTRIBUTE_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("attribute")
                    .then(({data}) => {
                        commit('SET_ATTRIBUTE_LIST', data);
                        resolve();
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_ATTRIBUTE_LIST: (state, data) => {
            state.attribute = data;
        },
        ATTRIBUTE_MODIFY: (state, data) => {
            Object.assign(state.attribute.find(element => element.id === data.id), data);
        },
        ATTRIBUTE_ADD: (state, data) => {
            state.attribute.unshift(data);
        },
        ATTRIBUTE_REMOVE: (state, data) => {
            let index = state.attribute.findIndex(value => value.id === data);
            state.attribute.splice(index, 1);
        }
    }
}
