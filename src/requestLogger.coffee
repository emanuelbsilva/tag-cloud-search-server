requestLogger = (log) ->
  (req, res, next) ->
    log.info req: req
    next()

module.exports = requestLogger