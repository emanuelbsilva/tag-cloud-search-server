requestLogger = require './requestLogger'
express = require 'express'
http = require 'http'

wordCounter = require './wordCounter'

ddgSearch = require './duckDuckGo'
googleSearch = require './google'

server = (config, log) ->
  app = express()

  #Middleware
  app.use requestLogger(log)

  # Root endpoint
  app.get '/', (req, res) -> res.status(200).end()

  # Search endpoint
  app.get '/words/:query', (req, res) ->
    googleSearch req.params.query, (err, words) ->
      if err? then return res.send(500)
      res.send wordCounter(words)

  # Override listen
  app.listen = -> (done) =>
    server = http.createServer @
    server.listen.call server, config.port, ->
      log.info "Server started listening in port #{config.port}"
      done()

  return app

module.exports = server