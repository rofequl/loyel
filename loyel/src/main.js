import Vue from 'vue'
import '@/core/mixins'
import App from './App.vue'
import router from './router'
import i18n from './locales'

import store from './store/index'
import ApiService from "@/core/services/api.service";

// Vue 3rd party plugins
import "./core/plugins/bootstrap";

ApiService.init();

Vue.config.performance = true
Vue.config.productionTip = false

router.beforeEach((to, from, next) => {
    store.getters.isLoadProfile ? next() : store.dispatch('VERIFY_AUTH').finally(next);
    document.title = to.meta.title;
});

let handleOutsideClick
Vue.directive('closable', {
    bind(el, binding, vnode) {
        handleOutsideClick = (e) => {
            e.stopPropagation()
            const {handler, exclude} = binding.value
            let clickedOnExcludedEl = false
            exclude.forEach(refName => {
                if (!clickedOnExcludedEl) {
                    const excludedEl = vnode.context.$refs[refName]
                    if (excludedEl) clickedOnExcludedEl = excludedEl.contains(e.target)
                }
            })
            if (!el.contains(e.target) && !clickedOnExcludedEl) {
                vnode.context[handler]()
            }
        }
        document.addEventListener('click', handleOutsideClick)
        document.addEventListener('touchstart', handleOutsideClick)
    },

    unbind() {
        document.removeEventListener('click', handleOutsideClick)
        document.removeEventListener('touchstart', handleOutsideClick)
    }
})

new Vue({
    router,
    store,
    i18n,
    render: h => h(App),
    created() {
        store.dispatch('GENERAL_LIST');
        store.dispatch('CART_PRODUCT_LIST')
    }
}).$mount('#app')
