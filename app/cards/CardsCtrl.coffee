angular.module('jashboard').controller('CardsCtrl', ['$scope', 'trello', ($scope, trello) ->
  $scope.cards = []

  trello.getIncomingList().done (incomingList) ->
    trello.getListCards(incomingList.id).done (cards) ->
      $scope.$apply ->
        $scope.cards = cards
])
