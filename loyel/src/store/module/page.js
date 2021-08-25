import ApiService from "@/core/services/api.service";

export default {
    state: {
        privacy: '',
        terms_condition: '',
    },

    getters: {
        privacy: state => state.privacy,
        terms_condition: state => state.terms_condition,
    },

    actions: {
        PAGE_SETUP({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("page-setup")
                    .then(({data}) => {
                        commit('SET_PRIVACY_PAGE', data.data.privacy);
                        commit('SET_TERMS_PAGE', data.data.terms_condition);
                        resolve();
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },

    mutations: {
        SET_PRIVACY_PAGE: (state, data) => {
            state.privacy = data;
        },
        SET_TERMS_PAGE: (state, data) => {
            state.terms_condition = data;
        },
    }

}
