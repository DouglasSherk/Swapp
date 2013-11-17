App.controller 'HomeCtrl', ['$scope', '$location', '$timeout', 'Settings', \
                            ($scope, $location, $timeout, Settings) ->
  if Settings.locationSaved
    $location.path('/pickups')

  $scope.finish = ->
    $location.path('/pickups')

  $scope.submit = ->
    #Settings.locationSaved = true
    #Settings.save()
    $scope.submitted = true
    $('#map-canvas').html('')
    pos = new google.maps.LatLng(43.3679493, -80.9818108)
    mapOptions = {
      zoom: 17,
      center: pos,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    marker = new google.maps.Marker({
      position: pos,
      map: map,
      title: 'Your Location'
    });

  $scope.locate = ->
    arrow = $('#location .fa-location-arrow')
    arrow.toggleClass('fa-location-arrow fa-spin fa-spinner')
    navigator.geolocation.getCurrentPosition (position) =>
      $scope.submit()
      arrow.toggleClass('fa-location-arrow fa-spin fa-spinner')
      $scope.$digest()
]
