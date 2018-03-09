function routeTitle(route){

    if(route.$$route && route.$$route.title){
        return route.$$route.title;
    }

    return "";
} 