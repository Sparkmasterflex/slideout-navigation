module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    coffee:
      options:
        bare: true
      glob_to_multiple:
        expand: true
        flatten: false
        cwd: "javascripts/coffee"
        src: ["**/*.coffee"]
        dest: "javascripts/src"
        ext: ".js"

    uglify:
      build:
        options:
          mangle: false
        files:
          "javascripts/production.js": ["javascripts/vendor/*.js", "javascripts/src/**/*.js"]


    imagemin:
      dynamic:
        files: [
          expand: true
          cwd: "images/"
          src: ["**/*.{png,jpg,gif}"]
          dest: "images/build/"
        ]


    cssmin:
      combine:
        files:
          "stylesheets/main.css": ["stylesheets/vendor/*.css", "stylesheets/src/*.css"]

    stylus:
      build:
        options:
          linenos: true
          compress: false
        files: [
          expand: true
          cwd: 'stylesheets/stylus'
          src: [ '**/*.styl' ],
          dest: 'stylesheets/src'
          ext: '.css'
        ]

    watch:
      options:
        livereload: true

      css:
        files: ["stylesheets/stylus/*.styl"]
        tasks: ["stylus", "cssmin"]
        options:
          spawn: false

      coffee:
        files: ["javascripts/coffee/*.coffee"]
        tasks: ["coffee", "uglify"]

      html:
        files: [
          "index.php"
          "index.html"
          "**/*.php"
          "**/*.html"
        ]

  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-contrib-imagemin"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks "grunt-contrib-coffee"

  # 4. Where we tell Grunt what to do when we type "grunt" into the terminal.
  grunt.registerTask "default", ["coffee", "stylus", "uglify", "cssmin", "watch"]
  # grunt.registerTask "build_production", ["coffee", "uglify", "stylus", "cssmin", "imagemin"]