module.exports = ($scope, github) ->
    # Wait until the user is logged in
    $scope.$on "angularFireAuth:login", (evt, user) ->
        # Send the access token to out service
        github.setAccessToken user.accessToken

        # Get the stars
        github.getStars()
            .then (data) ->
                console.log data