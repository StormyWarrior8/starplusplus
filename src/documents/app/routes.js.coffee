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
        .when "/githubauth",
            templateUrl: "views/githubauth.html"
            controller: "GithubAuthController"
        .when "/githubredirect",
            templateUrl: "views/githubredirect.html"
            controller: "GithubAuthController"
        .when "/stars",
            templateUrl: "views/stars.html"
            controller: "StarsController"
        .otherwise
            redirectTo: "/"
