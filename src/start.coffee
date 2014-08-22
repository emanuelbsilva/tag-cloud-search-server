getConfig = require './config'
logging = require './logging'
server = require './server'
async = require 'async'

start = (ENV, done) ->
  config = getConfig ENV

  # Create logging
  log = logging(config.logging)

  # Create server
  server = server(config.server, log)

  # Start db Connection and Server
  async.parallel [
    server.listen()
  ], done


# run or export module
if require.main is module
  argv = require('minimist') process.argv.slice(2)
  start(argv._[0] ? 'dev')
else
  module.exports = start