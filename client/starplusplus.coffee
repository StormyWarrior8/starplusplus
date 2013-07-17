Template.hello.greeting = ->
    return "Welcome to starplusplus.";

Template.hello.events
    "click input": ->
        # template data, if any, is available in "this"
        console.log("You pressed the button");
