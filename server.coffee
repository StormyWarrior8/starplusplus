express = require "express"
exphbs  = require "express3-handlebars"
github = require "octonode"

# Get an express instence
app = express()

# Do some setup
app.configure ->
    app.use express.cookieParser()
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use express.session(secret: require("./secrets").SESSION_KEY)

    # Setup handlebars
    app.engine "handlebars", exphbs({defaultLayout: "main"})
    app.set "view engine", "handlebars"

# Setup octonode
auth_url = github.auth.config({
    id: require("./secrets").GITHUB_CLIENT_ID
    secret: require("./secrets").GITHUB_CLIENT_SECRET
}).login(["user"]);

# Setup auth paths
app.get "/auth/login", (req, res) ->
    res.redirect auth_url

app.get "/auth/callback", (req, res) ->
    github.auth.login req.query.code, (err, token) ->
        console.log token
        res.redirect "/"

# Setup regular paths
app.get "/", (req, res) ->
    res.render "home"

# Do some static files
app.use express.static __dirname + "/static"

console.log "Listening on http://localhost:3141..."
app.listen 3141