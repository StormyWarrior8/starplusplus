define ["jquery", "ko", "firebase", "firebaseSimpleLogin", "utils/getStars", "GridViewModal"], 
    ($, ko, firebase, firebaseSimpleLogin, getStars, GridViewModal) ->
        return class UserViewModal
            constructor: ->
                # Setup the ViewModal
                @username = ko.observable ""
                @loggedIn = ko.observable false
                @stars = new GridViewModal()

                @afterLogout = =>
                    @loggedIn false
                    @username ""

                # Setup auth
                rootRef = new firebase "https://starplusplus.firebaseio.com/"
                auth = new firebaseSimpleLogin rootRef, (error, user) =>
                    if error
                        # an error occurred while attempting login
                        console.log error
                    else if user
                        # user authenticated with github(through firebase)
                        @afterLogin(user)
                    else
                        # user is logged out
                        @afterLogout()

                # Actions
                @login = =>
                    auth.login "github", scope: "user"

                @afterLogin = (user) =>
                    @loggedIn true
                    @username user.username
                    getStars user.accessToken, (stars) =>
                        for star in stars
                            @stars.items.push new ko.observable(star)

                @logout = =>
                    auth.logout()
