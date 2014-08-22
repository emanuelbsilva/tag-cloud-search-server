ddg = require 'ddg'

options =
  format: 'json'
  no_html: 1

search = (query, done) ->
  ddg.query query, options, (err, data) ->
    if err? then return done(err)
    done null, data.Definition


# Export
module.exports = search