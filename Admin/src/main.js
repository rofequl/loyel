import 'core-js/stable'
import Vue from 'vue'
import '@/core/mixins'
import App from './App'
import router from './router'


import {iconsSet as icons} from './assets/icons/icons.js'
import store from './store/index'
import ApiService from "@/core/services/api.service";

// Vue 3rd party plugins
import "./core/plugins/bootstrap";
import {i18n} from "@/core/plugins/i18n";

ApiService.init();

Vue.config.performance = true
Vue.config.productionTip = false;

Vue.prototype.$log = console.log.bind(console)

router.beforeEach((to, from, next) => {
    store.getters.isLoadProfile ? next() : store.dispatch('VERIFY_AUTH').finally(next);
    setTimeout(() => {
        window.scrollTo(0, 0);
    }, 100);
    document.title = to.meta.title;
});
new Vue({
    el: '#app',
    router,
    store,
    icons,
    i18n,
    template: '<App/>',
    components: {
        App
    },
    created() {
        store.dispatch('GENERAL_LIST');
    }
})
