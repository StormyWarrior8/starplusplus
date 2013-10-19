module.exports = ($scope, $location, kinvey) ->
    $scope.delete = ->
        kinvey.delete()
        $location.path "/"

    $scope.logout = ->
        kinvey.logout()
        $location.path "/"
