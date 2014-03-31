# Grunt utils

module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.initConfig
    watch:
      # watch coffee files in client directory
      clientCoffee:
        files: 'client/scripts/**/*.coffee'
        tasks: ['coffee:compileClient']

      # watch coffee files in client directory
      serverCoffee:
        files: 'server/scripts/**/*.coffee'
        tasks: ['coffee:compileServer']

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
      
  grunt.registerTask 'default', ['watch']