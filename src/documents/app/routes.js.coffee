module.exports = ($routeProvider) ->
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
