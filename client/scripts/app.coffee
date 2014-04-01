'use strict'

angular.module('sean', ['ngRoute'])

  .config ($routeProvider) ->
    $routeProvider
    .when '/',
      templateUrl: 'partials/feed',
      controller: 'FeedCtrl'

    .otherwise
      redirectTo: '/'


console.log 'app loaded'