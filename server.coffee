express = require "express"

app = express()

app.use express.static __dirname + "/static"

console.log "Listening on http://localhost:3141..."
app.listen 3141