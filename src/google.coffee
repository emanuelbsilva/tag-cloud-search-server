google = require 'google'
_ = require 'lodash'
request = require 'request'
async = require 'async'
htmlToText = require 'html-to-text'

google.resultsPerPage = 20

parseResult = (result) ->
  (done) ->
    if !result.link? then return done null, ''
    request result.link, (err, res, body) ->
      if err? then return done null, ''
      if !body? then return done null, ''
      text = ''
      try 
        text = htmlToText.fromString(body)
      catch e
      finally
        done null, text


search = (query, done) ->
  google query, (err, next, links) ->
    if err? then return done err
    parseResults = _.map(links, parseResult)

    async.parallel parseResults, (err, results) ->
      if err then return done err
      done null, results.join(' ').replace(/(\n)/gm," ")


# Export
module.exports = search