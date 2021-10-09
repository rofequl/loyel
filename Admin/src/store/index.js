import Vue from 'vue'
import Vuex from 'vuex'

import auth from "@/store/module/Auth";
import general from "@/store/module/general";
import area from "@/store/module/area";
import city from "@/store/module/city";
import region from "@/store/module/region";
import brand from "@/store/module/brand";
import category from "@/store/module/category";
import subcategory from "@/store/module/subcategory";
import subsubcategory from "@/store/module/subsubcategory";
import attribute from "@/store/module/attribute";
import unit from "@/store/module/unit";
import color from "@/store/module/color";
import product from "@/store/module/product";
import home from "@/store/module/home";
import deals from "@/store/module/deals";
import page from "@/store/module/page";
import user from "@/store/module/user";
import sales from "@/store/module/sales";
import businesstype from "@/store/module/businesstype";
import dashboard from "@/store/module/dashboard";
import quotation from "@/store/module/quotation";
import customer from "@/store/module/customer";
import seller from "@/store/module/seller";
import subscriber from "@/store/module/subscriber";
import rfq from "@/store/module/rfq";
import staff from "@/store/module/staff";
import notification from "@/store/module/notification";
import role from "@/store/module/role";

Vue.use(Vuex)

const state = {
    sidebarShow: 'responsive',
    sidebarMinimize: false
}

const mutations = {
    toggleSidebarDesktop(state) {
        const sidebarOpened = [true, 'responsive'].includes(state.sidebarShow)
        state.sidebarShow = sidebarOpened ? false : 'responsive'
    },
    toggleSidebarMobile(state) {
        const sidebarClosed = [false, 'responsive'].includes(state.sidebarShow)
        state.sidebarShow = sidebarClosed ? true : 'responsive'
    },
    set(state, [variable, value]) {
        state[variable] = value
    }
}

export default new Vuex.Store({
    modules: {
        auth,
        general,
        area,
        city,
        region,
        brand,
        category,
        subcategory,
        subsubcategory,
        attribute,
        unit,
        color,
        product,
        home,
        deals,
        page,
        user,
        sales,
        businesstype,
        dashboard,
        quotation,
        customer,
        seller,
        subscriber,
        rfq,
        staff,
        notification,
        role,


    },
    state,
    mutations
})
