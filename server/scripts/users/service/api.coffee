'use strict'

# User service

exports.getAllUsers = (req, res) ->
  res.json {users: [{name: "John Doe"}]}