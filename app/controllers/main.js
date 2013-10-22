module.exports = function($scope, $location, angularFireAuth) {
  var ref;
  ref = new Firebase("https://starplusplus-dev.firebaseio.com");
  angularFireAuth.initialize(ref, {
    scope: $scope,
    name: "user"
  });
  $scope.login = function() {
    console.log("Logging in with github...");
    angularFireAuth.login("github", {
      scope: "user"
    });
    return $location.path("/stars");
  };
  return $scope.logout = function() {
    console.log("Logging out...");
    return angularFireAuth.logout();
  };
};
