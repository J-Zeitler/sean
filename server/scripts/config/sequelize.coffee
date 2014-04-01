'use strict'

Sequelize = require('sequelize')

# singleton db connector
class Singleton
  instance = null

  class Instance
    constructor: ->
      @sequelize = new Sequelize 'sequelize-test', 'sequelize-test', 'pass', {
        dialect: 'mysql'
        port: 3306
      }
     
      @sequelize
      .authenticate()
      .complete (err) ->
        if !!err
          console.log 'Unable to connect to the database:', err
        else
          console.log 'Connection has been established successfully.'

      @sequelize.syncronise = ->
        this
        .sync({force: no})
        .complete (err) ->
          if !!err
            console.log 'An error occurred while create the table:', err
          else
           console.log 'Database syncronized'

  @getInstance: ->
    instance ?= new Instance().sequelize

module.exports = -> Singleton.getInstance()
