'use strict'

express = require 'express'
config = require './config/config'
sequelize = require './config/sequelize'

# db instanciate
db = sequelize()

# instanciate app
app = express()
require('./config/express')(app)

# kind of primitive DI, maybe not the best
require('./resources')(app, db)

# setup db
db.syncronise()

# run server
app.listen config.port, ->
  console.log 'Express server listening on port %d, serving from %s', config.port, config.root

exports = module.exports = app;