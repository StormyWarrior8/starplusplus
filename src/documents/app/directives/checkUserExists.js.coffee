module.exports = (kinvey) ->
    return {
        restrict: "A"
        require: "ngModel"
        link: (scope, element, attrs, ctrl) ->
            element.on "keyup", ->
                scope.$apply ->
                    # Check to see if the username is taken
                    kinvey.checkUserExists(element.val())
                    .then (data) ->
                        ctrl.$setValidity "checkUserExists", !data.usernameExists
    }