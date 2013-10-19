# Get the kinvey credentials
kinveyCreds = require "../config/kinveyCreds.json"

# Init the module
StarPlusPlus = angular.module "StarPlusPlus", []

# Get the routes
StarPlusPlus.config require("./routes")

# Get the controllers
StarPlusPlus.controller "MainController", require("./controllers/main")
StarPlusPlus.controller "HomeController", require("./controllers/home")
StarPlusPlus.controller "LoginController", require("./controllers/login")
StarPlusPlus.controller "CreateController", require("./controllers/create")
