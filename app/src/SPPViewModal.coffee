define ["ko", "UserViewModal"], (ko, UserViewModal) ->
    return class SPPViewModal
        constructor: ->
            @user = ko.observable new UserViewModal()
            