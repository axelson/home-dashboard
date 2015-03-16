angular.module('jashboard').controller('CardsCtrl', ['$scope', '$mdDialog', 'trello', ($scope, $mdDialog, trello) ->
  $scope.cards = []

  trello.getIncomingList().done (incomingList) ->
    trello.getListCards(incomingList.id).done (cards) ->
      $scope.$apply ->
        $scope.cards = cards

  $scope.show = ($event, card) ->
    $mdDialog.show
      parent: angular.element(document.body)
      targetEvent: $event
      templateUrl: '/app/cards/showCard.html'
      locals:
        card: card
      controller: (scope, $mdDialog, card) ->
        scope.card = card
])
