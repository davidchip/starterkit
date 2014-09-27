module.exports = ->


  @loadNpmTasks "grunt-contrib-coffee"


  @config "coffee", {

    build: {
      options: {
          sourceMap: true
      }
      files: [{
        expand: true,
        cwd: 'src/',
        src: ['**/*.coffee'],
        dest: 'target/',
        ext: '.js',
        extDot: 'first'
      }]
    }

    release: {
      files: [{
        expand: true,
        cwd: 'src/',
        src: ['**/*.coffee'],
        dest: 'target/',
        ext: '.js',
        extDot: 'first'
      }]
    }

  }
