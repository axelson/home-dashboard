angular.module('jashboard').controller('QuotesCtrl', ['$scope', '$interval', '$mdDialog', 'trello', ($scope, $interval, $mdDialog, trello) ->
  $scope.quote = null
  $scope.quotes = []

  beginCycleQuotes = ->
    $interval(switchQuote , 60 * 1000)

  switchQuote = -> $scope.quote = _.sample($scope.quotes)

  trello.getBoard('Meta').done( (metaBoard) ->
    trello.getList(metaBoard.id, 'Sayings').done( (sayingsList) ->
      trello.getListCards(sayingsList.id).done (cards) ->
        $scope.quotes = cards
        $scope.$apply -> switchQuote()
        beginCycleQuotes()
    )
  )
])
