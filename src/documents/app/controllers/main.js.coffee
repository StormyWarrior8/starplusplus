module.exports = ($scope, $location, angularFireAuth) ->
    ref = new Firebase "https://starplusplus-dev.firebaseio.com"
    angularFireAuth.initialize(ref, {scope: $scope, name: "user"});

    $scope.login = ->
        console.log "Logging in with github..."
        angularFireAuth.login "github", scope: "user"
        $location.path "/stars"

    $scope.logout = ->
        console.log "Logging out..."
        angularFireAuth.logout()
