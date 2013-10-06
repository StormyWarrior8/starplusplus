$ ->
    promise = Kinvey.init
        appKey: "kid_VT2OL9LIJi",
        appSecret: "3a612284be4a4a2eae5ffcf911c29395"

    promise.then (activeUser) ->
        console.log "Active user:", activeUser
    ,
        (error) ->
            console.log "Error", error

    # Open the create user modal
    $("#createModalButton").click ->
        $("#createModal").modal()

    # Open the login modal
    $("#loginModalButton").click ->
        $("#loginModal").modal()