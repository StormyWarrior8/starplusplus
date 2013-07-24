express = require "express"
passport = require "passport"

# Get an express instence
app = express()

app.configure ->
    app.use express.cookieParser()
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use express.session(secret: require("./secrets").SESSION_KEY)

    # Initialize Passport!  Also use passport.session() middleware, to support
    # persistent login sessions (recommended).
    app.use passport.initialize()
    app.use passport.session()
    app.use app.router


# Setup passport-github
GitHubStrategy = require("passport-github").Strategy;

passport.serializeUser (user, done) ->
    done null, user

passport.deserializeUser (obj, done) ->
    done null, obj

passport.use new GitHubStrategy {
    clientID: require("./secrets").GITHUB_CLIENT_ID,
    clientSecret: require("./secrets").GITHUB_CLIENT_SECRET,
    callbackURL: "http://localhost:3141/auth/github/callback"
  },
  (accessToken, refreshToken, profile, done) ->
        process.nextTick ->    
            return done(null, profile);

# Do some static files
app.use express.static __dirname + "/static"

# Auth paths
app.get "/auth/github", passport.authenticate("github")

app.get "/auth/github/callback", passport.authenticate("github", failureRedirect: "/login"), (req, res) ->
    res.redirect "/"

app.get "/logout", (req, res) ->
    req.logout()
    res.redirect "/"

app.get "/user", (req, res) ->
    if req.user
        res.send req.user
    else
        res.redirect "/"

console.log "Listening on http://localhost:3141..."
app.listen 3141