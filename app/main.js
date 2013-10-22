var StarPlusPlus;

StarPlusPlus = angular.module("StarPlusPlus", ["firebase"]);

StarPlusPlus.config(require("./routes"));

StarPlusPlus.factory("github", require("./services/github"));

StarPlusPlus.controller("MainController", require("./controllers/main"));

StarPlusPlus.controller("HomeController", require("./controllers/home"));

StarPlusPlus.controller("StarsController", require("./controllers/stars"));
