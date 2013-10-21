module.exports = ($http, $q) ->
    return {
        setAccessToken: (key) ->
            cookie.set "githubAccessToken", key,
                expires: 1
    }