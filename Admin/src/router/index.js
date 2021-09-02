import Vue from 'vue'
import Router from 'vue-router'
import store from '@/store'

Vue.use(Router)

const isAdminLoggedIn = (to, from, next) => store.getters.isAuthenticated ? next() : next({name: 'login'})

const isAdminLoggedOut = (to, from, next) => store.getters.isAuthenticated ? next({name: 'login'}) : next()

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
            redirect: "/dashboard",
            component: () => import("@/layout/Layout"),
            beforeEnter: isAdminLoggedIn,
            children: [
                {
                    meta: {title: 'Dashboard'},
                    path: "/dashboard",
                    name: "dashboard",
                    component: () => import("@/pages/Dashboard.vue")
                },
                // Product
                {
                    meta: {title: 'Product List'},
                    path: "/product/product-list",
                    name: "product-list",
                    component: () => import("@/pages/product/Product")
                },
                {
                    meta: {title: 'Seller Products'},
                    path: "/product/seller-product-list",
                    name: "seller-product-list",
                    component: () => import("@/pages/product/SellerProduct")
                },
                {
                    meta: {title: 'Product create'},
                    path: "/product/product-create",
                    name: "product-create",
                    component: () => import("@/pages/product/add/ProductCreate")
                },
                {
                    meta: {title: 'Category Manage'},
                    path: "/product/category",
                    name: "category",
                    component: () => import("@/pages/product/Category")
                },
                {
                    meta: {title: 'Brand Manage'},
                    path: "/product/brand",
                    name: "brand",
                    component: () => import("@/pages/product/Brand")
                },
                {
                    meta: {title: 'Sub-Category Manage'},
                    path: "/product/sub-category",
                    name: "subcategory",
                    component: () => import("@/pages/product/SubCategory")
                },
                {
                    meta: {title: 'Sub-Subcategory Manage'},
                    path: "/product/sub-subcategory",
                    name: "subsubcategory",
                    component: () => import("@/pages/product/SubSubCategory")
                },
                {
                    meta: {title: 'Product Attribute'},
                    path: "/product/attribute",
                    name: "attribute",
                    component: () => import("@/pages/product/Attribute")
                },
                // Customer
                {
                    meta: {title: 'Customers List'},
                    path: "/customer/customer-list",
                    name: "customer-list",
                    component: () => import("@/pages/customer/Customer")
                },
                {
                    meta: {title: 'Customers Profile'},
                    path: "/customer/customer-profile/:id",
                    name: "customer-profile",
                    component: () => import("@/pages/customer/CustomerProfile")
                },
                // Seller
                {
                    meta: {title: 'Seller List'},
                    path: "/seller/seller-list",
                    name: "seller-list",
                    component: () => import("@/pages/seller/Seller")
                },
                {
                    meta: {title: 'Seller Profile'},
                    path: "/seller/seller-profile/:id",
                    name: "seller-profile",
                    component: () => import("@/pages/seller/SellerProfile")
                },
                {
                    meta: {title: 'Seller Commission'},
                    path: "/seller/seller-commission",
                    name: "seller-commission",
                    component: () => import("@/pages/seller/Commission")
                },
                // Marketing
                {
                    meta: {title: 'Flash Deals'},
                    path: "/marketing/flash-deals",
                    name: "Flash Deals",
                    component: () => import("@/pages/marketing/FlashDeal")
                },
                {
                    meta: {title: 'Flash Deals'},
                    path: "/marketing/flash-deals/:slug",
                    name: "flash-edit",
                    component: () => import("@/pages/marketing/add/FlashCreate")
                },
                {
                    meta: {title: 'Request for Quotation'},
                    path: "/marketing/quotation",
                    name: "Quotation",
                    component: () => import("@/pages/marketing/Quotation")
                },
                {
                    meta: {title: 'Create New Flash Deals'},
                    path: "/marketing/flash-deals-create",
                    name: "Flash Deals Create",
                    component: () => import("@/pages/marketing/add/FlashCreate")
                },
                {
                    meta: {title: 'Subscribers List'},
                    path: "/marketing/subscribers-list",
                    name: "subscribers-list",
                    component: () => import("@/pages/marketing/Subscribers")
                },
                {
                    meta: {title: 'Newsletter'},
                    path: "/marketing/newsletters",
                    name: "newsletters",
                    component: () => import("@/pages/marketing/Newsletter")
                },
                {
                    meta: {title: 'Bulk SMS'},
                    path: "/marketing/bulk-sms",
                    name: "bulk-sms",
                    component: () => import("@/pages/marketing/BulkSMS")
                },
                // Setup & Configurations
                {
                    meta: {title: 'General Settings'},
                    path: "/setup/general-setting",
                    name: "general-setting",
                    component: () => import("@/pages/setup/General")
                },
                {
                    meta: {title: 'Website Pages'},
                    path: "/setup/pages",
                    name: "website-pages",
                    component: () => import("@/pages/setup/Pages")
                },
                {
                    meta: {title: 'Home Page Settings'},
                    path: "/admin/setup/home-edit",
                    name: "home-edit",
                    component: () => import("@/pages/setup/pages/Home")
                },
                {
                    meta: {title: 'Frequently Asked Questions'},
                    path: "/admin/setup/faq-set",
                    name: "faq-set",
                    component: () => import("@/pages/setup/pages/Faq")
                },
                {
                    meta: {title: 'Privacy Page Settings'},
                    path: "/admin/setup/privacy-edit",
                    name: "privacy-edit",
                    component: () => import("@/pages/setup/pages/Privacy")
                },
                {
                    meta: {title: 'Terms & Condition Page Settings'},
                    path: "/admin/setup/terms-edit",
                    name: "terms-edit",
                    component: () => import("@/pages/setup/pages/Terms")
                },
                {
                    meta: {title: 'About Page Settings'},
                    path: "/admin/setup/about-edit",
                    name: "about-edit",
                    component: () => import("@/pages/setup/pages/About")
                },
                {
                    meta: {title: 'Product Settings'},
                    path: "/setup/setup-attributes",
                    name: "setup-attributes",
                    component: () => import("@/pages/setup/Product")
                },
                {
                    meta: {title: 'Business Type'},
                    path: "/setup/business-type",
                    name: "business-type",
                    component: () => import("@/pages/setup/BusinessType")
                },
                // Shipping
                {
                    meta: {title: 'Shipping Configuration'},
                    path: "/shipping/configuration",
                    name: "shipping-configuration",
                    component: () => import("@/pages/shipping/Shipping")
                },
                {
                    meta: {title: 'Region Manage'},
                    path: "/shipping/region",
                    name: "shipping-region",
                    component: () => import("@/pages/shipping/Region")
                },
                {
                    meta: {title: 'City Manage'},
                    path: "/shipping/city",
                    name: "shipping-city",
                    component: () => import("@/pages/shipping/City")
                },
                {
                    meta: {title: 'Area Manage'},
                    path: "/shipping/area",
                    name: "shipping-area",
                    component: () => import("@/pages/shipping/Area")
                },
                // Sales
                {
                    meta: {title: 'All Orders'},
                    path: "/sales/all-orders",
                    name: "all-orders",
                    component: () => import("@/pages/sales/AllOrder")
                },
                {
                    meta: {title: 'Orders Details'},
                    path: "/sales/all-orders/:code",
                    name: "orders-details",
                    component: () => import("@/pages/sales/OrderDetails")
                },
                // Staffs
                {
                    meta: {title: 'Staffs Information'},
                    path: "/staffs",
                    name: "staffs",
                    component: () => import("@/pages/staffs/Staffs")
                },
                {
                    meta: {title: 'All Notification'},
                    path: "/notification",
                    name: "notification",
                    component: () => import("@/pages/Notification")
                },
            ]
        },
        {
            meta: {title: 'Admin - Login'},
            path: "/login",
            name: "login",
            beforeEnter: isAdminLoggedOut,
            component: () => import("@/pages/Login"),
        },
        {
            path: "/error",
            component: () => import("@/layout/Layout"),
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
            component: () => import("@/layout/Layout"),
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
