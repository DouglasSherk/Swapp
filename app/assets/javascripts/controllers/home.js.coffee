App.controller 'HomeCtrl', ['$scope', '$location', 'Settings', \
                            ($scope, $location, Settings) ->
  if Settings.locationSaved
    $location.path('/pickups')

  $scope.submit = ->
    #Settings.locationSaved = true
    #Settings.save()
    $location.path('/pickups')

  $scope.locate = ->
    arrow = $('#location .fa-location-arrow')
    arrow.toggleClass('fa-location-arrow fa-spin fa-spinner')
    setTimeout($scope.submit, 2000)
]
