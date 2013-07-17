Template.main.helpers
    user: ->
        return Meteor.user().services.github.username
    stars: ->
        Meteor.http.get "https://api.github.com/user/starred", 
            { headers: { "Authorization": "token " + Meteor.user().services.github.accessToken }},
            (err, result) ->
                Session.set "stars", result.data
        return Session.get "stars"

Meteor.startup ->
    Accounts.ui.config 
        requestPermissions:
            github: ["user"]
