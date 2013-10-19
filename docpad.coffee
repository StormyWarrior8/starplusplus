# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig =
    events:
        # Bundle my scripts with browserify. https://gist.github.com/balupton/4398093
        writeAfter: (opts, next) ->
            # Prepare
            docpad = @docpad
            rootPath = docpad.config.rootPath
            outPath = docpad.config.outPath
            {exec} = require "child_process"

            # Bundle the scripts the editor uses together
            command = """
                #{rootPath}/node_modules/.bin/browserify
                -e #{outPath}/main.js
                -o #{outPath}/bundle.js
                """.replace(/\n/g,' ')

            # Execute
            exec(command, {cwd:rootPath}, next)
            # Chain
            @
    plugins:
        coffeescript:
            # Compile coffeescript without wrapper, it needs to go through browserify first
            compileOptions:
                bare: true

# Export the DocPad Configuration
module.exports = docpadConfig
