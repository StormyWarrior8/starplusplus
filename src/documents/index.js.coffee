createAccount = ->
    promise = Kinvey.User.signup
        email: $("#createEmail").val()
        username: $("#createUsername").val()
        password: $("#createPassword").val()
    ,
        success: (response) ->
            window.location.href = "/stars.html";

login = ->
    promise = Kinvey.User.login
        username: $("#loginUsername").val()
        password: $("#loginPassword").val()
    ,
        success: (response) ->
            window.location.href = "/stars.html";

$ ->
    promise = Kinvey.init
        appKey: "kid_VT2OL9LIJi",
        appSecret: "3a612284be4a4a2eae5ffcf911c29395"

    # This runs after after we get the connection to kinvey
    promise.then (activeUser) ->
        # Create account
        $("#create").click ->
            createAccount()

        # Login
        $("#login").click ->
            login()
    ,
        (error) ->
            console.log "Error", error

    # Open the create user modal
    $("#createModalButton").click ->
        $("#createModal").modal()

    # Open the login modal
    $("#loginModalButton").click ->
        $("#loginModal").modal()

    
