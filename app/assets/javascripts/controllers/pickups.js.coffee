App.controller 'PickupsCtrl', ['$scope', 'Settings', ($scope, Settings) ->
  $scope.active = (id) ->
    !Settings.hide?[id]

  $scope.toggle = (id) ->
    console.log id
    pref = (Settings.hide ||= {})
    pref[id] = !pref[id]
    Settings.save()
]
