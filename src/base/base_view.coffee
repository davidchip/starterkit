

define [
    'backbone'
], (Backbone) =>


    class BaseView extends Backbone.View

        template_data: {}

        initialize: (options) =>
            super options
            
            @router = window.router
            @user = window.user
            @urls = window.urls

        _pre_render: () =>
            return

        render: () =>
            if @login_required is true and @user.is_anonymous()
                return @router.redirect_to_login()

            @_pre_render()

            if not @template?
                console.log "Define a view template for #{@.__proto__.constructor.name}"

            template = _.template(@template, @)
            @dom_el = template

            $(@el).html(@dom_el)
            @dom_el = @el

            _.defer () =>
                @_post_render()

            return @

        _post_render: () =>
            return

        find_id: (id_key) =>
            if @template_data[id_key]?
                id_key = @template_data[id_key]
            
            return $(@dom_el).find("##{id_key}")


    return BaseView
    