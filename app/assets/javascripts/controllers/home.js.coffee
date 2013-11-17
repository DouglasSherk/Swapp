App.controller 'HomeCtrl', ['$scope', '$location', '$timeout', '$rootScope', 'Settings', \
                            ($scope, $location, $timeout, $rootScope, Settings) ->
  if Settings.locationSaved
    $location.path('/pickups')

  $scope.finish = ->
    $location.path('/pickups')

  Settings.hideAlert = false
  Settings.save()

  $scope.submit = ->
    #Settings.locationSaved = true
    #Settings.save()
    $rootScope.submitted = true
    pos = new google.maps.LatLng(43.3679493, -80.9818108)
    if !$scope.googlemap
      mapOptions = {
        zoom: 17,
        center: pos,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      $scope.googlemap = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
      marker = new google.maps.Marker({
        position: pos,
        map: $scope.googlemap,
        title: 'Your Location'
      });
    else
      $scope.googlemap.setCenter(pos)

  $scope.locate = ->
    arrow = $('#location .fa-location-arrow')
    arrow.toggleClass('fa-location-arrow fa-spin fa-spinner')
    navigator.geolocation.getCurrentPosition (position) =>
      $scope.submit()
      arrow.toggleClass('fa-location-arrow fa-spin fa-spinner')
      $scope.$apply()
]
