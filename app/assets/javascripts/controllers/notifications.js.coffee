App.controller 'NotificationsCtrl', ['$scope', '$rootScope', 'Settings', ($scope, $rootScope, Settings) ->
  $scope.notifications = (Settings.notifications ||= [])

  $scope.markRead = ->
    for note in $scope.notifications
      note.read = true
    Settings.save()

  $scope.notify = ->
    alert('Thanks for your message! You should expect a reply shortly.')
    setTimeout ->
      $scope.notifications.splice(0, 0, {time: Date.now(), message: 'Hey, Sorry for your trouble. We\'ll send someone to pick up your garbage as soon as we can. - management'})
      Settings.save()
      $scope.$apply()
    , 2000

  $scope.$on '$destroy', ->
    if $rootScope.title == 'City Alerts'
      $scope.markRead()
      Settings.save()

  $scope.clear = ->
    angular.copy([], $scope.notifications)
    Settings.save()
]
