define ["ko", "UserViewModal"], (ko, UserViewModal, GridViewModal) ->
    return class SPPViewModal
        constructor: ->
            @user = ko.observable new UserViewModal()
            