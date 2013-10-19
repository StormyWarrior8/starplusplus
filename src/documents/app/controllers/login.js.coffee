module.exports = ($scope, $location, kinvey) ->
    $scope.login = ->
        kinvey.login($scope.user.username, $scope.user.password)
        $location.path "/stars"