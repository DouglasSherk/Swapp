App.controller 'CollectionsCtrl', ['$scope', '$location', '$timeout', '$routeParams', \
                            ($scope, $location, $timeout, $routeParams) ->
  $scope.collectionType = $routeParams.id
]
