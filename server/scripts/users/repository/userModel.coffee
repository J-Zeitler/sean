'use strict'

Sequelize = require 'sequelize'

model = null
class UserModel
  constructor: (db) ->
    @User = db.define 'User', {
      username: Sequelize.STRING
      password: Sequelize.STRING
    }

exports.schema = (db) ->
  model ?= new UserModel(db)

exports.getAllUsers = (callback) ->
  model.User.findAll()
    .error (err) ->
      console.log "Sequelize error", err
      callback err
    .success (users) ->
      callback users

exports.createUser = (user, callback) ->
  console.log "creating user: ", user
  model.User
    .create {
      username: user.username
      password: user.password
    }
    .error (err) ->
      console.log "Sequelize error", err
      callback err
    .success (user) ->
      callback user