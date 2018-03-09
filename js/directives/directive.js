angular.module('mainApp')
.directive('filterslider', function() {
  return {       
       link: function( scope, elem, attrs ) { 
       		
          elem.ready(function(){
          	 alert(1); 
          	 console.info(attrs);
          	 scope.$$phase || scope.$apply(attrs.filterslider(scope));
            
          })
       }
    }

})
.directive('typeahead', function($timeout) {
  return {
    restrict: 'E',
    scope: {
		items: '=',
		prompt:'@',
		title: '@',
		subtitle:'@',
		model: '=',		
		onSelect:'&',
		onRemove:'&'
	},
	link:function(scope,elem,attrs){
	   scope.handleSelection=function(selectedItem,title){
	   	
		 scope.model=title;		
		 scope.current=0;
		 scope.selected=true;        
		 $timeout(function(){
			 scope.onSelect({searchKey : selectedItem});
		  },200);
	  };

	  scope.removeSelected = function(){
	  	scope.model="";
		 scope.current=0;
		 scope.selected=true;
		 $timeout(function(){
			 scope.onRemove();
		  },200); 
	  };
	  scope.current=0;
	  scope.selected=true;
	  scope.isCurrent=function(index){
		 return scope.current==index;
	  };
	  scope.setCurrent=function(index){
		 scope.current=index;
	  };
	},
    templateUrl: 'assets/views/templates/templateurl.html'
  }
})
.directive('ngRepeatEndWatch', function () {
    return {
        restrict: 'A',
        scope: {},
        link: function (scope, element, attrs) {
            if (attrs.ngRepeat) {
                if (scope.$parent.$last) {
                    if (attrs.ngRepeatEndWatch !== '') {
                        if (typeof scope.$parent.$parent[attrs.ngRepeatEndWatch] === 'function') {
                            // Executes defined function
                            scope.$parent.$parent[attrs.ngRepeatEndWatch]();
                        } else {
                            // For watcher, if you prefer
                            scope.$parent.$parent[attrs.ngRepeatEndWatch] = true;
                        }
                    } else {
                        // If no value was provided than we will provide one on you controller scope, that you can watch
                        // WARNING: Multiple instances of this directive could yeild unwanted results.
                        scope.$parent.$parent.ngRepeatEnd = true;
                    }
                }
            } else {
                throw 'ngRepeatEndWatch: `ngRepeat` Directive required to use this Directive';
            }
        }
    };
});