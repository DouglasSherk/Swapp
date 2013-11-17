App.controller 'HomeCtrl', ['$scope', 'Settings', \
                            ($scope, Settings) ->
  $scope.test = Settings.test
]
