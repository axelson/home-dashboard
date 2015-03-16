angular.module('jashboard').directive('quotes', function() {
  return {
    restrict: 'E',
    controller: 'QuotesCtrl',
    templateUrl: '/app/quotes/quotes.html'
  }
});
