child_process = require "child_process"

takeapeek = require "takeapeek"

path = 
    coffeescript: "node_modules/.bin/coffee"
    browserify: "node_modules/.bin/browserify"
    nodemon: "node_modules/.bin/nodemon"

spawn = (cmd, options, callback) ->
    p = child_process.spawn cmd, options.split " "
    p.stdout.on "data", (data) ->
        process.stdout.write data.toString()
    p.on "exit", ->
        callback?()

task "all", "serve the files and watch the coffeescript", ->
    invoke "coffee:watch"
    invoke "server"

task "server", "serve the static files", ->
    tap = new takeapeek
        directory: "app"
        index: true
        dotfiles: true
        port: 3141
        verbose: true
    tap.listen()

task "coffee:compile", "Compile the coffeescript", ->
    spawn path.coffeescript, "--compile --map --output app/lib/ app/src/"

task "coffee:watch", "Compile and watch the coffeescript", ->
    spawn path.coffeescript, "--watch --compile --map --output app/lib/ app/src/"
