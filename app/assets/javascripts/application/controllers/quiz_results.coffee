angular.module('psycho').controller 'QuizResultsCtrl', ($scope, $http, blockUI, ShowError, SweetAlert)->

  $scope.users = []

  $scope.setUsers = (newUsers)->
    $scope.users = newUsers

  $scope.requestResult = (user)->
    blockUI.start()
    $http.post('/quiz_requests', {
      user_id: user.id,
    }).then ({ data: { user: newUser }})->
      SweetAlert(
        title: "Запрос Отправлен",
        html: "<a href='http://localhost:3000/quiz_results/new?id=#{user.id}' target='_blank'><strong>Ссылка</strong></a> для прохождения теста"
        type: "success"
      )
      _.assign user, newUser
      blockUI.stop()
    , ShowError