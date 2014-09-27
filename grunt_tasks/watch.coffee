module.exports = ->


  @loadNpmTasks "grunt-contrib-watch"


  @config "watch", {

    less: {
      files: 'src/styles/**/*.less',
      tasks: ['less:build', 'notify:less']
    }

    coffee: {
        files: 'src/**/*.coffee',
        tasks: ['newer:coffee:build', 'notify:coffee']
    }

    images: {
        files: 'src/images/**/*',
        tasks: ['newer:copy:images']
        events: ['added', 'changed']
    }

    # file_added_to_target: {
    #     files: ['target/**/*', '!target/images/**']
    #     tasks: ['notify:files_added_to_target']
    # }

    ## todo, added handling of deleted images 
    ## so that they are also deleted from target/
    
  }
