'use strict'

service = require '../service/api'

module.exports = (app) ->
  app.get '/users/', service.getAllUsers