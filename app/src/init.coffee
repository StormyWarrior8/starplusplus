require.config
    paths:
        jquery: "../vendor/jquery/jquery-1.10.2.min"
        ko: "../vendor/knockout/knockout-2.3.0"
        lodash: "../vendor/lodash/lodash.min"
        bootstrap: "../vendor/bootstrap/js/bootstrap.min"
        firebase: "../vendor/firebase/firebase"
        firebaseSimpleLogin: "../vendor/firebase/firebase-simple-login"
    shim:
        lodash:
            exports: "_"
        jquery:
            exports: "$"
        bootstrap:
            deps: ["jquery"]
        firebase:
            exports: "Firebase"
        firebaseSimpleLogin:
            deps: ["firebase"]
            exports: "FirebaseSimpleLogin"

require ["jquery", "lodash", "ko", "main"], ($, _, ko, main) ->
    $(document).ready ->
        main.go()
