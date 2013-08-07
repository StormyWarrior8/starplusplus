$(document).ready ->
    root = new Firebase "https://starplusplus.firebaseIO-demo.com/"
    root.set "Firebase is awesome!"
    console.log "Set data"
    root.on "value", (snapshot) ->
        console.log "Got data:", snapshot.val()
        $("#data").html snapshot.val()