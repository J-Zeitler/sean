'use strict'

chai = require 'chai'
chai.should()

describe 'Hello World', ->
  hello = "world"
  it 'should equal world', ->
    hello.should.equal 'world'