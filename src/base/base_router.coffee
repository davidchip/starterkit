

define [
    'backbone',
    'utils/general',
    'utils/querystring',
], (Backbone, GeneralUtils, QuerystringUtils) =>


    class BaseRouter extends Backbone.Router


        initialize: (options) =>
            """Allow the maker to either define a view in the route,
               OR a string that references a function.
            """
            super options

            @user = window.user
            @urls = window.urls

            @on('route', @on_route)

        routes: () ->
            """Allows for a more robust interface to override Backbone's default route
               detection.

            """
            routes = {}
            window.urls = {}

            for key, value of @_routes
                page_name = key.split(' -> ')[0]
                page_ref = key.split(' -> ')[1]
                page_url = value

                page_url_with_querystring = page_url + '(?:querystring)'

                if page_ref?
                    routes[page_url_with_querystring] = page_ref
                else
                    routes[page_url_with_querystring] = page_name

                window.urls[page_name] = '/' + (page_url.split('/')[0] + '/').replace(/\(/g, '')

            return routes

        on_route: (route_ref) ->
            _.defer () =>
                @nav_bar.update_selected_nav_item()

            if @[route_ref]?
                return
            else if route_ref.split('__').length > 1
                @display_page({
                    page_ref: route_ref
                })
            else
                console.log "router: couldn't find a matching function or view reference to render for url #{route_ref}"

        display_page: (options={}) ->
            {page, page_const, page_ref, page_options} = options

            if page?
                page_to_render = page
            else if page_const?
                page_to_render = new page_const(page_options)
            else if page_ref?
                page_module_str = page_ref.split('__')[0]
                page_module = eval(page_module_str)

                page_const_str = page_ref.split('__')[1]
                page_const = page_module[page_const_str]
                page_to_render = new page_const(page_options)

            page = page_to_render.render().el
            content.html(page)
            
            window.app.content_rendered.resolve()

        redirect_to_login: () =>
            """Redirect to the login page.
            """
            querystring = QuerystringUtils.get_parsed_querystring()
            querystring.redirect_to = window.location.pathname
            constructed = QuerystringUtils.construct_querystring(querystring)

            _.defer () =>
                @navigate("#{@urls.login}#{constructed}", {replace:true, trigger:true})


    return BaseRouter
