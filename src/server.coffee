requestLogger = require './requestLogger'
express = require 'express'
http = require 'http'

server = (config, log) ->
  app = express()

  #Middleware
  app.use requestLogger(log)

  # Root endpoint
  app.get '/', (req, res) -> res.status(200).end()

  # Description endpoint
  app.get '/description/:query', (req, res) ->
    

  # Override listen
  app.listen = -> (done) =>
    server = http.createServer @
    server.listen.call server, config.port, ->
      log.info "Server started listening in port #{config.port}"
      done()

  return app

module.exports = server