_ = require 'lodash'

wordCounter = (text) ->
  _.countBy text.split ' '

module.exports = wordCounter