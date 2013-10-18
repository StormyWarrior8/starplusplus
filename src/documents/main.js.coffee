StarPlusPlus = angular.module "StarPlusPlus", []

StarPlusPlus.config ($routeProvider) ->
    $routeProvider
        .when "/:name",
            templateUrl: "views/home.html"
            controller: "HomeController"
        .otherwise
            redirectTo: "/"

StarPlusPlus.controller "HomeController", ($scope) ->
    console.log $scope
    $scope.message = "Hello World!"
