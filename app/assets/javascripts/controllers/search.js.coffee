App.controller 'SearchCtrl', ['$scope', 'WasteItems', ($scope, WasteItems) ->
  $scope.itemsByCategory = {}
  for item in WasteItems
    ($scope.itemsByCategory[item.category] ||= []).push item.name
]
