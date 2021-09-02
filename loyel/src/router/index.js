import Vue from 'vue'
import Router from 'vue-router'
import store from '@/store'

Vue.use(Router)

const isSellerLoggedIn = (to, from, next) => store.getters.isSellerOrLogin ? next() : next({name: 'seller-entry'})

const isSellerLoggedOut = (to, from, next) => store.getters.isSellerOrLogin ? next({name: 'seller-dashboard'}) : next()

const isSellerAccess = (to, from, next) => store.getters.isSellerAccess ? next() : next({name: 'seller-dashboard'})

const isCustomerLoggedIn = (to, from, next) => store.getters.isCustomerOrLogin ? next() : next({name: 'login'})


export default new Router({
    mode: 'history',
    linkActiveClass: 'active',
    scrollBehavior: () => ({y: 0}),
    routes: configRoutes()
})

function configRoutes() {
    return [
        {
            path: "/",
            component: () => import("@/layout/Frontend"),
            children: [
                {
                    meta: {title: 'Home'},
                    path: "/",
                    name: "home",
                    component: () => import("@/pages/Home")
                },
                {
                    meta: {title: 'SHOCKING DEAL'},
                    path: "/campaign/:slug",
                    name: "Campaign",
                    component: () => import("@/pages/Deal")
                },
                {
                    meta: {title: 'Product'},
                    path: "/product/:slug",
                    name: "Product",
                    component: () => import("@/pages/product/Product")
                },
                {
                    meta: {title: 'Categories'},
                    path: "/category/:cat?/:sub?/:subcat?",
                    name: "category",
                    component: () => import("@/pages/ProductList")
                },
                {
                    meta: {title: 'Cart Product'},
                    path: "/cart",
                    name: "cart",
                    component: () => import("@/pages/product/Cart")
                },
                {
                    meta: {title: 'Wishlist Product'},
                    path: "/wishlist",
                    name: "wishlist",
                    component: () => import("@/pages/product/WishList")
                },
                {
                    meta: {title: 'Shop Product'},
                    path: "/shop/:id",
                    name: "shop",
                    component: () => import("@/pages/product/Shop")
                },
                {
                    meta: {title: 'Request for Quotation'},
                    path: "/quotation",
                    name: "Quotation",
                    component: () => import("@/pages/Quotation")
                },
                {
                    meta: {title: 'Terms and Condition'},
                    path: "/terms-conditions",
                    name: "terms-conditions",
                    component: () => import("@/pages/footer/Terms"),
                },
                {
                    meta: {title: 'Privacy Policy'},
                    path: "/privacy-policy",
                    name: "privacy-policy",
                    component: () => import("@/pages/footer/Privacy"),
                },
                {
                    meta: {title: 'Frequently Asked Questions'},
                    path: "/faq",
                    name: "faq",
                    component: () => import("@/pages/footer/Faq"),
                },
                {
                    meta: {title: 'Frequently Asked Questions'},
                    path: "/questions",
                    name: "Questions",
                    component: () => import("@/pages/footer/FaqDetails"),
                },
                {
                    meta: {title: 'All Notification'},
                    path: "/notification",
                    name: "Notification",
                    component: () => import("@/pages/Notification"),
                },
                {
                    meta: {title: 'All Categories List'},
                    path: "/categories",
                    name: "All Categories",
                    component: () => import("@/pages/Category"),
                },

            ]
        },
        {
            path: "/",
            component: () => import("@/layout/Customer"),
            beforeEnter: isCustomerLoggedIn,
            children: [
                {
                    meta: {title: 'User Profile'},
                    path: "/profile",
                    name: "profile",
                    component: () => import("@/pages/account/Profile")
                },
                {
                    meta: {title: 'Address Book Manage'},
                    path: "/address-book",
                    name: "address-book",
                    component: () => import("@/pages/account/Address")
                },
                {
                    meta: {title: 'My Order List'},
                    path: "/order",
                    name: "order-list",
                    component: () => import("@/pages/account/Order")
                },
                {
                    meta: {title: 'Orders Details'},
                    path: "/order/:code",
                    name: "orders-details",
                    component: () => import("@/pages/account/OrderDetails")
                },
                {
                    meta: {title: 'My Bank Account'},
                    path: "/bank-account",
                    name: "BankAccount",
                    component: () => import("@/components/seller/account/FinancialDetails")
                },
                {
                    meta: {title: 'Change Password'},
                    path: "/change-password",
                    name: "ChangePassword",
                    component: () => import("@/pages/account/PasswordChange")
                },
            ]
        },
        {
            meta: {title: 'User Login'},
            path: "/login",
            name: "login",
            component: () => import("@/pages/account/Login")
        },
        {
            meta: {title: 'Seller Login'},
            path: "/seller-entry",
            name: "seller-entry",
            beforeEnter: isSellerLoggedOut,
            component: () => import("@/pages/seller/Login")
        },
        {
            path: "/seller",
            redirect: "/seller/dashboard",
            component: () => import("@/layout/Seller"),
            beforeEnter: isSellerLoggedIn,
            children: [
                {
                    meta: {title: 'Seller Dashboard'},
                    path: "/seller/dashboard",
                    name: "seller-dashboard",
                    component: () => import("@/pages/seller/Dashboard")
                },
                {
                    meta: {title: 'Manage Profile'},
                    path: "/seller/account",
                    name: "seller-account",
                    component: () => import("@/pages/seller/account/SellerProfile")
                },
                {
                    meta: {title: 'Your Store'},
                    path: "/seller/store",
                    name: "seller-store",
                    component: () => import("@/pages/seller/account/Store")
                },
                {
                    meta: {title: 'Product List'},
                    path: "/seller/product-list",
                    name: "product-list",
                    beforeEnter: isSellerAccess,
                    component: () => import("@/pages/seller/product/Product")
                },
                {
                    meta: {title: 'Product create'},
                    path: "/seller/product-create",
                    name: "product-create",
                    beforeEnter: isSellerAccess,
                    component: () => import("@/pages/seller/product/ProductCreate")
                },
                {
                    meta: {title: 'Account Management'},
                    path: "/seller/account-management",
                    name: "account-management",
                    component: () => import("@/pages/seller/account/AccountManage")
                },
            ]
        },
        {
            path: "/error",
            component: () => import("@/layout/Frontend"),
            children: [
                {
                    meta: {title: 'Error 500'},
                    path: "/error",
                    name: "error-500",
                    component: () => import("@/pages/error/Error-500"),
                }
            ]
        },
        {
            path: "*",
            component: () => import("@/layout/Frontend"),
            children: [
                {
                    meta: {title: 'Error 404'},
                    path: "*",
                    name: "error-404",
                    component: () => import("@/pages/error/Error-404"),
                }
            ]
        },
    ]
}
