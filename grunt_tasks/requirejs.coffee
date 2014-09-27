module.exports = ->


  @loadNpmTasks "grunt-contrib-requirejs"


  # This task uses James Burke's excellent r.js AMD builder to take all modules
  # and concatenate them into a single file.
  @config "requirejs", {

    release: {
      options: {
        baseUrl: "target/",
        include: "main",
        insertRequire: ["main"],
        mainConfigFile: "target/config.js",
        name: "../bower_components/almond/almond",
        optimize: "uglify2",
        out: "target/source.min.js",
        preserveLicenseComments: false,
        wrap: true
      }
    }

  }
