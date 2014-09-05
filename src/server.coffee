requestLogger = require './requestLogger'
allowCrossDomain = require './allowCrossDomain'
express = require 'express'
http = require 'http'

wordCounter = require './wordCounter'

ddgSearch = require './duckDuckGo'
googleSearch = require './google'

server = (config, log) ->
  app = express()

  #Middleware
  app.use allowCrossDomain
  app.use requestLogger(log)


  # Root endpoint
  app.get '/', (req, res) -> res.status(200).end()


  # Search endpoint
  app.options '/words/:query', (req, res) ->
    res.send(200, success)
  
  app.get '/words/:query', (req, res) ->
    maxResults = parseInt(req.query.maxResults) ? 100
    googleSearch req.params.query, (err, words) ->
      if err? then return res.send(500)
      res.send wordCounter(words, maxResults)

  # Override listen
  app.listen = -> (done) =>
    server = http.createServer @
    server.listen.call server, config.port, ->
      log.info "Server started listening in port #{config.port}"
      done()

  return app

module.exports = server