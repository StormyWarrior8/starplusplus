define ["ko"], (ko) ->
    return class GridViewModal
        constructor: () ->
            @items = ko.observableArray()
