function init(posts){
	var isAnArray = posts instanceof Array;
	
	this.posts = isAnArray ? posts : [posts];
	this.isSinglePost = !isAnArray;
}

angular.module('Blog')
	.factory('Posts', function($resource){
		return $resource('/api/posts/', {}, {
			'all' : { url : '/api/posts', isArray: true, method: 'GET'},
			'byId' : { url : '/api/posts/byId/:id', isArray: false, method: 'GET'},
			'byAuthor' : { url : '/api/posts/byAuthor/:name', isArray: true, method: 'GET'},
			'byTag' : { url : '/api/posts/byTag/:tag', isArray: true, method: 'GET'}
		});
	})
	.factory('Tags', function($resource){
		return $resource('/tags/', {}, {
			'byPost' : { url : '/api/tags/byPost/:id', isArray: false, method: 'GET'}
		});
	})
	.controller("PostCtrl", function($scope, Posts){
		Posts.all().$promise.then(init.bind($scope));
	})
	.controller("PostByIdCtrl", function($scope, Posts, Tags, $routeParams){
		var params = { id : $routeParams.id};
		
		Tags.byPost(params).$promise.then(function(tags){
			$scope.tags = tags;
		});
		
		Posts.byId(params).$promise.then(init.bind($scope));
	})
	.controller("PostByAuthorCtrl", function($scope, Posts, $routeParams){
		Posts.byAuthor({ name :$routeParams.name}).$promise.then(init.bind($scope));
	})
	.controller("PostByTagCtrl", function($scope, Posts, $routeParams){
		Posts.byTag({ tag : $routeParams.tag}).$promise.then(init.bind($scope));
	});
	
