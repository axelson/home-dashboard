angular.module('jashboard').directive('cards', function() {
  return {
    restrict: 'E',
    controller: 'CardsCtrl',
    templateUrl: '/app/cards/cards.html'
  }
});
