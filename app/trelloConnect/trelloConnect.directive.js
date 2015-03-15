angular.module('jashboard').directive('trelloConnect', function() {
  return {
    restrict: 'E',
    controller: 'TrelloConnectCtrl',
    templateUrl: '/app/trelloConnect/trelloConnect.html'
  }
});
