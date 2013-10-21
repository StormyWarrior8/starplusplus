module.exports = ($scope, $location, $window, kinvey) ->
    # Bootstrap for faster testing
    $scope.user = {}
    $scope.user.username = "giodamelio"
    $scope.user.email = "giodamelio@gmail.com"
    $scope.user.password = "gggggg"
    $scope.user.confirmPassword = "gggggg"

    $scope.create = ->
        kinvey.signup($scope.user.username, $scope.user.email, $scope.user.password)
            .then (data) ->
                $location.path "/githubauth"
            , (data) ->
                console.log data
