$(document).ready(function() {
    function AppViewModel() {
        this.firstName = ko.observable("Gio");
        this.lastName = ko.observable("d'Amelio");

        this.fullName = ko.computed(function() {
            return this.firstName() + " " + this.lastName();    
        }, this);
    }

    ko.applyBindings(new AppViewModel());
});