logout = ->
    Kinvey.User.logout
        success: ->
            window.location.href = "/"

queryString = do ->
    query_string = {}
    query = window.location.search.substring(1)
    vars = query.split("&")
    i = 0

    while i < vars.length
        pair = vars[i].split("=")
        
        # If first entry with this name
        if typeof query_string[pair[0]] is "undefined"
            query_string[pair[0]] = pair[1]
        
        # If second entry with this name
        else if typeof query_string[pair[0]] is "string"
            arr = [query_string[pair[0]], pair[1]]
            query_string[pair[0]] = arr
        
        # If third or later entry with this name
        else
            query_string[pair[0]].push pair[1]
        i++
    query_string

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

        console.log queryString
        promise = Kinvey.execute "auth",
            code: queryString.code
        promise.then (response) ->
            user = Kinvey.getActiveUser()
            user.github_access_token = response.access_token
            promise = Kinvey.User.update user
            promise.then ->
                console.log "User updated"
    ,
        (error) ->
            console.log "Error", error
