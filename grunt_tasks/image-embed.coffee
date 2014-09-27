module.exports = ->


  @loadNpmTasks "grunt-image-embed"


  @config "imageEmbed", {
    build: {
      src: [ "target/initial_load.css" ],
      dest: "target/initial_load.css",
      options: {
        deleteAfterEncoding : false
        maxImageSize: 0
      }
    }

    release: {
      src: [ "target/initial_load.min.css" ],
      dest: "target/initial_load.min.css",
      options: {
        deleteAfterEncoding : false
        maxImageSize: 0
      }
    }



    
  }
