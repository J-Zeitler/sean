# Grunt utils

# path = require 'path'

module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-rerun'
  grunt.loadNpmTasks 'grunt-express-server'

  grunt.initConfig
    watch:
      # watch coffee files in client directory
      clientCoffee:
        files: 'client/scripts/**/*.coffee'
        tasks: ['coffee:compileClient']

      # watch coffee files in client directory
      serverCoffee:
        files: 'server/scripts/**/*.coffee'
        tasks: ['coffee:compileServer', 'rerun:dev:express:go']

      express:
        files: [ 'server/js/**/*.js' ]
        tasks: [ 'express:dev' ]
        options:
          spawn: false 

    # compile coffee
    coffee:
      compileClient:
        expand: true
        flatten: true
        cwd: "#{__dirname}/client/scripts/"
        src: ['**/*.coffee']
        dest: 'client/js/'
        ext: '.js'

      compileServer:
        expand: true
        flatten: false # keep directory srtucture on server side
        cwd: "#{__dirname}/server/scripts/"
        src: ['**/*.coffee']
        dest: 'server/js/'
        ext: '.js'

    # run server
    express:
      dev:
        options:
          script: 'server/js/server.js'

    # rerun server
    rerun:
      dev:
        options:
          tasks: ['express']
      
  grunt.registerTask 'default', ['express', 'watch']