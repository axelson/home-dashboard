angular.module('jashboard').controller('TrelloConnectCtrl', ['$scope', ($scope) ->
  $scope.authorized = false

  $scope.connect = ->
    Trello.authorize
      type: "popup"
      success: onAuthorize

  onAuthorize = ->
    $scope.authorized = true

  # Try to authorize automatically
  Trello.authorize
    interactive: false
    success: onAuthorize
])
