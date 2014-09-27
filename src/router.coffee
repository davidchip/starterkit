

define [
    'base/base_router',
], (BaseRouter) =>


    class Router extends BaseRouter

        _routes:
            "home":                                      "(home/)"

        home: () =>
            alert 'home'


    return Router
