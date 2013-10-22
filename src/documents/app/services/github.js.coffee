module.exports = ($http, $q) ->
    # The base api url
    baseHost = "https://api.github.com"

    # Keep track of weather we are logged in or not
    githubAccessToken = undefined

    return {
        setAccessToken: (accessToken) ->
            githubAccessToken = accessToken
            
        getStars: ->
            deferred = $q.defer()

            promise = $http
                method: "GET"
                url: baseHost + "/user/starred"
                params:
                    access_token: githubAccessToken

            promise.success (data, status, headers, config) ->
                if link
                    # Get the rest of the requests to make from the link header
                    link = headers("Link").split(",")
                    link = link[link.length - 1].split(">;")[0].split("=")
                    link = link[link.length - 1]
                    console.log link

                deferred.resolve data

            promise.error (data, status, headers, config) ->
                deferred.reject data

            return deferred.promise
    }