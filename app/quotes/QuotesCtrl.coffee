angular.module('jashboard').controller('QuotesCtrl', ['$scope', '$interval', '$mdDialog', 'trello', ($scope, $interval, $mdDialog, trello) ->
  # MVP will be a quote that changes every 10 seconds, simply looping through the list of quotes
  $scope.quote = null
  $scope.quotes = []

  cycleQuotes = ->
    $interval(switchQuote , 10 * 1000)

  switchQuote = -> $scope.quote = _.sample($scope.quotes)

  todoBoard = trello.getBoard('Meta').done( (metaBoard) ->
    trello.getList(metaBoard.id, 'Sayings').done( (sayingsList) ->
      trello.getListCards(sayingsList.id).done (cards) ->
        $scope.quotes = cards
        $scope.$apply -> switchQuote()
        cycleQuotes()
    )
  )
])
