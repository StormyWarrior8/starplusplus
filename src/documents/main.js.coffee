StarPlusPlus = angular.module "StarPlusPlus", []

StarPlusPlus.config ($routeProvider) ->
    $routeProvider
        .when "/",
            templateUrl: "views/home.html"
            controller: "HomeController"
        .when "/login",
            templateUrl: "views/login.html"
            controller: "LoginController"
        .when "/create",
            templateUrl: "views/create.html"
            controller: "CreateController"
        .otherwise
            redirectTo: "/"

StarPlusPlus.controller "HomeController", ($scope) ->
    $scope.message = "Hello World!"

StarPlusPlus.controller "LoginController", ($scope) ->
    $scope.message = "Hello World!"

StarPlusPlus.controller "CreateController", ($scope) ->
    $scope.message = "Hello World!"
