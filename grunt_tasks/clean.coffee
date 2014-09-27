module.exports = ->


    @loadNpmTasks "grunt-contrib-clean"


    # Wipe out previous builds and test reporting.
    @config "clean", {

        everything: ["target/"],

        release: [
            "target/*"
            "!target/images/**"
            "!target/initial_load.min.css"
            "!target/styles.min.css"
            "!target/source.min.js"
            "!target/index.html"
        ]

    }

