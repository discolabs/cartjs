module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    meta:
      banner:
        '// Cart.js\n' +
        '// version: <%= pkg.version %>\n' +
        '// author: <%= pkg.author %>\n' +
        '// license: <%= pkg.licenses[0].type %>\n'

    coffee:
      all:
        options:
          join: true
        files:
          'dist/cart.js': [
            'src/cart.coffee'
            'src/requests.coffee'
            'src/items.coffee'
            'src/attributes.coffee'
            'src/export.coffee'
          ]

    concat:
      all:
        options:
          banner: '<%= meta.banner %>'
        files:
          'dist/cart.js': 'dist/cart.js'

    uglify:
      all:
        options:
          banner: '<%= meta.banner %>'
          report: 'gzip'
        files:
          'dist/cart.min.js': 'dist/cart.js'

    copy:
      docs:
        src: 'dist/cart.min.js'
        dest: 'docs/assets/cart.min.js'

    less:
      docs:
        options:
          compress: true
        files:
          'docs/assets/cartjs.min.css': 'docs/less/cartjs.less'

    watch:
      all:
        files: 'src/*.coffee'
        tasks: ['build']
      docs:
        files: 'docs/**/*.less'
        tasks: ['less:docs']

  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['watch']
  grunt.registerTask 'build',   ['coffee', 'concat', 'uglify']
  grunt.registerTask 'docs',    ['build', 'copy:docs', 'less:docs']