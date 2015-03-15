angular.module('jashboard').controller('QuoteCtrl', ['$scope', ($scope) ->
  $scope.quotes = [
    {url: 'http://test.com', name: 'one'}
    {url: 'http://test.com', name: 'two'}
    {url: 'http://test.com', name: 'three'}
  ]
])
