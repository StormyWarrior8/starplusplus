githubCreds = kinveyCreds = require "../../config/githubCreds.json"

module.exports = ($scope, $location, $routeParams, $window, kinvey, github) ->
    # Check if the code is in the cookie, if it is redirect right away
    if cookie.get "githubAccessToken"
        $location.path "/stars"

    # Check if code is in the url, if it does redirect
    # Work around, github api is sending its redirects in a strange way
    # Would normally be
    #   code = $routeParams.code
    url = $location.absUrl()
    url = url.split("#")[0]
    if url.split("?").length == 2
        code = url.split("?")[1].split("=")[1]
        # Send the temp code to the kinvey custom endpoint and recieve 
        kinvey.customEndpoint("githubCallback", code: code)
            .then (data) ->
                github.setAccessToken data.data.access_token
                kinvey.update("githubAccessToken": data.data.access_token)
                    .then (data) ->
                        $location.path "/stars"

    $scope.redirect = ->
        $window.location = "https://github.com/login/oauth/authorize?client_id=1d21cb5c8bbfe551cc30&scope=user"
