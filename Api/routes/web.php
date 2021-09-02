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
    $router->post('admin/logout', 'Auth\AdminController@logout');

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
    $router->post('category', 'CategoryController@store');
    $router->post('category-serial', 'CategoryController@serial');
    $router->put('category/{id}', 'CategoryController@update');
    $router->delete('category/{id}', 'CategoryController@destroy');

    $router->post('subcategory', 'SubcategoryController@store');
    $router->post('subcategory-serial', 'SubcategoryController@serial');
    $router->put('subcategory/{id}', 'SubcategoryController@update');
    $router->delete('subcategory/{id}', 'SubcategoryController@destroy');

    $router->post('subsubcategory', 'SubSubcategoryController@store');
    $router->post('subsubcategory-serial', 'SubSubcategoryController@serial');
    $router->put('subsubcategory/{id}', 'SubSubcategoryController@update');
    $router->delete('subsubcategory/{id}', 'SubSubcategoryController@destroy');

    $router->post('brand', 'BrandController@store');
    $router->post('brand-serial', 'BrandController@serial');
    $router->put('brand/{id}', 'BrandController@update');
    $router->delete('brand/{id}', 'BrandController@destroy');

    $router->get('attribute', 'AttributeController@index');
    $router->post('attribute/{position}/{id}', 'AttributeController@store');
    $router->post('attribute-update/{position}/{id}', 'AttributeController@storeValue');
    $router->put('attribute/{id}', 'AttributeController@update');
    $router->delete('attribute/{id}', 'AttributeController@destroy');

    $router->get('product', 'ProductController@index');
    $router->get('selling-product', 'ProductController@sellingProduct');
    $router->post('product', 'ProductController@store');
    $router->delete('product/{id}', 'ProductController@destroy');
    $router->post('featured_product_active', 'ProductController@featured');
    $router->post('published_product_active', 'ProductController@published');

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
