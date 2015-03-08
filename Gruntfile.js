module.exports = function(grunt) {
  var raw_assets = 'assets/';
  var compiled_assets = 'public/assets/';
  var bower = 'bower_components/';

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    coffee: {
      options: {
        join: true,
      },
      dist: {
        expand: true,
        flatten: true,
        cwd: raw_assets,
        src: ['**/*.coffee'],
        dest: compiled_assets + 'coffee/',
        ext: '.js'
      },
    },

    concat: {
      options: {
        separator: ';',
      },
      dist: {
        files: [{
          src: [bower + 'lodash/lodash.js', bower + 'icanhazjs/ICanHaz.js'],
          dest: compiled_assets + 'vendor.js',
        },
        {
          src: [compiled_assets + 'coffee/global.js'],
          dest: compiled_assets + 'global.js'
        }],
      }
    },

    uglify: {
      options: {
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n',
        mangle: true
      },
      dist: {
        files: [{
          expand: true,
          cwd: compiled_assets,
          src: ['*.js', '!*.min.js'],
          dest: compiled_assets,
          ext: '.min.js',
        }]
      }
    },

    watch: {
      scripts: {
        files: ['assets/**/*.js', 'assets/**/*.coffee', 'assets/**/*.scss'],
        tasks: ['build'],
        options: {
          spawn: false,
        },
      },
    },

    sass: {
      options: {
        sourceMap: false,
      },
      dist: {
        files: [{
          src: [raw_assets + 'stylesheets/style.scss'],
          dest: compiled_assets + 'style.css'
        }],
      },
    },
  });

  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-sass');

  grunt.registerTask('build', ['coffee', 'sass', 'concat']);
  grunt.registerTask('prod', ['build', 'uglify']);
  grunt.registerTask('default', ['build']);

};
