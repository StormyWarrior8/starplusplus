module.exports = ($scope, kinvey) ->
    $scope.delete = ->
        kinvey.delete()
