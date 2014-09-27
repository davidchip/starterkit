module.exports = ->


  @loadNpmTasks "grunt-notify"


  @config "notify", {

    coffee:
      options:
        title: 'Great success!'
        message: 'Coffee compiled successfully'

    less:
      options:
        title: 'Naileddd it!'
        message: 'LESS compiled successfully'

    release:
      options:
        title: 'The force is strong with this one.'
        message: 'You\'re optimized app is ready to ship'

    files_added_to_target:
      options:
        title: 'Woahh there. You added a file to target'
        message: 'You should probably be adding it to src'

    
  }
