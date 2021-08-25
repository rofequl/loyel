import ApiService from "@/core/services/api.service";

export default {
    state: {
        privacy: '',
        terms_condition: '',
        about_us: '',
    },

    getters: {
        privacy: state => state.privacy,
        terms_condition: state => state.terms_condition,
        about_us: state => state.about_us,
    },

    actions: {
        PAGE_SETUP({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("page-setup")
                    .then(({data}) => {
                        commit('SET_PRIVACY_PAGE', data.data.privacy);
                        commit('SET_TERMS_PAGE', data.data.terms_condition);
                        commit('SET_ABOUT_PAGE', data.data.about_us);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },

        PAGE_UPDATE({state}) {
            return new Promise((resolve, reject) => {
                ApiService.post("page-setup", state)
                    .then(() => {
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
        SET_ABOUT_PAGE: (state, data) => {
            state.about_us = data;
        },
    }

}
