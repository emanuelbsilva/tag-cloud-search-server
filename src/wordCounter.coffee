_ = require 'lodash'

isntException = (word) ->
  exceptions = /(the|and|for|are|its|this)$/
  word.text.length > 2 and not word.text.match exceptions

wordCounter = (text, maxResults) ->
  counts = _.countBy(text.toLowerCase().split ' ')

  words = for word, count of counts
    text: word, size: count

  _(words).filter(isntException)
          .sortBy('size')
          .last(maxResults)
          .value()

module.exports = wordCounter