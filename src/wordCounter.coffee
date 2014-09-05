_ = require 'lodash'

isException = (word) ->
  exceptions = /(a|the|for|to|in|0-9|\|\/|it|us|=)$/
  not word.text.match exceptions

wordCounter = (text, maxResults) ->
  counts = _.countBy(text.split ' ')

  words = for word, count of counts
    text: word, size: count

  _(words).filter(isException)
          .sortBy('size')
          .last(maxResults)
          .value()

module.exports = wordCounter