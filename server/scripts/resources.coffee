'use strict'

index = require './static'

module.exports = (app, db) ->
  # api resources
  require('./users/rest/routes')(app)

  # db schemas
  require('./users/repository/userModel').schema(db)

  # static files
  app.get '/partials/*', index.partials
  app.get '/*', index.index