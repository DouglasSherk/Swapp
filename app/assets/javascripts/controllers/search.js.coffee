App.controller 'SearchCtrl', ['$scope', 'WasteItems', ($scope, WasteItems) ->
  $scope.categories = [
    {name: 'Garbage', id: 'garbage'}
    {name: 'Recyclable', id: 'recycle'}
    {name: 'Hazardous Waste', id: 'hazard'}
    {name: 'Yard Waste', id: 'yard'}
    {name: 'Drop-off', id: 'dropoff'}
  ]

  $scope.icon = {
    'Garbage': 'fa-trash-o',
    'Recyclable': 'fa-refresh',
    'Hazardous Waste': 'fa-exclamation',
    'Yard Waste': 'fa-leaf',
    'Drop-off': 'fa-truck',
  }

  $scope.items = WasteItems

  $scope.matchQuery = (elem) ->
    if elem && $scope.query
      elem.name.toLowerCase().indexOf($scope.query.toLowerCase()) != -1

  $scope.toggle = (id) ->
    div = $(".waste-category.#{id}")
    caret = div.find('.glyphicon')
    caret.toggleClass('glyphicon-chevron-right glyphicon-chevron-down')
    $(".waste-category-list.#{id}").toggleClass('hide')
    return null

  $scope.itemsByCategory = {}
  for item in WasteItems
    ($scope.itemsByCategory[item.category] ||= []).push item.name
]
