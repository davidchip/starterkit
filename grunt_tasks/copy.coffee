module.exports = ->


  @loadNpmTasks "grunt-contrib-copy"


  # Move vendor and app logic during a build.
  @config "copy",

    images:
        files: [
            {
                expand: true,
                cwd: 'src/images/',
                src: ['**/*', '!*.psd'],
                dest: 'target/images/'
            }
        ]

    libs:
        files: [
            src: ["bower_components/**/*", "libs/**/*"]
            dest: "target/"
        ]

    # coffee:
    #     files: [
    #         src: "src/**/*"
    #         dest: "target/"
    #     ]
