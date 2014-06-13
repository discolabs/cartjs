module.exports = function(grunt) {

  // Register tasks for this module.
  grunt.registerTask('docs', ['less:docs']);
  grunt.registerTask('watch', ['watch']);

  // Set up Grunt configuration.
  grunt.initConfig({

    // Stylesheet Compilation (LESS)
    less: {
      docs: {
        options: {
          compress: true
        },
        files: {
          'docs/assets/cartjs.min.css': 'docs/less/cartjs.less'
        }
      }
    },

    // Watching
    watch: {
      docs: {
        files: ['docs/**/*.less'],
        tasks: ['less:docs']
      }
    }

  });

  // Load task-providing plugins.
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-exec');

};