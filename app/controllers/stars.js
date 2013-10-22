module.exports = function($scope, github) {
  return $scope.$on("angularFireAuth:login", function(evt, user) {
    github.setAccessToken(user.accessToken);
    return github.getStars().then(function(data) {
      return $scope.stars = data;
    });
  });
};
