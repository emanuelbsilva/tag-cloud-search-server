environments =
  # Development
  dev:
    server:
      address: 'http://localhost'
      port: 3000

    logging:
      streams: [
        stream: process.stderr, level: 'error'
        stream: process.stdout, level: 'info'
      ]

  # Testing
  test:
    server:
      address: 'http://localhost'
      port: 3000

    logging:
      streams: []

  # Production
  prod:
    server:
      address: 'http://localhost'
      port: 3000

    logging:
      streams: []

module.exports = (env) ->
  environments[env]