export default [
    {
        _name: 'CSidebarNav',
        _children: [
            {
                _name: 'CSidebarNavItem',
                name: 'Dashboard',
                to: '/dashboard',
                icon: 'cil-home',
            },
            {
                _name: 'CSidebarNavDropdown',
                name: 'Product',
                route: '/product',
                icon: 'cil-basket',
                items: [
                    {
                        name: 'In House Products',
                        to: '/product/product-list'
                    },
                    {
                        name: 'Seller Products',
                        to: '/product/seller-product-list'
                    },
                    {
                        name: 'Brand',
                        to: '/product/brand'
                    },
                    {
                        name: 'Category',
                        to: '/product/category'
                    },
                    {
                        name: 'Sub Category',
                        to: '/product/sub-category'
                    },
                    {
                        name: 'Sub Subcategory',
                        to: '/product/sub-subcategory'
                    },
                    {
                        name: 'Attribute',
                        to: '/product/attribute'
                    },
                ]
            },
            {
                _name: 'CSidebarNavDropdown',
                name: 'Sales',
                route: '/sales',
                icon: 'cil-cart',
                items: [
                    {
                        name: 'All Orders',
                        to: '/sales/all-orders'
                    },
                    {
                        name: 'Seller Orders',
                        to: '/sales/all-orders'
                    },
                ]
            },
            {
                _name: 'CSidebarNavDropdown',
                name: 'Customers',
                route: '/customer',
                icon: 'cil-user',
                items: [
                    {
                        name: 'Customers List',
                        to: '/customer/customer-list'
                    },
                ]
            },
            {
                _name: 'CSidebarNavDropdown',
                name: 'Sellers',
                route: '/seller',
                icon: 'cil-user-follow',
                items: [
                    {
                        name: 'All Seller',
                        to: '/seller/seller-list'
                    },
                    {
                        name: 'Seller Commission',
                        to: '/seller/seller-commission'
                    },
                ]
            },
            {
                _name: 'CSidebarNavDropdown',
                name: 'Marketing',
                route: '/marketing',
                icon: 'cil-bullhorn',
                items: [
                    {
                        name: 'Flash Deals',
                        to: '/marketing/flash-deals'
                    },
                    {
                        name: 'Request for Quotation',
                        to: '/marketing/quotation'
                    },
                    {
                        name: 'Newsletters',
                        to: '/marketing/newsletters'
                    },
                    {
                        name: 'Bulk SMS',
                        to: '/marketing/bulk-sms'
                    },
                    {
                        name: 'Subscribers',
                        to: '/marketing/subscribers-list'
                    },
                    {
                        name: 'Coupon',
                        to: '/marketing/flash-deals'
                    },
                ]
            },
            {
                _name: 'CSidebarNavDropdown',
                name: 'Shipping',
                route: '/shipping',
                icon: 'cil-truck',
                items: [
                    {
                        name: 'Shipping Configuration',
                        to: '/shipping/configuration'
                    },
                    {
                        name: 'Region',
                        to: '/shipping/region'
                    },
                    {
                        name: 'City',
                        to: '/shipping/city'
                    },
                    {
                        name: 'Area',
                        to: '/shipping/area'
                    },
                ]
            },
            {
                _name: 'CSidebarNavDropdown',
                name: 'Setup & Configurations',
                route: '/setup',
                icon: 'cil-screen-desktop',
                items: [
                    {
                        name: 'General Settings',
                        to: '/setup/general-setting'
                    },
                    {
                        name: 'Pages',
                        to: '/setup/pages'
                    },
                    {
                        name: 'Product Settings',
                        to: '/setup/setup-attributes'
                    },
                    {
                        name: 'Business Type',
                        to: '/setup/business-type'
                    },
                ]
            },
            {
                _name: 'CSidebarNavItem',
                name: 'Staffs',
                to: '/staffs',
                icon: 'cib-superuser',
            }
        ]
    }
]
