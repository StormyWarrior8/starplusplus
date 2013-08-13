define ["jquery", "lodash", "async"], ($, _, async) ->
    return (accessToken, callback) ->
        stars = []
        $.ajax
            url: "https://api.github.com/user/starred"
            dataType: "json"
            data:
                access_token: accessToken
            success: (data, textStatus, jqXHR) ->
                link = jqXHR.getResponseHeader "link"
                if link
                    # Multiple pages to get

                    # Append the first bit
                    stars = data

                    # Get the rest of the requests to make from the link header
                    link = link.split(",")
                    link = link[link.length - 1].split(">;")[0].split("=")
                    link = link[link.length - 1]

                    # Use async.queue to get the rest of the pages in order
                    worker = (task, callback) ->
                        $.ajax
                            url: "https://api.github.com/user/starred"
                            dataType: "json"
                            data:
                                access_token: accessToken
                                page: task
                            success: (data, textStatus, jqXHR) ->
                                stars = stars.concat data
                                callback()

                    queue = async.queue worker, 1
                    for i in [2..link]
                        queue.push i
                    queue.drain = ->
                        callback stars
                else
                    # We got them all
                    callback data
         