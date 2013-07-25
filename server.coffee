express = require "express"
everyauth = require "everyauth"

# Get an express instence
app = express()

# Do some setup
app.configure ->
    app.use express.cookieParser()
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use express.session(secret: require("./secrets").SESSION_KEY)

# Do some static files
app.use express.static __dirname + "/static"

console.log "Listening on http://localhost:3141..."
app.listen 3141