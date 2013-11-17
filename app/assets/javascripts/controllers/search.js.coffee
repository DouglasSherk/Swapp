App.controller 'SearchCtrl', ['$scope', '$location', 'WasteItems', ($scope, $location, WasteItems) ->
  $scope.expand = $location.search().expand

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

  $scope.matchQuality = (elem) ->
    name = elem.name.toLowerCase()
    query = $scope.query.toLowerCase()
    i = name.indexOf(query)
    left = i - 1
    while left >= 0 && name[left] != ' '
      left -= 1
    right = i + query.length
    while right < name.length && name[right] != ' '
      right += 1
    (i - left) * (right - i - query.length + 1)

  $scope.toggleCategory = (id) ->
    div = $(".waste-category.#{id}")
    caret = div.find('.glyphicon')
    caret.toggleClass('glyphicon-chevron-right glyphicon-chevron-down')
    $(".waste-category-list.#{id}").toggleClass('hide')
    return null

  $scope.toggleItem = (id) ->
    div = $("[data-toggle=\"#{id}\"")
    div.parent().find('[class*=fa-chevron]').toggleClass('fa-chevron-right fa-chevron-down')
    div.toggleClass('hide')
    return null

  $scope.itemsByCategory = {}
  for item in WasteItems
    ($scope.itemsByCategory[item.category] ||= []).push item.name
]
