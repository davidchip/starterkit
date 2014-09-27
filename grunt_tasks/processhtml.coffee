module.exports = ->


  @loadNpmTasks "grunt-processhtml"


  # Convert the development sources to production in the HTML.
  @config "processhtml", {
    
    build: {
      options: {
        data: {
          favicon_src: "href='{% static 'images/favicon.ico' %}'"
          loading_src: "href='{% static 'target/initial_load.css' %}'"
          css_src: "href='{% static 'target/styles.css' %}'"
          require_src: "src='{% static 'bower_components/requirejs/require.js' %}'"
          main_src: "data-main='{% static 'target/config.js' %}'"
        }
      },
      files: {
        "../templates/index.html": ["index.html"]
      }
    },

    local_release: {
      options: {
        data: {
          favicon_src: "href='{% static 'images/favicon.ico' %}'"
          loading_src: "href='{% static 'target/initial_load_<%= gitinfo.local.branch.current.shortSHA %>.min.css' %}'"
          css_src: "href='{% static 'target/styles_<%= gitinfo.local.branch.current.shortSHA %>.min.css' %}'"
          require_src: ""
          main_src: "src='{% static 'target/source_<%= gitinfo.local.branch.current.shortSHA %>.min.js' %}'"
        }
      }
      files: {
        "../templates/index.html": ["index.html"]
      }
    }

    release: {
      options: {
        data: {
          favicon_src: "href='{% static 'images/favicon.ico' %}'"
          loading_src: "href='{% static 'initial_load_<%= gitinfo.local.branch.current.shortSHA %>.min.css' %}'"
          css_src: "href='{% static 'styles_<%= gitinfo.local.branch.current.shortSHA %>.min.css' %}'"
          require_src: ""
          main_src: "src='{% static 'source_<%= gitinfo.local.branch.current.shortSHA %>.min.js' %}'"
        }
      }
      files: {
        "../templates/index.html": ["index.html"]
      }
    }

  }
