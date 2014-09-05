_ = require 'lodash'

wordCounter = (text, maxResults) ->
  counts = _.countBy(text.split ' ')

  words = for word, count of counts
    text: word, size: count

  _(words).sortBy('size')
          .last(maxResults)
          .value()

module.exports = wordCounter