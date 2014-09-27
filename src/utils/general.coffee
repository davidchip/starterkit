"""Utils that don't fit neatly into the other categories.
"""


define [
    'base/base_model',
    'jquery.modal',
], (BaseModel, jQueryModal) =>

    
    utils = {}


    utils.render_basic_modal = (options={}) ->
        """Close current modals and render the passed html or view as a modal.
        """
        close_duration = .7

        if options.html?
            markup = $("<div>").append(options.html)
        else
            markup = $("<div>").append(options.view.render().el)
        modal_options =
            overlayId: 'dark-overlay'
            opacity: 0
            appendTo: if options.appendTo? then options.appendTo else 'body'
            close: if options.close? then options.close else true
            closeClass: if options.closeClass? then options.closeClass else undefined

            onClose: (dialog) =>

                TweenLite.to(dialog.container, .3, {
                    ease: Power2.easeOut
                    opacity: 0
                    scaleX: .8
                    scaleY: .8
                    onComplete: () =>
                        dialog.overlay.removeClass('show')
                        setTimeout (() =>
                            dialog.container.remove()
                            dialog.data.remove()
                            dialog.overlay.remove()
                            $.modal.close()
                        ), 400

                        if options.onClose? then options.onClose()
                })

            onOpen: (dialog) =>
                dialog.overlay.addClass('show')

                render_markup = () =>
                    dialog.data.show()
                    dialog.container.css({
                        display: 'block'
                        opacity: 0
                    })

                    # dialog.container.css({
                    #     display: 'block'
                    #     marginLeft: -1 * (dialog.container.width() / 2)
                    #     marginTop: -1 * (dialog.container.height() / 2)
                    # })

                    TweenLite.fromTo(dialog.container, .3, {
                        opacity: 0
                        delay: .35
                        scaleX: .8
                        scaleY: .8
                    }, {
                        ease: Power2.easeIn
                        scaleX: 1
                        scaleY: 1
                        opacity: 1
                    })

                iframe = $(markup).find('iframe')
                if iframe.length > 0
                    iframe.load () =>
                        setTimeout (() =>
                            render_markup()
                        ), 700
                else
                    setTimeout (() =>
                        render_markup()
                    ), 350

        ## wait for other modal to close, before rendering new modal
        timeout_before_render = 150
        if $('#simplemodal-container').length > 0
            $.modal.close()
            timeout_before_render = close_duration * 1100

        setTimeout (() =>
            $(markup).modal(modal_options)
        ), timeout_before_render


    utils.scroll_with_page = (div_to_float) ->
        """Make sure that parent container of div_to_float has an
           explicit width, and position:relative. Make sure to also
           define the margins in the parent container, rather than
           the div to float.
        """
        if not div_to_float?
            return

        content = $("#content")

        $(document).scroll (event) =>
            window_offset = $(window).scrollTop()

            floater =  div_to_float  ## the object that will float
            if not floater.parent().offset()?
                $(document).unbind('scroll', event)
                return

            floater_offset = floater.parent().offset().top - 20

            if floater_offset < window_offset  ## see if we've scrolled past floater
                if floater.hasClass('fix-pos') is false
                    floater.css({width:floater.outerWidth()})  ## include padding in width
                    floater.addClass('fix-pos')

                    if not content.hasClass('prevent-transform')
                        content.addClass('prevent-transform')
            else
                floater.css({width:'auto'})
                floater.removeClass('fix-pos')
                content.removeClass('prevent-transform')


    return utils
