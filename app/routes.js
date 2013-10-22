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
