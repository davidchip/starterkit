module.exports = ->


    # Load the tasks from the grunt_tasks folder
    @loadTasks("grunt_tasks")
  

    ## Used locally to compile our src, provide source maps, etc.
    ## remove our target/ directory
    @registerTask("local", [
        ## remove our target/ directory
        "clean:everything"

        ## compile and join our LESS
        "less:build"

        ## copy our external libraries and images over
        "copy:libs"
        "copy:images"

        ## encode the images in our initial_loading page
        ## to reduce requests
        "imageEmbed:build"

        ## compile our coffeescript with source maps
        "coffee:build"

        ## render our index.html file and update it
        "processhtml:build"

        ## keep a listener running for updates to .coffee/*.less files,
        ## and new images
        "watch"
    ])


    ## Moves all needed libraries, files, images, etc.
    ## over to our target/ directory, where they are passed through
    ## our r.js optimizer, css minifiers, and image optimizers.
    @registerTask("release", [
        ## remove our target/ directory
        "clean:everything",

        ## compile, join, and minify our LESS
        "less:release",

        ## copy our external libraries and images over
        "copy:libs",
        "copy:images",

        ## encode the images in our initial_loading page
        ## to reduce requests
        "imageEmbed:release"

        ## compile our coffeescript as usual, but don't provide source maps    
        "coffee:release",

        ## take our compiled coffeescript, join all of it with our libs,
        ## remove extraneous comments, and minify
        "requirejs:release",

        ## render our Django index.html file and update it
        "gitinfo",
        "processhtml:release",

        ## remove all extraneous files that aren't required for production
        "clean:release",

        ## rename source files for cache busting by appending the git HEAD
        "rename",

        ## let the world know about your awesomeness... well... maybe not
        ## the world. pop up a notification just for your own satisfaction
        "notify:release"
    ])
