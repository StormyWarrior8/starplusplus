define ["ko", "firebase", "firebaseSimpleLogin"], (ko, firebase, firebaseSimpleLogin) ->
    return class UserViewModal
        constructor: ->
            # Setup the ViewModal
            @username = ko.observable ""
            @loggedIn = ko.observable false

            # Setup auth
            rootRef = new firebase "https://starplusplus.firebaseio.com/"
            auth = new firebaseSimpleLogin rootRef, (error, user) =>
                if error
                    # an error occurred while attempting login
                    console.log error
                else if user
                    # user authenticated with Firebase
                    @loggedIn true
                    @username user.username
                else
                    # user is logged out
                    @loggedIn false
                    @username ""

            # Actions
            @login = =>
                auth.login "github", scope: "user"

            @logout = =>
                auth.logout()

            

