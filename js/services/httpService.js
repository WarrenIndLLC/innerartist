var httpService = angular.module("httpService", []);
//Declare all api request here
httpService.service("httpService", ['$http', '$q',  '$filter', '$rootScope','$location', function ($http, $q, $filter, $rootScope,$location) {
        this.api_url = "";

        this._post =  function(url,formdata){
            var deferred = $q.defer();
            $data = formdata;
            $http(
                {
                    method: 'POST',
                    url: url,
                    headers: {},
                    //cache: true,
                    data: $data
                }).success(function (response, status) {  
                   // console.info(response);
                    return deferred.resolve(response);
                }).
                 error(function(error,status) {
                    return deferred.reject(error);
                });

            return deferred.promise;
        }

        this._get =  function(url){
            var deferred = $q.defer();
            
            $http(
                {
                    method: 'GET',
                    url: url,
                    headers: {},
                    //cache: true,
                   
                }).success(function (response, status) {  
                   // console.info(response);
                    return deferred.resolve(response);
                }).
                 error(function(error,status) {
                    return deferred.reject(error);
                });

            return deferred.promise;
        }

        this.userPost =  function(url,formdata){
            
            var deferred = $q.defer();

            if(!$rootScope.authToken) return deferred.reject(); 
            $data = {
                'data' : formdata,
                'auth_token' : $rootScope.authToken 
            }
            $http(
                {
                    method: 'POST',
                    url: url,
                    headers: {},                    
                    data: $data
                }).success(function (response, status) {  
                   // console.info(response);
                    if(response.ng_denied){
                        localStorage.clear();
                        $rootScope.userData = null;
                        $rootScope.authToken = null;
                        $rootScope.isLoggedIn = false;
                   
                        $location.path($rootScope.loginType+"/login");
                    }
                    return deferred.resolve(response);
                }).
                 error(function(error,status) {
                    return deferred.reject(error);
                });

            return deferred.promise;
        }

        return this;
    }]);

httpService.service("uploadService", ['$http', '$q',  '$filter', '$rootScope','Upload', function ($http, $q, $filter, $rootScope,Upload) {

    // upload on file select or drop
        this.upload = function (file,data,url,uploadSrc,isAuthNeeded) {
            var deferred = $q.defer();
            Upload.upload({
                url: url,
                method: 'POST',
                file:  uploadSrc ? null : file,
                crossDomain: true,
                //sendFieldsAs: 'form',
                fields: {
                    'data': data,
                    'auth_token' : isAuthNeeded ? $rootScope.authToken : "",
                    'send_image' : uploadSrc ? uploadSrc : ""
                }
                
            }).then(function (resp) {
               // console.log(resp);
                return deferred.resolve(resp);
            }, function (resp) {
                //console.log('Error status: ' + resp.status);
                return deferred.reject(resp);
            }, function (evt) {
                var progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
                //console.log('progress: ' + progressPercentage + '% ');
            });
        return deferred.promise;
        };
        // end file upload code

        return this;

}]);