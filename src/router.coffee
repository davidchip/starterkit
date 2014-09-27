

define [
    'base/base_router',
], (BaseRouter) =>


    class Router extends BaseRouter

        _routes:
            "home":                                      "(home/)"

        initialize: (options) =>
            super options

        home: () =>
            alert 'home'


    return Router
