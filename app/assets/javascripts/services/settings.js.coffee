App.factory 'Settings', [->
  obj = angular.fromJson(localStorage.getItem('swapp')) || {}
  obj.save = -> localStorage.setItem('swapp', angular.toJson(obj))
  return obj
]
