'use strict'

express = require 'express'

config = require './config/config'

app = express();

require('./config/express')(app)

require('./resources')(app)

app.listen config.port, ->
  console.log 'Express server listening on port %d, serving from %s', config.port, config.root

exports = module.exports = app;