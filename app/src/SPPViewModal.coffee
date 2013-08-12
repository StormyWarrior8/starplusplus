define ["ko"], (ko) ->
    return class SPPViewModal
        constructor: ->
            @firstname = ko.observable "Gio"
            @lastname = ko.observable "d'Amelio"
            @fullname = ko.computed =>
                return @firstname() + " " + @lastname()