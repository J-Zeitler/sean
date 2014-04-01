'use strict'

express = require 'express'
config = require './config'
path = require 'path'

module.exports = (app) ->

  app.configure ->
    app.use express.static path.join config.root, 'client'
    app.engine 'html', require('ejs').renderFile
    app.set 'views', config.root + '/client/views'
    app.set 'view engine', 'html'
    app.use express.json()
    app.use express.urlencoded() # enable req.body style http request objects
    app.use express.methodOverride() # enable delete and put
    app.use app.router