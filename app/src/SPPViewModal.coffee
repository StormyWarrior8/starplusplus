define ["ko"], (ko) ->
    return class SPPViewModal
        constructor: ->
            @loggedIn = ko.observable false
            @login = ->
                @loggedIn true
                console.log "Logged in"
            @logout = ->
                @loggedIn false
                console.log "Logged out"