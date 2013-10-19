kinveyCreds = require "../../config/kinveyCreds.json"

module.exports = ($http, $q) ->
    # The base host for all the requests
    baseHost = "https://baas.kinvey.com/"

    # The app auth
    auth = "Basic " + btoa("#{kinveyCreds.appKey}:#{kinveyCreds.appSecret}")

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
                # Set the cookies
                cookie.set "kinveyAccessToken", data._kmd.authtoken,
                    expires: 1
                cookie.set "kinveyUserId", data._id,
                    expires: 1
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
                # Unset the cookies
                cookie.remove "kinveyAccessToken"
                cookie.remove "kinveyUserId"
                deferred.resolve data

            promise.error (data, status, headers, config) ->
                deferred.reject data

            return deferred.promise
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