wordCounter = require '../src/wordCounter'
expect = require('chai').expect

describe 'wordCounter', ->

  it 'should count words on text', ->
    results = 'aa': 1, 'a': 2, 'b': 1
    
    tokens = wordCounter('aa a b a')
    for token in tokens
      expect(token.size).to.equal results[token]
