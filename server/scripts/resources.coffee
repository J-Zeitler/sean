'use strict'

index = require './static'

module.exports = (app) ->
  # api resources
  require('./users/rest/routes')(app)

  # static files
  app.get '/partials/*', index.partials
  app.get '/*', index.index