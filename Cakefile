takeapeek = require "takeapeek"

path = 
    coffeescript: "node_modules/.bin/coffee"

spawn = (cmd, options, callback) ->
    p = child_process.spawn cmd, options.split " "
    p.stdout.on "data", (data) ->
        process.stdout.write data.toString()
    p.on "exit", ->
        callback?()

task "server", "serve the static files", ->
    tap = new takeapeek
        directory: "app"
        index: true
        dotfiles: true
        port: 3141
        verbose: true
    tap.listen()

task "coffee:compile", "Compile the coffeescript", ->
    spawn path.coffeescript, "--compile --output app/lib/ app/src/"

task "coffee:watch", "Compile and watch the coffeescript", ->
    spawn path.coffeescript, "--watch --compile --output app/lib/ app/src/"