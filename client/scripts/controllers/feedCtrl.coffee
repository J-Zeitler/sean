'use strict'

angular.module('sean')
  .controller 'FeedCtrl', ($scope, $http) ->
    $http.get('/users/').success (users) ->
      $scope.users = users