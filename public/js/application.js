angular.module('Blog', ['ngRoute', 'ngResource'])
	.filter('limitWordsTo', function(){
		return function(input, limit){
			var words = input.split(' ');
			
			return words.slice(0, limit).join(' ') + (words.length > limit ? " [...]" : "");
		};
	})
	.config(function($routeProvider, $locationProvider){
		$routeProvider
			.when('/', {
				templateUrl: '/views/partials/posts/posts.html',
		        controller: 'PostCtrl'
			})
			.when('/posts/:id', {
				templateUrl: '/views/partials/posts/posts.html',
		        controller: 'PostByIdCtrl'
			})
			.when('/author/:name', {
				templateUrl: '/views/partials/posts/posts.html',
		        controller: 'PostByAuthorCtrl'
			})
			.when('/tags/:tag', {
				templateUrl: '/views/partials/posts/posts.html',
		        controller: 'PostByTagCtrl'
			});
			
		$locationProvider.html5Mode(true);
	});;

