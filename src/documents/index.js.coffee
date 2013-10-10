createAccount = ->
    promise = Kinvey.User.signup
        email: $("#createEmail").val()
        username: $("#createUsername").val()
        password: $("#createPassword").val()
    promise.then (response) ->
        window.location.replace("https://github.com/login/oauth/authorize?client_id=1d21cb5c8bbfe551cc30&scope=user")
    , (error) ->
        console.log error    

login = ->
    promise = Kinvey.User.login
        username: $("#loginUsername").val()
        password: $("#loginPassword").val()
    promise.then (response) ->
        window.location.href = "/stars"
    , (error) ->
        alert("Your username or password was incorrect")
        $("#login").prop "disabled", false

$ ->
    promise = Kinvey.init
        appKey: "kid_VT2OL9LIJi",
        appSecret: "3a612284be4a4a2eae5ffcf911c29395"

    # This runs after after we get the connection to kinvey
    promise.then (activeUser) ->
        # If the user is already logged in, redirect them
        if activeUser
            window.location.href = "/stars.html"
    ,
        (error) ->
            console.log "Error", error

    # Open the create user modal
    $("#createModalButton").click ->
        $("#createModal").modal()

    # Open the login modal
    $("#loginModalButton").click ->
        $("#loginModal").modal()

    # Do validations
    $("#createForm").parsley
        trigger: "keyup change"
        validators:
            # Check if the passwords match
            confirmpassword: (val) ->
                if $("#createPassword").val() == val
                    return true
                else
                    return false                
        messages:
            confirmpassword: "The passwords should match"
        listeners:
            # Add css on the errors
            onFieldError: ( elem, constraints, ParsleyField ) ->
                $(elem).parent().parent().addClass("has-error")
            onFieldSuccess:  (elem, constraints, ParsleyField ) ->
                $(elem).parent().parent().removeClass("has-error")
            onFormSubmit: ( isFormValid, event, ParsleyForm ) ->
                event.preventDefault()
                if isFormValid
                    $("#create").prop "disabled", true
                    promise = Kinvey.User.exists $("#createUsername").val(),
                        success: (usernameExists) ->
                            if not usernameExists
                                createAccount()
                            else
                                alert("Username is taken")
                                $("#createUsername").val("")
                                $("#createUsername").select()
                                $("#create").prop "disabled", false

    $("#loginForm").parsley
        trigger: "keyup change"
        listeners:
            # Add css on the errors
            onFieldError: ( elem, constraints, ParsleyField ) ->
                $(elem).parent().parent().addClass("has-error")
            onFieldSuccess:  (elem, constraints, ParsleyField ) ->
                $(elem).parent().parent().removeClass("has-error")
            onFormSubmit: ( isFormValid, event, ParsleyForm ) ->
                event.preventDefault()
                if isFormValid
                    $("#login").prop "disabled", true
                    login()