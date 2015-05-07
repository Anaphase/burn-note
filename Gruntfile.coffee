module.exports = (grunt) ->

  grunt.initConfig
    watch:
      options:
        livereload: yes
      siml:
        files: ['frontend/app/**/*.siml']
        tasks: ['siml']
      coffee:
        files: ['frontend/app/**/*.coffee']
        tasks: ['coffee']
      stylus:
        files: ['frontend/app/**/*.styl']
        tasks: ['stylus']

    concat:
      js:
        dest: 'frontend/public/vendor/scripts.js'
        src: [
          'frontend/bower_components/jquery/dist/jquery.js'
          'frontend/bower_components/bootstrap/dist/js/bootstrap.js'
        ]
      css:
        dest: 'frontend/public/vendor/styles.css'
        src: [
          'frontend/bower_components/bootstrap/dist/css/bootstrap.css'
        ]

    copy:
      main:
        expand: yes
        flatten: yes
        filter: 'isFile'
        src: 'frontend/bower_components/bootstrap/dist/fonts/**'
        dest: 'frontend/public/fonts/'
      bootstrapMap:
        expand: yes
        flatten: yes
        filter: 'isFile'
        src: 'frontend/bower_components/bootstrap/dist/css/bootstrap.css.map'
        dest: 'frontend/public/vendor/'

    coffee:
      options:
        bare: yes
      compile:
        files:
          'frontend/public/app/scripts.js': 'frontend/app/**/*.coffee'

    stylus:
      compile:
        files:
          'frontend/public/app/styles.css': 'frontend/app/**/*.styl'

    siml:
      options:
        parse: 'html5'
      parse:
        files:
          'frontend/public/index.html': 'frontend/app/siml/index.siml'

  grunt.loadNpmTasks 'grunt-siml'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-stylus'


  grunt.registerTask 'default', ['siml', 'coffee', 'stylus', 'copy', 'concat']
