$(document).ready ->
    root = new Firebase "https://starplusplus.firebaseIO.com/"
    auth = new FirebaseSimpleLogin root, (error, user) ->
        if error then throw error
        console.log user
        if user
            $("#loginLogout").html "Logout"
        else
             $("#loginLogout").html "Login"

        $("#loginLogout").click ->
            if user
                auth.logout()
            else
                auth.login "github", scope: "user"

        $("#listStars").click ->
            console.log user
            $.ajax
                url: "https://api.github.com/user/starred"
                dataType: "json"
                data:
                    access_token: user.accessToken
                success: (data, textStatus, jqXHR) ->
                    console.log jqXHR.getResponseHeader("link")
                    $("#stars > ul").remove()
                    list = $("<ul></ul>", class: "list-unstyled")
                    for star in data
                        item = $("<li></li>")
                        item.html star.name
                        list.append item
                    $("#stars").append list
                    console.log $("#stars > ul > li").length
