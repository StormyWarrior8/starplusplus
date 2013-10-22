module.exports = ($routeProvider) ->
    $routeProvider
        .when "/",
            templateUrl: "views/home.html"
            controller: "HomeController"
        .when "/stars",
            templateUrl: "views/stars.html"
            controller: "StarsController"
        .otherwise
            redirectTo: "/"
