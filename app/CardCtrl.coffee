angular.module('jashboard').controller('CardCtrl', ['$scope', ($scope) ->
  $scope.cards = [
    {url: 'http://test.com', name: 'one'}
    {url: 'http://test.com', name: 'two'}
    {url: 'http://test.com', name: 'three'}
  ]
])
