logout = ->
    Kinvey.User.logout
        success: ->
            window.location.href = "/";

$ ->
    promise = Kinvey.init
        appKey: "kid_VT2OL9LIJi",
        appSecret: "3a612284be4a4a2eae5ffcf911c29395"

    # This runs after after we get the connection to kinvey
    promise.then (activeUser) ->
        # Show the logout button
        if activeUser
            $("#logout").show()
            $("#logout").click ->
                logout()

        # Display the active user
        user = Kinvey.getActiveUser();
        $("#username").text user.username
    ,
        (error) ->
            console.log "Error", error