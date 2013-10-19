module.exports = ->
    return {
        restrict: "A"
        require: "ngModel"
        link: (scope, element, attrs, ctrl) ->
            # Attach to both the element itself and the element it is checking against
            element.add("[name='#{attrs.passwordMatch}'").on "keyup", ->
                scope.$apply ->
                    # Check to see if the passwords march
                    ctrl.$setValidity "passwordMatch", element.val() == $("[name='#{attrs.passwordMatch}'").val()
    }