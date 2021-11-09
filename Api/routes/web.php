<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->group(['middleware' => 'JWTRefresh', 'namespace' => 'Auth'], function () use ($router) {
    $router->post('token/refresh', 'AdminController@refresh');
});

// Admin route
$router->group(['prefix' => 'admin', 'namespace' => 'Auth'], function () use ($router) {
    $router->post('login', 'AdminController@login');
    $router->post('register', 'AdminController@register');
});

// Customer route
$router->group(['prefix' => 'user', 'namespace' => 'Auth'], function () use ($router) {
    $router->post('check-registers', 'CustomerController@userCheck');
    $router->post('send-otp', 'CustomerController@sendOTP');
    $router->post('login', 'CustomerController@login');
    $router->post('customer-login', 'CustomerController@customerLogin');
    $router->post('seller-login', 'CustomerController@sellerLogin');
    $router->post('registers', 'CustomerController@register');
    $router->post('logout', 'CustomerController@logout');
    $router->post('password-change', 'CustomerController@passwordChange');
    $router->get('profile', 'CustomerController@profile');
});

$router->group(['middleware' => 'auth:api'], function () use ($router) {

    //------------------------------------------------------------------
    //  Seller Route
    //------------------------------------------------------------------

    $router->post('store-update', 'Auth\StoreController@storeUpdate');
    $router->post('financial-update', 'Auth\StoreController@financialUpdate');
    $router->post('shop-contact-update', 'Auth\StoreController@contactUpdate');
    $router->post('store-social-update', 'Auth\StoreController@socialUpdate');
    $router->post('vacation-mode', 'Auth\StoreController@vacationUpdate');

    $router->get('seller-product', 'ProductController@sellerProduct');

    //------------------------------------------------------------------
    //  Customer Route
    //------------------------------------------------------------------
    $router->post('profile-update', 'Auth\CustomerController@profileUpdate');
    $router->post('mail-update', 'Auth\CustomerController@mailUpdate');
    $router->post('number-update', 'Auth\CustomerController@numberUpdate');
    $router->get('address', 'AddressController@index');
    $router->post('address', 'AddressController@store');

    //User Order
    $router->get('order', 'OrderController@userOrder');
    $router->post('order', 'OrderController@store');
    $router->post('order-cancel', 'OrderController@orderCancel');

    $router->get('wishlist', 'ProductController@wishlistIndex');
    $router->post('wishlist', 'ProductController@wishlistStore');


    //------------------------------------------------------------------
    //  Admin Route
    //------------------------------------------------------------------
    $router->get('admin/profile', 'Auth\AdminController@profile');
    $router->get('admin/profile', 'Auth\AdminController@profile');
    $router->post('admin/logout', 'Auth\AdminController@logout');
    $router->get('user-list', 'Auth\AdminController@userList');
    $router->post('admin-user-entry', 'Auth\AdminController@userStoreAdmin');
    $router->put('admin-user-entry/{id}', 'Auth\AdminController@userUpdateAdmin');
    $router->delete('user/{id}', 'Auth\AdminController@destroy');
    $router->get('admin/update-permission', 'Auth\AdminController@profilePermission');

    //Dashboard
    $router->get('dashboard', 'GeneralController@dashboard');

    //Setup & Configurations
    $router->post('general-settings', 'GeneralController@generalStore');
    $router->post('contact-update', 'GeneralController@contactStore');
    $router->post('footer-update', 'GeneralController@footerStore');
    $router->post('language_active', 'GeneralController@languageActive');
    $router->post('default_language', 'GeneralController@languageDefault');
    $router->post('maintenance_active', 'GeneralController@maintenanceActive');
    $router->post('maintenance_date', 'GeneralController@maintenanceDate');
    $router->post('seller_verify_active', 'GeneralController@sellerVerifyActive');
    $router->post('product_verify_active', 'GeneralController@productVerifyActive');

    $router->post('unit', 'UnitController@store');
    $router->put('unit/{id}', 'UnitController@update');
    $router->delete('unit/{id}', 'UnitController@destroy');

    $router->get('color', 'ColorController@index');
    $router->post('color', 'ColorController@store');
    $router->put('color/{id}', 'ColorController@update');
    $router->delete('color/{id}', 'ColorController@destroy');

    $router->post('home-slider-update', 'HomeController@sliderStore');
    $router->post('top_brand_active', 'HomeController@topBrand');
    $router->post('brand-listing', 'HomeController@brandListing');
    $router->post('featured_seller_active', 'HomeController@featuredSeller');
    $router->get('featured_shop_list', 'HomeController@featuredShopList');

    $router->post('business-type', 'BusinessTypeController@store');
    $router->put('business-type/{id}', 'BusinessTypeController@update');
    $router->delete('business-type/{id}', 'BusinessTypeController@destroy');

    //Question
    $router->post('question-category', 'QuestionController@storeCategory');
    $router->put('question-category/{id}', 'QuestionController@updateCategory');
    $router->delete('question-category/{id}', 'QuestionController@destroyCategory');

    $router->post('question-subcategory', 'QuestionController@storeSubcategory');
    $router->put('question-subcategory/{id}', 'QuestionController@updateSubcategory');
    $router->delete('question-subcategory/{id}', 'QuestionController@destroySubcategory');

    $router->post('question', 'QuestionController@store');
    $router->put('question/{id}', 'QuestionController@update');
    $router->delete('question/{id}', 'QuestionController@destroy');
    $router->post('top-question', 'QuestionController@topQuestion');

    //Shipping
    $router->post('shipping-method', 'GeneralController@shipping');

    $router->post('region', 'RegionController@store');
    $router->put('region/{id}', 'RegionController@update');
    $router->delete('region/{id}', 'RegionController@destroy');

    $router->post('city', 'CityController@store');
    $router->put('city/{id}', 'CityController@update');
    $router->delete('city/{id}', 'CityController@destroy');

    $router->post('area', 'AreaController@store');
    $router->post('area-shipping-cost', 'AreaController@shippingCost');
    $router->put('area/{id}', 'AreaController@update');
    $router->delete('area/{id}', 'AreaController@destroy');

    //product
    $router->post('category', ['middleware' => 'permission:4', 'uses' => 'CategoryController@store']);
    $router->post('category-serial', ['middleware' => 'permission:4', 'uses' => 'CategoryController@serial']);
    $router->put('category/{id}', ['middleware' => 'permission:4', 'uses' => 'CategoryController@update']);
    $router->delete('category/{id}', ['middleware' => 'permission:4', 'uses' => 'CategoryController@destroy']);

    $router->post('subcategory', ['middleware' => 'permission:5', 'uses' => 'SubcategoryController@store']);
    $router->post('subcategory-serial', ['middleware' => 'permission:5', 'uses' => 'SubcategoryController@serial']);
    $router->put('subcategory/{id}', ['middleware' => 'permission:5', 'uses' => 'SubcategoryController@update']);
    $router->delete('subcategory/{id}', ['middleware' => 'permission:5', 'uses' => 'SubcategoryController@destroy']);

    $router->post('subsubcategory', ['middleware' => 'permission:6', 'uses' => 'SubSubcategoryController@store']);
    $router->post('subsubcategory-serial', ['middleware' => 'permission:6', 'uses' => 'SubSubcategoryController@serial']);
    $router->put('subsubcategory/{id}', ['middleware' => 'permission:6', 'uses' => 'SubSubcategoryController@update']);
    $router->delete('subsubcategory/{id}', ['middleware' => 'permission:6', 'uses' => 'SubSubcategoryController@destroy']);

    $router->post('brand', ['middleware' => 'permission:3', 'uses' => 'BrandController@store']);
    $router->post('brand-serial', ['middleware' => 'permission:3', 'uses' => 'BrandController@serial']);
    $router->put('brand/{id}', ['middleware' => 'permission:3', 'uses' => 'BrandController@update']);
    $router->delete('brand/{id}', ['middleware' => 'permission:3', 'uses' => 'BrandController@destroy']);

    $router->get('attribute', ['middleware' => 'permission:7,others', 'uses' => 'AttributeController@index']);
    $router->post('attribute/{position}/{id}', ['middleware' => 'permission:7', 'uses' => 'AttributeController@store']);
    $router->post('attribute-update/{position}/{id}', ['middleware' => 'permission:7', 'uses' => 'AttributeController@storeValue']);
    $router->put('attribute/{id}', ['middleware' => 'permission:7', 'uses' => 'AttributeController@update']);
    $router->delete('attribute/{id}', ['middleware' => 'permission:7', 'uses' => 'AttributeController@destroy']);

    $router->get('product', ['middleware' => 'permission:1', 'uses' => 'ProductController@index']);
    $router->get('selling-product', ['middleware' => 'permission:1', 'uses' => 'ProductController@sellingProduct']);
    $router->post('product', ['middleware' => 'permission:2,others', 'uses' => 'ProductController@store']);
    $router->delete('product/{id}', ['middleware' => 'permission:2', 'uses' => 'ProductController@destroy']);
    $router->post('featured_product_active', ['middleware' => 'permission:2', 'uses' => 'ProductController@featured']);
    $router->post('published_product_active', ['middleware' => 'permission:2', 'uses' => 'ProductController@published']);

    //Marketing
    $router->get('flash-deals', 'FlashDealController@index');
    $router->get('flash-deals/{id}', 'FlashDealController@show');
    $router->put('flash-deals/{id}', 'FlashDealController@update');
    $router->post('flash-deals', 'FlashDealController@store');
    $router->delete('flash-deals/{id}', 'FlashDealController@destroy');
    $router->get('flash-deal-product', 'FlashDealController@searchProduct');
    $router->post('flash_deal_active', 'FlashDealController@dealActive');

    $router->get('quotation', 'QuotationController@index');
    $router->delete('quotation/{id}', 'QuotationController@destroy');

    $router->get('newsletter-email', 'NewsletterController@newsletterIndex');
    $router->get('newsletter-mobile', 'NewsletterController@bulkSMSIndex');
    $router->post('newsletter-send', 'NewsletterController@newsletterSend');
    $router->post('send-bulk-sms', 'NewsletterController@bulkSMSSend');
    $router->get('subscriber', 'NewsletterController@index');
    $router->delete('subscriber/{id}', 'NewsletterController@destroy');

    //Customer
    $router->get('customer-list', 'Auth\CustomerController@customerList');
    $router->delete('customer/{id}', 'Auth\CustomerController@destroy');
    $router->get('customer-details/{code}', 'Auth\CustomerController@customerDetails');

    $router->post('user-block', 'Auth\AdminController@userBlock');
    $router->post('user-entry', 'Auth\AdminController@userStore');
    $router->put('user-entry/{id}', 'Auth\AdminController@userUpdate');

    //Seller
    $router->get('seller-list', 'Auth\CustomerController@sellerList');
    $router->get('seller-details/{code}', 'Auth\CustomerController@sellerDetails');
    $router->post('user-verify', 'Auth\AdminController@userVerify');

    $router->get('category-commission', 'CategoryController@sellerCommission');


    //Sales
    $router->get('order-list', 'OrderController@index');
    $router->delete('order/{id}', 'OrderController@destroy');
    $router->get('order-details/{code}', 'OrderController@show');
    $router->post('order-payment', 'OrderController@paymentUpdate');
    $router->post('order-delivery', 'OrderController@deliveryUpdate');

    //Staffs
    $router->get('staffs', 'StaffController@index');
    $router->post('staffs', 'StaffController@store');
    $router->put('staffs/{id}', 'StaffController@update');
    $router->delete('staffs/{id}', 'StaffController@destroy');

    //Notification
    $router->get('notification', 'NotificationController@index');

    //User Manage | Role, Permission
    $router->get('role', 'RoleController@index');
    $router->post('role', 'RoleController@store');
    $router->put('role/{id}', 'RoleController@update');
    $router->delete('role/{id}', 'RoleController@destroy');

    $router->get('permission-list', 'RoleController@permissionIndex');
    $router->post('permission-update', 'RoleController@permissionUpdate');

    //Reports
    $router->get('stock-report', 'ReportController@stockReport');
    $router->get('most-viewed-product', 'ReportController@mostViewed');
    $router->get('sales-report', 'ReportController@salesReport');

});

//Setup & Configurations
$router->get('general-settings', 'GeneralController@generalIndex');
$router->get('home-setup', 'HomeController@index');
$router->get('page-setup', 'PageController@index');
$router->post('page-setup', 'PageController@store');

//Shipping
$router->get('region', 'RegionController@index');
$router->get('city', 'CityController@index');
$router->get('area', 'AreaController@index');

//product
$router->get('category', 'CategoryController@index');
$router->get('subcategory', 'SubcategoryController@index');
$router->get('subsubcategory', 'SubSubcategoryController@index');
$router->get('brand', 'BrandController@index');
$router->get('attribute', 'AttributeController@index');
$router->get('unit', 'UnitController@index');

//Question
$router->get('question', 'QuestionController@index');

//Frontend Home
$router->post('subscribe', 'NewsletterController@store');
$router->get('featured-product', 'ProductController@featuredIndex');

$router->get('deal-product-list/{id}', 'FlashDealController@dealProductList');

$router->get('product-listing', 'ProductController@productListing');
$router->get('product/{slug}', 'ProductController@show');
$router->get('multiple-product/{slug}', 'ProductController@multipleProduct');
$router->get('search-result', 'HomeController@search');
$router->get('business-type', 'BusinessTypeController@index');

$router->get('shop/{id}', 'ProductController@shopDetails');

//print
$router->get('invoice/{code}', 'OrderController@printInvoice');
