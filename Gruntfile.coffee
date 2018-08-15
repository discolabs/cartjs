module.exports = (grunt) ->

  # Initialise
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    meta:
      banner:
        '// Cart.js\n' +
        '// version: <%= pkg.version %>\n' +
        '// author: <%= pkg.author %>\n' +
        '// license: <%= pkg.licenses[0].type %>\n'

    coffee:
      build:
        options:
          join: true
        files:
          'dist/cart.js': [
            'src/cart.coffee'
            'src/item.coffee'
            'src/cartjs.coffee'
            'src/utils.coffee'
            'src/queue.coffee'
            'src/core.coffee'
            'src/data.coffee'
            'src/rivets.coffee'
            'src/export.coffee'
          ]

    concat:
      build:
        options:
          banner: '<%= meta.banner %>'
        files:
          'dist/rivets-cart.js': [
            'node_modules/sightglass/index.js',
            'node_modules/rivets/dist/rivets.js',
            'dist/cart.js'
          ]

    uglify:
      build:
        options:
          banner: '<%= meta.banner %>'
          report: 'gzip'
        files:
          'dist/cart.min.js': 'dist/cart.js'
          'dist/rivets-cart.min.js': 'dist/rivets-cart.js'

    clean:
      build:
        src: []

    terraform:
      docs:
        options:
          data: {
            docs: grunt.file.readJSON('docs/docs.json'),
            version: '<%= pkg.version %>'
          }
        files:
          'docs/theme/snippets/variables.liquid': 'docs/snippets/variables.jade'
          'docs/theme/templates/index.liquid': 'docs/index/index.jade'
          'docs/theme/templates/page.guide.liquid': 'docs/guide/guide.jade'
          'docs/theme/templates/page.reference.liquid': 'docs/reference/reference.jade'
          'docs/theme/templates/page.built-with.liquid': 'docs/built-with/built-with.jade'

    compress:
      docs:
        options:
          archive: 'cartjs.zip'
        files: [
          flatten: true
          expand: true
          cwd: 'dist/'
          src: '*.js'
        ]

    copy:
      docs:
        files: [
          src: 'dist/rivets-cart.min.js'
          dest: 'docs/theme/assets/rivets-cart.min.js'
        ,
          src: 'cartjs.zip'
          dest: 'docs/theme/assets/cartjs.zip'
        ,
          src: 'node_modules/shopify.i18n.js/dist/shopify.i18n.min.js'
          dest: 'docs/theme/assets/shopify.i18n.min.js'
        ]

    less:
      docs:
        options:
          compress: true
        files:
          'docs/theme/assets/cartjs.min.css': 'docs/less/cartjs.less'

    watch:
      build:
        files: 'src/*.coffee'
        tasks: ['build']
      docs:
        files: 'docs/**/*.less'
        tasks: ['less:docs']

    mocha_phantomjs:
      test: ['spec/**/*.html']

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-compress'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-terraform'
  grunt.loadNpmTasks 'grunt-mocha-phantomjs'

  grunt.registerTask 'default', ['watch']
  grunt.registerTask 'build',   ['coffee:build', 'concat:build', 'uglify:build', 'clean:build']
  grunt.registerTask 'test',    ['build', 'mocha_phantomjs']
  grunt.registerTask 'docs',    ['build', 'terraform:docs', 'compress:docs', 'copy:docs', 'less:docs']
