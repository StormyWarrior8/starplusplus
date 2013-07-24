$(document).ready(function() {
    function AppViewModel() {
        var self = this;
        self.loggedIn = ko.observable(false);
        self.userData = ko.observable({});
        $.getJSON("/user", function(data) {
            console.log(data);
            if (data.provider == "github") {
                self.loggedIn(true);
                self.userData(data);
            } else {
                self.loggedIn(false);
                self.userData({});
            }
        });
    }
    ko.applyBindings(new AppViewModel());
});