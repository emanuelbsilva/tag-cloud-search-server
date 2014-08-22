bunyan = require 'bunyan'

# Define serializers
serializers = 
  req: (req) ->
    method: req.method
    url: req.url
    headers: req.headers

# Log creator
logging = (config) ->
  bunyan.createLogger(
    name: 'tag-cloud-search'
    serializers: serializers
    streams: config.streams
  )

# Export log
module.exports = logging