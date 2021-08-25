import Vue from 'vue'
import Vuex from 'vuex'

const APP_LANGUAGE = 'app_language'
import storage from "@/core/services/storage.service";
import {loadLanguageAsync} from '@/locales'

import general from "@/store/module/general";
import category from "@/store/module/category";
import subcategory from "@/store/module/subcategory";
import subsubcategory from "@/store/module/subsubcategory";
import home from "@/store/module/home";
import product from "@/store/module/product";
import attribute from "@/store/module/attribute";
import auth from "@/store/module/auth";
import address from "@/store/module/address";
import region from "@/store/module/region";
import city from "@/store/module/city";
import area from "@/store/module/area";
import cart from "@/store/module/cart";
import order from "@/store/module/order";
import brand from "@/store/module/brand";
import unit from "@/store/module/unit";
import color from "@/store/module/color";
import businesstype from "@/store/module/businesstype";
import wishlist from "@/store/module/wishlist";
import page from "@/store/module/page";
import faq from "@/store/module/faq";
import notification from "@/store/module/notification";


Vue.use(Vuex)

export default new Vuex.Store({
    modules: {
        general,
        category,
        subsubcategory,
        subcategory,
        home,
        product,
        attribute,
        auth,
        address,
        region,
        city,
        area,
        cart,
        order,
        brand,
        unit,
        color,
        businesstype,
        wishlist,
        page,
        faq,
        notification
    },
    state: {
        lang: 'en-US',
    },
    getters: {
        lang: state => state.lang,
        isLangBn: state => state.lang === 'bn-BD',
    },
    mutations: {
        [APP_LANGUAGE]: (state, lang) => {
            state.lang = lang
            storage.set(APP_LANGUAGE, lang)
        },
    },
    actions: {
        setLang({commit}, lang) {
            return new Promise((resolve, reject) => {
                commit(APP_LANGUAGE, lang)
                loadLanguageAsync(lang).then(() => {
                    resolve()
                }).catch((e) => {
                    reject(e)
                })
            })
        }
    }
})
