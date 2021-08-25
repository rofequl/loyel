import ApiService from "@/core/services/api.service";
import storage from "@/core/services/storage.service";
import store from "@/store";

export default {
    state: {
        generals: [],
        footer: [],
        isMaintenance: false,
        maintenanceDate: '',
        isBangla: false,
        defaultLanguage: 1,
    },

    getters: {
        generalSettings: state => state.generals,
        footerList: state => state.footer,
        isBangla: state => state.isBangla,
        isMaintenance: state => state.isMaintenance,
        defaultLanguage: state => state.defaultLanguage,
    },

    actions: {
        GENERAL_LIST({commit}) {
            return new Promise((resolve, reject) => {
                ApiService.get("general-settings")
                    .then(({data}) => {
                        commit('SET_GENERAL_LIST', data.general);
                        commit('SET_FOOTER_LIST', data.footer);
                    })
                    .catch(error => {
                        reject(error)
                    })
            });
        },
    },
    mutations: {
        SET_GENERAL_LIST: (state, data) => {
            state.generals = data;
            switch (data.maintenance_mode) {
                case 1:
                    state.isMaintenance = true;
                    state.maintenanceDate = data.maintenance_date;
                    break;
                case 0:
                    state.isMaintenance = false;
                    state.maintenanceDate = '';
                    break;
            }
            switch (data.default_language) {
                case 1:
                    state.defaultLanguage = 1;
                    break;
                case 2:
                    state.defaultLanguage = 2;
                    break;
            }
            if (data.bangla_language === 1) {
                state.isBangla = true
                store.dispatch('setLang', storage.get('app_language', 'en-US'))
            } else {
                state.isBangla = false
                storage.destroy('app_language')
                store.dispatch('setLang', storage.get('app_language', 'en-US'))
            }
        },
        SET_FOOTER_LIST: (state, data) => {
            state.footer = data;
        }
    }
}
