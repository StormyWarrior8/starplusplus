;(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);throw new Error("Cannot find module '"+o+"'")}var f=n[o]={exports:{}};t[o][0].call(f.exports,function(e){var n=t[o][1][e];return s(n?n:e)},f,f.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
module.exports = function($scope) {
  return $scope.message = "HomeController";
};

},{}],2:[function(require,module,exports){
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

},{}],3:[function(require,module,exports){
module.exports = function($scope, github) {
  return $scope.$on("angularFireAuth:login", function(evt, user) {
    github.setAccessToken(user.accessToken);
    return github.getStars().then(function(data) {
      return $scope.stars = data;
    });
  });
};

},{}],4:[function(require,module,exports){
var StarPlusPlus;

StarPlusPlus = angular.module("StarPlusPlus", ["firebase"]);

StarPlusPlus.config(require("./routes"));

StarPlusPlus.factory("github", require("./services/github"));

StarPlusPlus.controller("MainController", require("./controllers/main"));

StarPlusPlus.controller("HomeController", require("./controllers/home"));

StarPlusPlus.controller("StarsController", require("./controllers/stars"));

},{"./controllers/home":1,"./controllers/main":2,"./controllers/stars":3,"./routes":5,"./services/github":6}],5:[function(require,module,exports){
module.exports = function($routeProvider) {
  return $routeProvider.when("/", {
    templateUrl: "views/home.html",
    controller: "HomeController"
  }).when("/stars", {
    templateUrl: "views/stars.html",
    controller: "StarsController"
  }).otherwise({
    redirectTo: "/"
  });
};

},{}],6:[function(require,module,exports){
module.exports = function($http, $q) {
  var baseHost, githubAccessToken;
  baseHost = "https://api.github.com";
  githubAccessToken = void 0;
  return {
    setAccessToken: function(accessToken) {
      return githubAccessToken = accessToken;
    },
    getStars: function() {
      var deferred, promise;
      deferred = $q.defer();
      promise = $http({
        method: "GET",
        url: baseHost + "/user/starred",
        params: {
          access_token: githubAccessToken
        }
      });
      promise.success(function(data, status, headers, config) {
        var link;
        if (link) {
          link = headers("Link").split(",");
          link = link[link.length - 1].split(">;")[0].split("=");
          link = link[link.length - 1];
          console.log(link);
        }
        return deferred.resolve(data);
      });
      promise.error(function(data, status, headers, config) {
        return deferred.reject(data);
      });
      return deferred.promise;
    }
  };
};

},{}]},{},[4])
//@ sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZ2VuZXJhdGVkLmpzIiwic291cmNlcyI6WyIvaG9tZS9naW9kYW1lbGlvL1Byb2plY3RzL3JlYWwvc3RhcnBsdXNwbHVzL291dC9hcHAvY29udHJvbGxlcnMvaG9tZS5qcyIsIi9ob21lL2dpb2RhbWVsaW8vUHJvamVjdHMvcmVhbC9zdGFycGx1c3BsdXMvb3V0L2FwcC9jb250cm9sbGVycy9tYWluLmpzIiwiL2hvbWUvZ2lvZGFtZWxpby9Qcm9qZWN0cy9yZWFsL3N0YXJwbHVzcGx1cy9vdXQvYXBwL2NvbnRyb2xsZXJzL3N0YXJzLmpzIiwiL2hvbWUvZ2lvZGFtZWxpby9Qcm9qZWN0cy9yZWFsL3N0YXJwbHVzcGx1cy9vdXQvYXBwL21haW4uanMiLCIvaG9tZS9naW9kYW1lbGlvL1Byb2plY3RzL3JlYWwvc3RhcnBsdXNwbHVzL291dC9hcHAvcm91dGVzLmpzIiwiL2hvbWUvZ2lvZGFtZWxpby9Qcm9qZWN0cy9yZWFsL3N0YXJwbHVzcGx1cy9vdXQvYXBwL3NlcnZpY2VzL2dpdGh1Yi5qcyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiO0FBQUE7QUFDQTtBQUNBO0FBQ0E7O0FDSEE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTs7QUNuQkE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQ1JBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7O0FDYkE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBOztBQ1hBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSIsInNvdXJjZXNDb250ZW50IjpbIm1vZHVsZS5leHBvcnRzID0gZnVuY3Rpb24oJHNjb3BlKSB7XG4gIHJldHVybiAkc2NvcGUubWVzc2FnZSA9IFwiSG9tZUNvbnRyb2xsZXJcIjtcbn07XG4iLCJtb2R1bGUuZXhwb3J0cyA9IGZ1bmN0aW9uKCRzY29wZSwgJGxvY2F0aW9uLCBhbmd1bGFyRmlyZUF1dGgpIHtcbiAgdmFyIHJlZjtcbiAgcmVmID0gbmV3IEZpcmViYXNlKFwiaHR0cHM6Ly9zdGFycGx1c3BsdXMtZGV2LmZpcmViYXNlaW8uY29tXCIpO1xuICBhbmd1bGFyRmlyZUF1dGguaW5pdGlhbGl6ZShyZWYsIHtcbiAgICBzY29wZTogJHNjb3BlLFxuICAgIG5hbWU6IFwidXNlclwiXG4gIH0pO1xuICAkc2NvcGUubG9naW4gPSBmdW5jdGlvbigpIHtcbiAgICBjb25zb2xlLmxvZyhcIkxvZ2dpbmcgaW4gd2l0aCBnaXRodWIuLi5cIik7XG4gICAgYW5ndWxhckZpcmVBdXRoLmxvZ2luKFwiZ2l0aHViXCIsIHtcbiAgICAgIHNjb3BlOiBcInVzZXJcIlxuICAgIH0pO1xuICAgIHJldHVybiAkbG9jYXRpb24ucGF0aChcIi9zdGFyc1wiKTtcbiAgfTtcbiAgcmV0dXJuICRzY29wZS5sb2dvdXQgPSBmdW5jdGlvbigpIHtcbiAgICBjb25zb2xlLmxvZyhcIkxvZ2dpbmcgb3V0Li4uXCIpO1xuICAgIHJldHVybiBhbmd1bGFyRmlyZUF1dGgubG9nb3V0KCk7XG4gIH07XG59O1xuIiwibW9kdWxlLmV4cG9ydHMgPSBmdW5jdGlvbigkc2NvcGUsIGdpdGh1Yikge1xuICByZXR1cm4gJHNjb3BlLiRvbihcImFuZ3VsYXJGaXJlQXV0aDpsb2dpblwiLCBmdW5jdGlvbihldnQsIHVzZXIpIHtcbiAgICBnaXRodWIuc2V0QWNjZXNzVG9rZW4odXNlci5hY2Nlc3NUb2tlbik7XG4gICAgcmV0dXJuIGdpdGh1Yi5nZXRTdGFycygpLnRoZW4oZnVuY3Rpb24oZGF0YSkge1xuICAgICAgcmV0dXJuICRzY29wZS5zdGFycyA9IGRhdGE7XG4gICAgfSk7XG4gIH0pO1xufTtcbiIsInZhciBTdGFyUGx1c1BsdXM7XG5cblN0YXJQbHVzUGx1cyA9IGFuZ3VsYXIubW9kdWxlKFwiU3RhclBsdXNQbHVzXCIsIFtcImZpcmViYXNlXCJdKTtcblxuU3RhclBsdXNQbHVzLmNvbmZpZyhyZXF1aXJlKFwiLi9yb3V0ZXNcIikpO1xuXG5TdGFyUGx1c1BsdXMuZmFjdG9yeShcImdpdGh1YlwiLCByZXF1aXJlKFwiLi9zZXJ2aWNlcy9naXRodWJcIikpO1xuXG5TdGFyUGx1c1BsdXMuY29udHJvbGxlcihcIk1haW5Db250cm9sbGVyXCIsIHJlcXVpcmUoXCIuL2NvbnRyb2xsZXJzL21haW5cIikpO1xuXG5TdGFyUGx1c1BsdXMuY29udHJvbGxlcihcIkhvbWVDb250cm9sbGVyXCIsIHJlcXVpcmUoXCIuL2NvbnRyb2xsZXJzL2hvbWVcIikpO1xuXG5TdGFyUGx1c1BsdXMuY29udHJvbGxlcihcIlN0YXJzQ29udHJvbGxlclwiLCByZXF1aXJlKFwiLi9jb250cm9sbGVycy9zdGFyc1wiKSk7XG4iLCJtb2R1bGUuZXhwb3J0cyA9IGZ1bmN0aW9uKCRyb3V0ZVByb3ZpZGVyKSB7XG4gIHJldHVybiAkcm91dGVQcm92aWRlci53aGVuKFwiL1wiLCB7XG4gICAgdGVtcGxhdGVVcmw6IFwidmlld3MvaG9tZS5odG1sXCIsXG4gICAgY29udHJvbGxlcjogXCJIb21lQ29udHJvbGxlclwiXG4gIH0pLndoZW4oXCIvc3RhcnNcIiwge1xuICAgIHRlbXBsYXRlVXJsOiBcInZpZXdzL3N0YXJzLmh0bWxcIixcbiAgICBjb250cm9sbGVyOiBcIlN0YXJzQ29udHJvbGxlclwiXG4gIH0pLm90aGVyd2lzZSh7XG4gICAgcmVkaXJlY3RUbzogXCIvXCJcbiAgfSk7XG59O1xuIiwibW9kdWxlLmV4cG9ydHMgPSBmdW5jdGlvbigkaHR0cCwgJHEpIHtcbiAgdmFyIGJhc2VIb3N0LCBnaXRodWJBY2Nlc3NUb2tlbjtcbiAgYmFzZUhvc3QgPSBcImh0dHBzOi8vYXBpLmdpdGh1Yi5jb21cIjtcbiAgZ2l0aHViQWNjZXNzVG9rZW4gPSB2b2lkIDA7XG4gIHJldHVybiB7XG4gICAgc2V0QWNjZXNzVG9rZW46IGZ1bmN0aW9uKGFjY2Vzc1Rva2VuKSB7XG4gICAgICByZXR1cm4gZ2l0aHViQWNjZXNzVG9rZW4gPSBhY2Nlc3NUb2tlbjtcbiAgICB9LFxuICAgIGdldFN0YXJzOiBmdW5jdGlvbigpIHtcbiAgICAgIHZhciBkZWZlcnJlZCwgcHJvbWlzZTtcbiAgICAgIGRlZmVycmVkID0gJHEuZGVmZXIoKTtcbiAgICAgIHByb21pc2UgPSAkaHR0cCh7XG4gICAgICAgIG1ldGhvZDogXCJHRVRcIixcbiAgICAgICAgdXJsOiBiYXNlSG9zdCArIFwiL3VzZXIvc3RhcnJlZFwiLFxuICAgICAgICBwYXJhbXM6IHtcbiAgICAgICAgICBhY2Nlc3NfdG9rZW46IGdpdGh1YkFjY2Vzc1Rva2VuXG4gICAgICAgIH1cbiAgICAgIH0pO1xuICAgICAgcHJvbWlzZS5zdWNjZXNzKGZ1bmN0aW9uKGRhdGEsIHN0YXR1cywgaGVhZGVycywgY29uZmlnKSB7XG4gICAgICAgIHZhciBsaW5rO1xuICAgICAgICBpZiAobGluaykge1xuICAgICAgICAgIGxpbmsgPSBoZWFkZXJzKFwiTGlua1wiKS5zcGxpdChcIixcIik7XG4gICAgICAgICAgbGluayA9IGxpbmtbbGluay5sZW5ndGggLSAxXS5zcGxpdChcIj47XCIpWzBdLnNwbGl0KFwiPVwiKTtcbiAgICAgICAgICBsaW5rID0gbGlua1tsaW5rLmxlbmd0aCAtIDFdO1xuICAgICAgICAgIGNvbnNvbGUubG9nKGxpbmspO1xuICAgICAgICB9XG4gICAgICAgIHJldHVybiBkZWZlcnJlZC5yZXNvbHZlKGRhdGEpO1xuICAgICAgfSk7XG4gICAgICBwcm9taXNlLmVycm9yKGZ1bmN0aW9uKGRhdGEsIHN0YXR1cywgaGVhZGVycywgY29uZmlnKSB7XG4gICAgICAgIHJldHVybiBkZWZlcnJlZC5yZWplY3QoZGF0YSk7XG4gICAgICB9KTtcbiAgICAgIHJldHVybiBkZWZlcnJlZC5wcm9taXNlO1xuICAgIH1cbiAgfTtcbn07XG4iXX0=
;