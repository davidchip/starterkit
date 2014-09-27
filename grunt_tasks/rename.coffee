module.exports = ->


    @loadNpmTasks "grunt-rename"


    @config "rename", {

        release_initial_load: {
            src: "target/initial_load.min.css"
            dest: "target/initial_load_<%= gitinfo.local.branch.current.shortSHA %>.min.css"
        }

        release_styles: {
            src: "target/styles.min.css"
            dest: "target/styles_<%= gitinfo.local.branch.current.shortSHA %>.min.css"

        }

        release_source: {
            src: "target/source.min.js"
            dest: "target/source_<%= gitinfo.local.branch.current.shortSHA %>.min.js"
        }



    }