# Init the module
StarPlusPlus = angular.module "StarPlusPlus", ["firebase"]
# Setup the routes
StarPlusPlus.config require("./routes")

# Setup the services
StarPlusPlus.factory "github", require("./services/github")

# Setup the directives
#StarPlusPlus.directive "directiveName", require("./directives/directiveName")

# Setup the controllers
StarPlusPlus.controller "MainController", require("./controllers/main")
StarPlusPlus.controller "HomeController", require("./controllers/home")
StarPlusPlus.controller "StarsController", require("./controllers/stars")
