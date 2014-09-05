wordCounter = require '../src/wordCounter'
expect = require('chai').expect

describe 'wordCounter', ->

  it 'should count words on text', ->
    results = 'aa': 1, 'as': 2, 'b': 1

    tokens = wordCounter('aa as b as', 10)

    for token in tokens
      expect(token.size).to.equal results[token.text]

  it 'should not return exception words', ->
    tokens = wordCounter('aa a d to to to', 10)
    expect(tokens).to.have.length 2
