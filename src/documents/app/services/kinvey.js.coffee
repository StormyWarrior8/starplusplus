kinveyCreds = require "../../config/kinveyCreds.json"

module.exports = ($http, $q) ->
    # The base host for all the requests
    baseHost = "https://baas.kinvey.com/"

    # The app auth
    auth = "Basic " + btoa("#{kinveyCreds.appKey}:#{kinveyCreds.appSecret}")

    # Check to see if we are already logged in
    if cookie.get("kinveyAccessToken")
        loggedIn = true
    else
        loggedIn = false

    return {
        signup: (username, email, password) ->
            deferred = $q.defer()

            # Send the request
            promise = $http
                method: "POST"
                url: baseHost + "user/" + kinveyCreds.appKey
                headers:
                    "Authorization": auth
                data:
                    username: username
                    email: email
                    password: password

            # Listen for the reply
            promise.success (data, status, headers, config) ->
                loggedIn = true
                # Set the cookies
                cookie.set "kinveyAccessToken", data._kmd.authtoken,
                    expires: 1
                cookie.set "kinveyUserId", data._id,
                    expires: 1
                deferred.resolve data

            promise.error (data, status, headers, config) ->
                deferred.reject data

            return deferred.promise
        login: (username, password) ->
            deferred = $q.defer()

            # Send the request
            promise = $http
                method: "POST"
                url: baseHost + "user/" + kinveyCreds.appKey + "/login"
                headers:
                    "Authorization": auth
                data:
                    username: username
                    password: password

            # Listen for the reply
            promise.success (data, status, headers, config) ->
                loggedIn = true
                # Set the cookies
                cookie.set "kinveyAccessToken", data._kmd.authtoken,
                    expires: 1
                cookie.set "kinveyUserId", data._id,
                    expires: 1
                deferred.resolve data

            promise.error (data, status, headers, config) ->
                deferred.reject data

            return deferred.promise
        logout: ->
            deferred = $q.defer()

            promise = $http
                method: "POST"
                url: baseHost + "user/#{kinveyCreds.appKey}/_logout"
                headers:
                    "Authorization": "Kinvey " + cookie.get("kinveyAccessToken")

            promise.success (data, status, headers, config) ->
                loggedIn = false
                # Unset the cookies
                cookie.remove "kinveyAccessToken"
                cookie.remove "kinveyUserId"
                deferred.resolve data

            promise.error (data, status, headers, config) ->
                deferred.reject data

            return deferred.promise
        delete: ->
            deferred = $q.defer()

            promise = $http
                method: "DELETE"
                url: baseHost + "user/#{kinveyCreds.appKey}/" + cookie.get("kinveyUserId")
                headers:
                    "Authorization": "Kinvey " + cookie.get("kinveyAccessToken")
                params:
                    "hard": true

            promise.success (data, status, headers, config) ->
                loggedIn = false
                # Unset the cookies
                cookie.remove "kinveyAccessToken"
                cookie.remove "kinveyUserId"
                deferred.resolve data

            promise.error (data, status, headers, config) ->
                deferred.reject data

            return deferred.promise
        isLoggedIn: ->
            return loggedIn
        checkUserExists: (username) ->
            deferred = $q.defer()

            promise = $http
                method: "POST"
                url: baseHost + "rpc/#{kinveyCreds.appKey}/check-username-exists"
                headers:
                    "Authorization": auth
                data:
                    username: username

            promise.success (data, status, headers, config) ->
                deferred.resolve data

            promise.error (data, status, headers, config) ->
                deferred.reject data

            return deferred.promise
    }