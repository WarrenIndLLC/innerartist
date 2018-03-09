angular.module('mainApp')
	.controller('mainController', ['$scope','$location', '$http','$rootScope','httpService','$routeParams',function($scope, $location, $http,$rootScope,httpService,$routeParams) {
		console.info("mainController");
        $rootScope.baseurl = 'innerartist/';
		$scope.formData = {};
        $scope.vendorFormdata = {};
        $rootScope.productCart = [];
        var newDate = new Date();
        $scope.year = newDate.getFullYear();
        $rootScope.authUser = false;
        
        httpService._get($rootScope.baseurl+'authuser',{}).then(function(response){
            if(response.status){
                $rootScope.authUser = response.data;
            }
            $scope.getProdctCart();
            $scope.cartResponse();
        });

        $scope.getProductCartLocal = function(){
            $rootScope.total = 0;
            $rootScope.shipping_fee = 0;
            $rootScope.net_total = 0;
            var oldCarts = localStorage.getItem("innerartist_product");
            if(oldCarts!=undefined){
                var response = [];
                var responseData = JSON.parse(oldCarts);
                angular.forEach(responseData, function(details) {  
                    if(details!=null){
                        var row = JSON.parse(details);
                        if(parseInt(row.quantity)<1){
                            row.quantity= 1;
                        }
                        /*
                            Price Calculate
                        */
                        var total_price = parseFloat(row.price) * parseInt(row.quantity);
                        var price = parseFloat(row.price);
                        row.price = price.toFixed(2);

                        /*
                        Shipping Fee
                        */
                        var shipping = parseFloat(row.flat_rate)  * parseInt(row.quantity);
                        $rootScope.shipping_fee = parseFloat($rootScope.shipping_fee) + parseFloat(shipping);

                        var flat_rate = parseFloat(row.flat_rate);
                        row.flat_rate = flat_rate.toFixed(2);
                         /*
                            Total Calculate
                        */
                        var total = total_price;// + parseFloat(row.flat_rate);
                        row.total = parseFloat(total).toFixed(2);
                        $rootScope.total = parseFloat(row.total) + parseFloat($rootScope.total);

                        response.push(row);
                    }
                });
                /*console.log(response.length);    */
                $rootScope.productCart = response;
                var net_total =  $rootScope.total + $rootScope.shipping_fee;
                console.log($rootScope.total);
                $rootScope.total =  parseFloat($rootScope.total).toFixed(2)
                $rootScope.shipping_fee = parseFloat($rootScope.shipping_fee).toFixed(2);
                $rootScope.net_total = parseFloat(net_total).toFixed(2);
            }
        }

        $scope.cartResponse = function(){
            httpService._get($rootScope.baseurl+'cart').then(function(cartResponse){
                $rootScope.cartItem = cartResponse;
                angular.forEach($rootScope.cartItem, function(row) {   
                    row.size = row.width+"x"+row.height;
                });
            });
        }

        $scope.getProdctCart = function(){
            $scope.formData = {};
            $rootScope.total = 0;
            $rootScope.shipping_fee = 0;
            $rootScope.net_total = 0;
            if($rootScope.authUser){
                $scope.getProductCartLocal();
                $scope.cartForm =  {'cart':$rootScope.productCart};
                httpService._post($rootScope.baseurl+'productcart',$scope.cartForm).then(function(response){
                    localStorage.setItem('innerartist_product','');
                    localStorage.removeItem('innerartist_product');
                    angular.forEach(response.data, function(row) {  
                        if(parseInt(row.quantity)<1){
                            row.quantity= 1;
                        }
                        /*
                            Price Calculate
                        */
                        var total_price = parseFloat(row.price) * parseInt(row.quantity);
                        var price = parseFloat(row.price);
                        row.price = price.toFixed(2);

                        /*
                        Shipping Fee
                        */
                        var shipping = parseFloat(row.flat_rate)  * parseInt(row.quantity);
                        $rootScope.shipping_fee = parseFloat($rootScope.shipping_fee) + parseFloat(shipping);

                        var flat_rate = parseFloat(row.flat_rate);
                        row.flat_rate = flat_rate.toFixed(2);
                         /*
                            Total Calculate
                        */
                        var total = total_price;// + parseFloat(row.flat_rate);
                        row.total = parseFloat(total).toFixed(2);
                        $rootScope.total = parseFloat(row.total) + parseFloat($rootScope.total);
                    });

                    $rootScope.productCart = response.data;
                    var net_total =  $rootScope.total + $rootScope.shipping_fee;
                    $rootScope.total =  parseFloat($rootScope.total).toFixed(2)
                    $rootScope.shipping_fee = parseFloat($rootScope.shipping_fee).toFixed(2);
                    $rootScope.net_total = parseFloat(net_total).toFixed(2);                
                });
            }else{
                $scope.getProductCartLocal();
            }
        }

        

        $scope.redirectToProduct = function(productID){
            $.fancybox.close();
            if(productID!=undefined && productID!=0){
                $location.path("/products/"+productID);
            }else{
                $location.path("/products");
            }
        }

        $scope.viewArtDetails = function(row){
            $scope.artDetails = row;
        }

        $scope.removeFromCart = function(cartID){
            $.fancybox.close();
            $rootScope.loader = true;
            httpService._post($rootScope.baseurl+'removeArtCart',{'cartID':cartID}).then(function(response){
                $rootScope.loader = false;
                if(response.status){
                    $scope.message = "Thank You for contacting us!";
                    $rootScope.cartItem = response.data;
                    angular.forEach($rootScope.cartItem, function(row) {   
                        row.size = row.width+"x"+row.height;
                    });
                }else{
                    $scope.errorMsg = "There is an error,Please try again.";
                }
            });
        }

        $scope.openImage = function(row){
            $scope.image = row;
        }

        $scope.addVendor = function(){
            console.log($scope.vendorFormdata);
            $scope.vendorFormdata.user_id = $rootScope.authUser.id;
            console.log($scope.vendorFormdata);
            httpService._post($rootScope.baseurl+'vendor/add',$scope.vendorFormdata).then(function(response){});
        }
        
        
        $scope.markAsFavorites = function(artID,status){
            $scope.artLoader = true;
            httpService._post($rootScope.baseurl+'favartwork',{'art_id':artID,'status':status})
            .then(function(response){
                $scope.artLoader = false;
                if(response.success){
                    $scope.artworkDetails.is_liked = response.status;
                }               
            });
        }

        $scope.addCart = function(artID){
            $scope.artLoader = true;
            httpService._post($rootScope.baseurl+'addcart',{'art_id':artID})
            .then(function(response){
                $scope.artLoader = false;
                $scope.artworkDetails.addedTOCart = response.status;
                $rootScope.cartItem = response.data;
                angular.forEach($rootScope.cartItem, function(row) {   
                    row.size = row.width+"x"+row.height;
                });
            });
        }

        $scope.openArtWork = function(row){
            $scope.artworkDetails = row;
        }

}]).controller('homeCtrl', ['$scope','$location', '$http','$rootScope','httpService','$routeParams',function($scope, $location, $http,$rootScope,httpService,$routeParams) {
        console.info("homeCtrl");

        $scope.formData = {};
        
        $rootScope.loader = true;

        httpService._get($rootScope.baseurl+'randomuser',{})
        .then(function(response){
            $scope.randomUser = response;
            $rootScope.loader = false;
        });

        httpService._get($rootScope.baseurl+'home',{}).then(function(response){
            $scope.blogs = response;
            $rootScope.loader = false;
        });

        httpService._get($rootScope.baseurl+'latestartworks',{})
        .then(function(response){
            $scope.artwork = response;
            $rootScope.loader = false;
        });

}]).controller('contactCtrl', ['$scope','$location', '$http','$rootScope','httpService','$routeParams',function($scope, $location, $http,$rootScope,httpService,$routeParams) {
        console.info("contactCtrl");
        $scope.formData = {};


        $scope.contactUs = function(){
            $rootScope.loader = true;
            httpService._post($rootScope.baseurl+'contact',$scope.formData)
            .then(function(response){
                $rootScope.loader = false;
                if(response.status){                    
                    $scope.message = "Thank You for contacting us!";
                }else{
                    $scope.errorMsg = "Error While submitting Please try again.";
                }
                $scope.formData = {};
            });
        }

}]).controller('artworkCtrl', ['$scope','$location', '$http','$rootScope','httpService','$routeParams',function($scope, $location, $http,$rootScope,httpService,$routeParams) {
        console.info("artworkCtrl");
        $scope.formData = {};

        $scope.size='';
        $rootScope.loader = true;
        if($routeParams.userID!=undefined){
            httpService._post($rootScope.baseurl+'userartwork',{'user_id' : $routeParams.userID}).then(function(response){
                $scope.userArtwork = response;
                $rootScope.loader = false;
            });

            $scope.open = function(row){
                $scope.data = row;
            }
        }else{
            $rootScope.loader = true;
            httpService._get($rootScope.baseurl+'user/artwork').then(function(response){
                $scope.artworks = response;
                angular.forEach($scope.artworks, function(row) {   
                    row.size = row.width+"x"+row.height;
                });
                $rootScope.loader = false;
            });    
        }
        /*httpService._get($rootScope.baseurl+'user/artwork').then(function(response){
            $scope.artworks = response;
            angular.forEach($scope.artworks, function(row) {   
                row.size = row.width+"x"+row.height;
            });
            $rootScope.loader = false;
        });   */     

}]).controller('productCtrl', ['$scope','$location', '$http','$rootScope','httpService','$routeParams',function($scope, $location, $http,$rootScope,httpService,$routeParams) {
        console.info("productCtrl");
        $scope.formData = {};
        $rootScope.loader = true;
        if($routeParams.productID!=undefined){
            $scope.selectedArt = {};

            $scope.selectArts = function(row){
                $scope.errorMsg = false;
                $scope.selectedArt =row;
                $.fancybox.close();
                /*$.fancybox.open('#modalcrop');*/
            }


            httpService._post($rootScope.baseurl+'singleproduct',{'id' : $routeParams.productID})
            .then(function(response){
                $scope.singleProduct = response.product;
                $scope.singleProduct.quantity = 1;
                $scope.relatedProducts = response.related;
                $rootScope.loader = false;
                if($scope.singleProduct.is_canvas_product == 1){
                    $scope.showPagename = "canvasProduct"; 
                    httpService._get($rootScope.baseurl+'cart').then(function(response){
                        $scope.artworks = response;
                    });
                }else{
                   $scope.showPagename = "simpleProduct"; 
                   httpService._get($rootScope.baseurl+'user/artwork').then(function(response){
                        $scope.artworks = response;
                    });
                }
                if(!$rootScope.authuser){
                    var oldCarts = localStorage.getItem("innerartist_product");
                    if(oldCarts!=undefined){
                        var responseData = JSON.parse(oldCarts);
                        angular.forEach(responseData, function(details) {  
                            if(details!=null){
                                var row = JSON.parse(details);
                                if(row.id==$scope.singleProduct.id){
                                    $scope.singleProduct.addedTOCart = true;
                                }
                            }
                        });
                    }
                }
            });

            $scope.productAddToCart = function(productRow){
                if($scope.selectedArt.art_id!=undefined){
                    $scope.errorMsg = false;
                    $rootScope.loader = true;
                    if($rootScope.productCart.indexOf(productRow)>-1){
                        $scope.singleProduct.addedTOCart = true;
                    }

                    if($rootScope.authUser){
                        $scope.productData = {
                            'product_id':productRow.id,
                            'art_id' : $scope.selectedArt.art_id
                        }
                        httpService._post($rootScope.baseurl+'productaddcart',$scope.productData).then(function(response){
                            $scope.singleProduct.addedTOCart = response.status;
                            $rootScope.loader = false;
                            $scope.getProdctCart();
                        });
                    }else{
                        productRow.art_id = $scope.selectedArt;
                        $scope.singleProduct.addedTOCart = true;
                        var value=[];
                        var oldCarts = JSON.parse(localStorage.getItem("innerartist_product"));
                        if(oldCarts!=undefined){
                            angular.forEach(oldCarts, function(row) {  
                                if(row!=null){
                                    var details = JSON.parse(row);
                                    value[details.id] = row;
                                }
                            });
                        }
                        value[productRow.id] = JSON.stringify(productRow);                    
                        localStorage.setItem('innerartist_product',JSON.stringify(value));
                        $rootScope.loader = false;
                        $scope.getProdctCart();
                    }
                }else{
                    $scope.errorMsg = "Please select art first";
                }
            }

            $scope.viewArtWorkDetails = function(row){
                $scope.artWorkDetails = row;
            }

            $scope.viewProductDetaisl = function(row){
                $scope.prodctDetails = row;
            }

            $scope.addCart = function(artID){
                $scope.artLoader = true;
                httpService._post($rootScope.baseurl+'addcart',{'art_id':artID})
                .then(function(response){
                    $scope.artLoader = false;
                    $scope.artWorkDetails.addedTOCart = response.status;                
                });
            }

            
        }else{
            httpService._get($rootScope.baseurl+'user/product').then(function(response){
                $rootScope.loader = false;
                $scope.products = response.product;
                $scope.category = response.category;                
            }); 

            $scope.filter = {
                'category' : '',
                'price' : 'price'
            };
            $scope.priceFilterExp = true;
            $scope.size='DESC';
            $scope.changePrice = function(){
                if($scope.size=='DESC'){
                    $scope.priceFilterExp = true;    
                }else{
                    $scope.priceFilterExp = false;    
                }                    
            }
        }
}])

.controller('cmsCtrl', ['$scope','$location', '$http','$rootScope','httpService','$routeParams',function($scope, $location, $http,$rootScope,httpService,$routeParams) {
        console.info("cmsCtrl");
        $scope.formData = {};
}])

.controller('cartCtrl', ['$scope','$location', '$http','$rootScope','httpService','$routeParams',function($scope, $location, $http,$rootScope,httpService,$routeParams) {
        console.info("cartCtrl");
        $scope.formData = {};
        $scope.promoCode ={};
        $scope.placeorder = false;

        $scope.updatePrice = function(){
            $rootScope.total = 0;
            $rootScope.shipping_fee = 0;
            $rootScope.net_total = 0;
            var value = [];
            
            angular.forEach($rootScope.productCart, function(row) {  
                value[row.id] = JSON.stringify(row);
                if(parseInt(row.quantity)<1){
                    row.quantity= 1;
                }
                /*
                    Price Calculate
                */
                var total_price = parseFloat(row.price) * parseInt(row.quantity);
                var price = parseFloat(row.price);
                row.price = price.toFixed(2);

                /*
                Shipping Fee
                */
                var shipping = parseFloat(row.flat_rate)  * parseInt(row.quantity);
                $rootScope.shipping_fee = parseFloat($rootScope.shipping_fee) + parseFloat(shipping);

                var flat_rate = parseFloat(row.flat_rate);
                row.flat_rate = flat_rate.toFixed(2);
                 /*
                    Total Calculate
                */
                var total = total_price;// + parseFloat(row.flat_rate);
                row.total = parseFloat(total).toFixed(2);
                $rootScope.total = parseFloat(row.total) + parseFloat($rootScope.total);
            });
            localStorage.setItem('innerartist_product',JSON.stringify(value));
            var net_total =  $rootScope.total + $rootScope.shipping_fee;
            $rootScope.total =  $rootScope.total.toFixed(2)
            $rootScope.shipping_fee = parseFloat($rootScope.shipping_fee).toFixed(2);
            $rootScope.net_total = net_total.toFixed(2);
        }

         $scope.doApplyCoupon = function(){
            console.log($scope.promoCode);
            $rootScope.loader = true;
            httpService._post($rootScope.baseurl+'apply/promo-code',$scope.promoCode).then(function(response){
                if(response.data){
                    $scope.msg = "Code Apply Successfully";
                    $scope.netPrice = $rootScope.net_total-response.data[0].total_cart_discount;
                    $rootScope.net_total = $scope.netPrice;
                    $rootScope.loader = false;
                }else{
                    $scope.errorMsg = "This Promo Code is not Valid";
                    $rootScope.loader = false;
                }  
            });
        }

        $scope.updateCart = function(){
            $rootScope.loader = true;
            $scope.formData.product = $scope.productCart;
            httpService._post($rootScope.baseurl+'place/order',$scope.formData).then(function(response){
                if(response.success){
                    $rootScope.loader = false;
                }  
            });
        }

        $scope.doMinus = function(rows){
            rows.quantity = rows.quantity-1;
            var price = parseFloat(rows.price) * parseInt(rows.quantity);
            rows.total = price.toFixed(2);
            var index = $rootScope.productCart.indexOf(rows);
            $rootScope.productCart[index] = rows;
            $scope.updatePrice();
            $scope.updateCart();
        }

        $scope.doAddItem = function(rows){
            rows.quantity = parseInt(rows.quantity)+1;   
            var price = parseFloat(rows.price) * parseInt(rows.quantity);
            rows.total = price.toFixed(2);
            var index = $rootScope.productCart.indexOf(rows);
            $rootScope.productCart[index] = rows;
            $scope.updatePrice();
            $scope.updateCart();
        }

        $scope.deleteCartItem = function(row){
            console.log(row);
            var index = $rootScope.productCart.indexOf(row);
            $rootScope.productCart.splice(index, 1);
            httpService._post($rootScope.baseurl+'delete/cartproduct',{'cartID':row.id}).then(function(response){
                $scope.updatePrice();
                $scope.updateCart();
            });
        }

        /*********** Checkout ***********/
        $scope.billing = {};
        $scope.shipping = {};
        $scope.step = 1;

        $scope.confirmOrder = function(){
            if($rootScope.authUser){
                $rootScope.loader = true;
                $scope.formData.product = $rootScope.productCart;
                $scope.showPagename = "";
                httpService._post($rootScope.baseurl+'place/order',$scope.formData).then(function(response){
                    if(response.success){
                        $rootScope.loader = false;
                        $scope.placeorder = true;
                        httpService._get($rootScope.baseurl+'getbilling').then(function(response){
                            $scope.billing = response.billing;
                            $scope.shipping = response.shipping;
                            $scope.showPagename = "";
                        });
                    }  
                });
            }else{
                location.href = $rootScope.baseurl+"#/login/cart";
            }
            
        }
        $scope.billing = {};
        $scope.updateBilling = function(bill){
            $scope.billing = bill;
            $rootScope.loader = true;
            /*console.log(bill);*/
            httpService._post($rootScope.baseurl+'billing/add-update',$scope.billing).then(function(response){1
                if(response.success){
                    $rootScope.loader = false;
                    $scope.step = 2;
                    $scope.showPagename = "showShipping";   
                    $("html, body").animate({ scrollTop: 0 }, "slow");
                }                                  
            });
        }

        $scope.updateShipping = function(ship){
            /*console.log($scope.billing);*/
            $scope.shipping = ship;
            /*console.log($scope.shipping);*/

            $rootScope.loader = true;           
            if($scope.shipping.first_name ==null){                
                $scope.shipping = $scope.billing;  
                $scope.shipping.order_note = ship.order_note;
            }
            httpService._post($rootScope.baseurl+'shipping/add-update',$scope.shipping).then(function(response){
                if(response.success){
                    $rootScope.loader = false;
                    $scope.step = 3
                    $scope.showPagename = "showReview";
                }
            });
        }

        $scope.showCheckoutBilling = function(){
            $scope.showPagename = "";
        }

        $scope.showCheckoutShipping = function(){
            $scope.showPagename = "showShipping";
        }

        $scope.showReviewPayment = function(){
            $scope.showPagename = "showReview";
        }

        $scope.doPayment = function(){
            $rootScope.loader = true;
            $scope.formData.order_note = $scope.shipping.order_note;
            $scope.formData.product = $rootScope.productCart;
            $scope.formData.total_amount= $rootScope.net_total;
            /*console.log($scope.formData);*/
            httpService._post($rootScope.baseurl+'order/payment',$scope.formData).then(function(response){
                if(response.success){
                    $rootScope.productCart={};
                    localStorage.setItem('innerartist_product','');
                    localStorage.removeItem('innerartist_product');
                    $rootScope.loader = false;
                    $scope.message = response.message;
                    $rootScope.productCart = [];
                    $scope.cartForm =  {'cart':$rootScope.productCart};
                    httpService._post($rootScope.baseurl+'productcart',$scope.cartForm).then(function(response){                    
                        $rootScope.productCart = response;               
                    });
                }else{
                    $rootScope.loader = false;
                    $scope.errormessage = response.message;
                }
                $("html, body").animate({ scrollTop: 0 }, "slow");
            });
        }
}])

.controller('favCtrl', ['$scope','$location', '$http','$rootScope','httpService','$routeParams',function($scope, $location, $http,$rootScope,httpService,$routeParams) {
        console.info("favCtrl");
        $scope.formData = {};
        $rootScope.loader = true;
        httpService._get($rootScope.baseurl+'artwork/favourite').then(function(response){
            $rootScope.loader = false;
            $scope.favArtwork = response;
        });

        $scope.viewFavArtDetails = function(row){
            $scope.favArtDetails = row;
        }
}]);


angular.module('mainApp').filter('searchFilter',function($filter) {
        return function(items,searchfilter) {
           var isSearchFilterEmpty = true;
            angular.forEach(searchfilter, function(searchstring) {   
                if(searchstring !=null && searchstring !=""){
                    isSearchFilterEmpty= false;
                }
            });
            if(!isSearchFilterEmpty){
                    var result = [];  
                    angular.forEach(items, function(item) {  
                        var isFound = false;
                         angular.forEach(item, function(term,key) {                         
                             if(term != null &&  !isFound){
                                 term = term.toString();
                                 term = term.toLowerCase();
                                    angular.forEach(searchfilter, function(searchstring) {      
                                        searchstring = searchstring.toLowerCase();
                                        if(searchstring !="" && term.indexOf(searchstring) !=-1 && !isFound){
                                           result.push(item);
                                            isFound = true;
                                        }
                                    });
                             }
                                });
                           });
                return result;
            }else{
             return items;
            }
    }
});