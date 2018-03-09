<?php

Route::get('/', 'HomeController@index');

/*
	For Test Paymetn
*/
Route::get('authorize', 'AuthorizenetController@authorize');

//FOLDERS
Route::resource('folders', 'FoldersController', ['except' => ['destroy', 'create']]);
Route::get('folder/{id}/download', 'FolderDownloadController@download');

//PHOTOS
Route::get('photo/{id}/download', 'PhotoDownloadController@download');
Route::get('photos/recent', 'PhotosController@recent');
Route::post('photos/{id}/copy', 'PhotoCopyController@copy');
Route::post('photo/attach-to-user', 'PhotoAttachController@attach');
Route::resource('photos', 'PhotosController', ['except' => ['destroy', 'create']]);

//DELETE FOLDERS AND PHOTOS
Route::post('delete-items', 'DeleteItemsController@delete');

//TRASH
Route::get('user-trash', 'TrashController@getUserTrash');
Route::post('trash/restore/{id}', 'TrashController@restore');
Route::post('trash/put', 'TrashController@put');

//USERS
Route::get('users/space-usage', 'UsersController@getSpaceUsage');
Route::resource('users', 'UsersController', ['only' => ['update', 'index', 'destroy']]);
Route::post('users', 'UsersController@destroyAll');
Route::post('users/{id}/avatar', 'AvatarController@change');
Route::delete('users/{id}/avatar', 'AvatarController@remove');

//STATS
Route::get('stats', 'StatsController@analytics');

//Settings
Route::post('settings', ['uses' => 'SettingsController@updateSettings']);
Route::get('settings', 'SettingsController@getAllSettings');
Route::get('settings/ini/max_upload_size', ['uses' => 'SettingsController@serverMaxUploadSize']);

//Image Sticker
Route::get('image/sticker', 'ImageStickerController@index');
Route::get('image/sticker/groupby', 'ImageStickerController@getStickerGrouped');
Route::post('image/sticker/{type}/upload', 'ImageStickerController@upload');
Route::delete('image/sticker/remove/{id}', 'ImageStickerController@remove');

//ACTIVITY
Route::resource('activity', 'ActivityController', ['only' => ['store', 'index', 'destroy']]);

//SEARCH
Route::get('search/{query}', 'SearchController@findFoldersAndPhotos');

//Admin ORDER
Route::get('order', 'OrderController@getOrders');

//Admin Product
Route::get('category', 'ProductController@getCategory');
Route::post('category/add', 'ProductController@addCategory');
Route::post('category/delete', 'ProductController@deleteCategory');
Route::post('category/update', 'ProductController@updatecategory');
Route::get('product', 'ProductController@getProduct');
Route::post('product/update', 'ProductController@updateProduct');
Route::post('product/add', 'ProductController@addProduct');
Route::post('product/imageupload', 'ProductController@imageupload');

//Admin Artwork
Route::get('artworkpage', 'ArtworkController@getArtwork');
Route::post('artwork/approve', 'ArtworkController@approveArtwork');
Route::post('artwork/deny', 'ArtworkController@denyArtwork');
Route::post('artwork/sell', 'ArtworkController@submitSellArtwork');

//Admin Vendor Approval
Route::get('vendor', 'VendorController@getAllVendors');
Route::post('vendor/approve', 'VendorController@approveVendor');
Route::post('vendor/deny', 'VendorController@denyVendor');
Route::get('vendor/payment', 'VendorController@vendorPayemntRelease');
Route::post('vendor/payment-update', 'VendorController@vendorPayemntReleaseUpdate');

//Admin Image Upload
Route::post('image', 'OrderController@imageUpload');


//Admin Promo code
Route::get('promocode', 'PromoCodeController@getPromoCode');
Route::post('promocode/add', 'PromoCodeController@addPromoCode');
Route::post('promocode/update', 'PromoCodeController@updatePromoCode');

//Vendor Gallery Setting
Route::post('gallery/logoupload', 'PhotosController@galleryimageupload');
Route::post('update/gallery-logo', 'PhotosController@updateGalleryLogo');
Route::post('update/about-artist', 'PhotosController@updateAboutArtist');

//Contact
Route::post('contact', 'ContactController@contactUser');

//Vendor
Route::post('vendor/add', 'VendorController@addVendors');

//Get Home Page
Route::get('home', 'IndexController@getLastBlogs');

//Get Home Page
Route::get('authuser', 'IndexController@getAuthUser');

// Get 2 Random Users Home Page
Route::get('randomuser', 'IndexController@getRandomUser');

//Get latest 4 Artworks Home Page
Route::get('latestartworks', 'IndexController@getRecentArtworks');

//Users Artwork
Route::post('userartwork', 'ArtworkController@getUersArtwork');
Route::get('usersartwork', 'ArtworkController@getUsersArtwork');

//All Artwork for front end
Route::get('user/artwork', 'ArtworkController@getAllArtwork');

//All Products for front end
Route::get('user/product', 'UserProductController@getAllProducts');

//Users Artwork Favourite page
Route::post('favartwork', 'ArtworkController@addtoFavourite');
Route::get('artwork/favourite', 'ArtworkController@getFavouriteArtwork');

//All Products for front end
Route::get('relatedproduct', 'UserProductController@getRelatedProducts');

Route::get('cart', 'CartController@getArtCart');
Route::post('removeArtCart', 'CartController@removeArtCart');

Route::post('productcart', 'ProductCartController@getProductCart');
//Add to cart
Route::post('addcart', 'CartController@addtoCart');
Route::post('delete/cartproduct', 'ProductCartController@deleteCartProduct');
Route::post('productaddcart', 'ProductCartController@addProducttoCart');

//Get Single Products for front end
Route::post('singleproduct', 'UserProductController@getSingleProduct');

//
Route::get('getbilling', 'CheckoutController@getBillingDetail');
Route::post('billing/add-update', 'CheckoutController@updateBillingDetail');
Route::get('getshipping', 'CheckoutController@getShippingDetail');
Route::post('shipping/add-update', 'CheckoutController@updateShippingDetail');
Route::post('apply/promo-code', 'CheckoutController@checkPromoCode');

//Account
Route::get('account', 'AccountController@getUser');
Route::post('account/update', 'AccountController@postUser');
Route::get('shipping', 'AccountController@getShippingAddress');
Route::post('shipping/update', 'AccountController@updateShippingAddress');
Route::get('billing', 'AccountController@getBillingAddress');
Route::post('billing/update', 'AccountController@updateBillingAddress');
Route::post('sellersetting/add', 'AccountController@addSellerSettings');
//ORDER
Route::get('orders', 'UserOrderController@getOrder');
Route::post('place/order', 'UserOrderController@placeOrder');

Route::post('order/payment', 'AuthorizenetController@doPayment');


//SOCIAL AUTHENTICATION
Route::get('auth/social/{provider}', 'SocialAuthController@connectToProvider');
Route::get('auth/social/{provider}/login', 'SocialAuthController@loginCallback');
Route::post('auth/social/request-email-callback', 'SocialAuthController@requestEmailCallback');
Route::post('auth/social/connect-accounts', 'SocialAuthController@connectAccounts');

//LABELS
Route::post('labels/attach', 'LabelsController@attach');
Route::post('labels/detach', 'LabelsController@detach');
Route::get('labels/{label}', 'LabelsController@getPhotosLabeled');

//shareable (folder or photo)
Route::post('shareable-password/add', 'ShareableController@addPassword');
Route::post('shareable-password/remove', 'ShareableController@removePassword');
Route::post('shareable-password/check', 'ShareableController@checkPassword');
Route::post('shareable/preview', 'ShareableController@show');

Route::post('password/change', 'Auth\PasswordChangeController@change');

Route::controllers([
    'auth' => 'AuthController',
    'password' => 'Auth\PasswordController',
]);

Route::get('delete-old-accounts', 'OldAccountsDeleteController@delete');