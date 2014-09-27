

define [
    'DateJS',
    'jquery',
    'jquery.modal'
    'router',
    'models/user',
    'underscore'
], (DateJS, jQuery, jQueryModal, Router, UserModels, Underscore) =>


    window.app = {}
    window.app.app_loaded = new $.Deferred()
    window.app.content_rendered = new $.Deferred()


    ## configure underscore templating
    _.templateSettings = {
        evaluate:    /\{\%(.+?)\%\}/g
        interpolate: /\{\{(.+?)\}\}/g
        escape:      /\{\{-(.+?)\}\}/g
    };


    ## when a <a> tag with class 'push-state' is tapped,
    ## treat that like a router.navigate call
    $('body').delegate('.push-state', 'click', (event) =>
        event.preventDefault()
        e = $(event.currentTarget)
        window.router.navigate(e.attr('href'), {trigger:true})
    )


    ## render our app when our content's appeared
    $.when(window.app.content_rendered).then(() =>
        $('#initial_load').animate({opacity:0}, 400, () =>
            setTimeout (() =>
                $('body').addClass('loaded')
            ), 50

            setTimeout (() =>
                $('#initial_load_container').animate({opacity:0}, 400, () =>
                    $('#initial_load_container').remove())
                $('#app').css({visibility:'visible'}).animate({opacity:1}, 400, () =>
                    window.app.app_loaded.resolve())
            ), 100
        )
    )

    ## start our app
    window.router = new Router()
    Backbone.history.start({ pushState: true })
