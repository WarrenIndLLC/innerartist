(function() {
    'use strict';    
    var app = angular.module('mainApp',
        [
            'ngRoute',
            'ngTouch',
            'ngFileUpload',
            'angularUtils.directives.dirPagination',
            'httpService',
            'ngSanitize'
    ]);

    app.constant('version', 'v0.1.0')
   
    .config(function($routeProvider) {
        $routeProvider
        .when('/', {
            title : "home",
            controller : 'homeCtrl',
            templateUrl: 'views/home.html'
        })
        .when('/artwork', {
            title : "artwork",
            controller : 'artworkCtrl',
            templateUrl: 'views/artwork.html'
        })
        .when('/artwork/:userID', {
            title : "artwork",
            controller : 'artworkCtrl',
            templateUrl: 'views/user-artwork.html'
        })
        .when('/products', {
            title : "products",
            controller : 'productCtrl',
            templateUrl: 'views/products.html'
        })
        .when('/products/:productID', {
            title : "products",
            controller : 'productCtrl',
            templateUrl: 'views/single-product.html'
        })
        .when('/aboutus', {
            title : "About US",
            controller : 'cmsCtrl',
            templateUrl: 'views/aboutus.html'
        })
        .when('/help', {
            title : "Help",
            controller : 'cmsCtrl',
            templateUrl: 'views/help.html'
        })
        
        .when('/customer-services', {
            title : "Customer Services",
            controller : 'cmsCtrl',
            templateUrl: 'views/customer-services.html'
        })
        .when('/contact', {
            title : "contact",
            controller : 'contactCtrl',
            templateUrl: 'views/contact.html'
        })
        .when('/faq', {
            title : "FAQ",
            controller : 'cmsCtrl',
            templateUrl: 'views/faq.html'
        })
        .when('/cart', {
            title : "cart",
            controller : 'cartCtrl',
            templateUrl: 'views/cart.html'
        })
        .when('/favourite', {
            title : "favourite",
            controller : 'favCtrl',
            templateUrl: 'views/favourite.html'
        })
        .when('/apply-today', {
            title : "Apply Today",
            controller : 'cmsCtrl',
            templateUrl: 'views/apply-today.html'
        })
        .when('/checkout', {
            title : "Checkout",
            controller : 'mainController',
            templateUrl: 'views/checkout.html'
        })
        .when('/gift-cards', {
            title : "Gift Cards",
            controller : 'cmsCtrl',
            templateUrl: 'views/gift-cards.html'
        })
        .when('/email-promotions', {
            title : "Email Promotions",
            controller : 'cmsCtrl',
            templateUrl: 'views/email-promotions.html'
        })
        .when('/national-charity-info', {
            title : "National Charity Info",
            controller : 'cmsCtrl',
            templateUrl: 'views/national-charity-info.html'
        })
        .when('/disclaimer', {
            title : "Disclaimer",
            controller : 'cmsCtrl',
            templateUrl: 'views/disclaimer.html'
        })
        .when('/returns', {
            title : "returns",
            controller : 'cmsCtrl',
            templateUrl: 'views/returns.html'
        })
        .when('/terms', {
            title : "TERMS OF USE",
            controller : 'cmsCtrl',
            templateUrl: 'views/terms.html'
        })
        .when('/privacy', {
            title : "PRIVACY POLICY",
            controller : 'cmsCtrl',
            templateUrl: 'views/privacy.html'
        })
        .when('/feedback', {
            title : "FEEDBACK",
            controller : 'cmsCtrl',
            templateUrl: 'views/feedback.html'
        })
        .when('/sitemap', {
            title : "Site Map",
            controller : 'cmsCtrl',
            templateUrl: 'views/sitemap.html'
        })
         .otherwise({
            redirectTo: '/'
          });
    });


    app.run(function ($rootScope, $location,$route) {
        $rootScope.$on('$routeChangeStart', function (e,current,prev) { 
            console.info(current,"PATH");
            var title = routeTitle(current);
            if(title){
                $rootScope.title = title;
            }
            jQuery(document).ready(function($) {
                $("html, body").animate({ scrollTop: 0 }, "slow");
                $("#menu").removeClass('hide');
                $("#menu").mmenu({
                    "offCanvas": {
                        "position": "top",
                        "zposition": "top"
                    }
                });
                var API = $("#menu").data("mmenu");
                $("#menu-button").click(function() {
                    API.open();
                });
            });
        });
    });
    
})();