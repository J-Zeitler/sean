'use strict'

angular.module('sean', ['ngRoute'])

  .config ($routeProvider) ->
    $routeProvider
    .when '/',
      templateUrl: 'partials/feed',
      controller: 'feedCtrl'

    .otherwise
      redirectTo: '/'


console.log 'app loaded'