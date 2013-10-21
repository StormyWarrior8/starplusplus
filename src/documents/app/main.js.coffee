# Init the module
StarPlusPlus = angular.module "StarPlusPlus", []

# Setup the routes
StarPlusPlus.config require("./routes")

# Setup the services
StarPlusPlus.factory "kinvey", require("./services/kinvey")
StarPlusPlus.factory "github", require("./services/github")

# Setup the directives
StarPlusPlus.directive "passwordMatch", require("./directives/passwordMatch")
StarPlusPlus.directive "checkUserExists", require("./directives/checkUserExists")

# Setup the controllers
StarPlusPlus.controller "MainController", require("./controllers/main")
StarPlusPlus.controller "HomeController", require("./controllers/home")
StarPlusPlus.controller "LoginController", require("./controllers/login")
StarPlusPlus.controller "CreateController", require("./controllers/create")
StarPlusPlus.controller "GithubAuthController", require("./controllers/githubauth")
StarPlusPlus.controller "StarsController", require("./controllers/stars")
