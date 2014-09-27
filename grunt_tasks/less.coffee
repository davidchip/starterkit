module.exports = ->


  @loadNpmTasks "grunt-contrib-less"

  css = [
    'libs/reset.css', 
    'src/styles/**/*.less', 
    'bower_components/qtip2/jquery.qtip.min.css', 
    '!src/styles/initial_load.less'
  ]

  @config "less", {

    build: {
      files: {
        'target/initial_load.css': ['src/styles/initial_load.less']
        'target/styles.css': css
      },
    },


    local_release: {
      files: {
        'target/initial_load.min.css': ['src/styles/initial_load.less']
        'target/styles.min.css': css
      },
      options: {
        compress: true,
        cleancss: true
      },
    }


    release: {
      files: {
        'target/initial_load.min.css': ['src/styles/initial_load.less']
        'target/styles.min.css': css
      },
      options: {
        compress: true,
        cleancss: true
      },
    }

  }
