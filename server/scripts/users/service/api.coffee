'use strict'

repository = require '../repository/userModel'

# User service

exports.getAllUsers = (req, res) ->
  repository.getAllUsers (dbResponse) ->
    res.json {users: dbResponse}

exports.createUser = (req, res) ->
  user = req.body
  repository.createUser user, (dbResponse) ->
    res.json {user: dbResponse}