angular.module('psycho').controller 'NewQuizCtrl', ($scope, $http, blockUI, ShowError)->

  userId = null
  $scope.setUserId = (newUserId)->
    userId = newUserId
  $scope.showTest = false
  $scope.showStart = true
  $scope.showSubmit = false
  $scope.showSuccess = false

  $scope.startTest = ->
    $scope.showTest = true
    $scope.showSubmit = true
    $scope.showStart = false

  $scope.submitResult = ->
    blockUI.start()
    $http.post('/quiz_results', {
      personality_type: $scope.personality_type,
      user_id: userId,
    }).then ->
      blockUI.stop()
      $scope.showTest = false
      $scope.showSubmit = false
      $scope.showSuccess = true
      $scope.showStart = false
    , ShowError