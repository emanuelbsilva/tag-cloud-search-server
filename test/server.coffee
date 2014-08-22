ENV = 'test'

config = require('../src/config')('test')
start = require '../src/start'
chai = require 'chai'
chaiHttp = require 'chai-http'

chai.use chaiHttp
expect = chai.expect


describe 'server', ->
  server = chai.request("#{config.server.address}:#{config.server.port}")

  before (done) ->
    start 'test', done

  it 'should exist', (done) ->
    server.get('/').res (res) ->
      expect(res).to.have.status(200)
      done()