App.controller 'NotificationsCtrl', ['$scope', 'Settings', ($scope, Settings) ->
  $scope.notifications = (Settings.notifications ||= [])

  $scope.unread = 0
  for note in $scope.notifications
    if !note.read
      $scope.unread += 1

  $scope.markRead = ->
    for note in $scope.notifications
      note.read = true
    $scope.unread = 0
    Settings.save()

  $scope.notify = ->
    $scope.notifications.splice(0, 0, {time: Date.now(), message: 'Hey, Sorry for your trouble. We\'ll send someone to pick up your garbage as soon as we can. - management'})
    Settings.save()
    alert('Thanks for your message! You should expect a reply shortly.')

  $scope.clear = ->
    angular.copy([], $scope.notifications)
    Settings.save()
]
