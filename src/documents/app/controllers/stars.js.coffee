module.exports = ($scope, github) ->
    github.getStars()
        .then (data) ->
            console.log data