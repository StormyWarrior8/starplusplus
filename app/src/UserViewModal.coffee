define ["jquery", "ko", "firebase", "firebaseSimpleLogin", "utils/getStars"], 
    ($, ko, firebase, firebaseSimpleLogin, getStars) ->
        return class UserViewModal
            constructor: ->
                # Setup the ViewModal
                @username = ko.observable ""
                @loggedIn = ko.observable false
                @stars = ko.observableArray()

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
                            @stars.push new ko.observable(star)

                @logout = =>
                    auth.logout()
