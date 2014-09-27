"""Utils having to do with getting / updating the URL's querystring.
"""


define [

], () =>
    

    QueryUtils = {}


    QueryUtils.get_querystring = () ->
        """Return the window query string.
        """
        return "#{window.location.search}"


    QueryUtils.parse_querystring = (str) ->
        """Splits a querystring based on '&' and '='.
        """
        if not str
            return {}

        if str.indexOf('?') == 0
            str = str.slice(1)

        output = {}
        _.each str.split('&'), (pair) ->
            [key, value] = pair.split('=')
            if value in ["true", "True", "1", 1]
                v = true
            else if value in ["false", "False", "0", 0]
                v = false
            else
                v = value
            
            output[key] = v

        return output


    QueryUtils.get_parsed_querystring = () ->
        querystring = QueryUtils.get_querystring()
        parsed_querystring = QueryUtils.parse_querystring(querystring)

        return parsed_querystring


    QueryUtils.construct_querystring = (obj) ->
        """From an object, constructs a querystring.
        """
        if !obj? or $.isEmptyObject(obj)
            return ""
        return "?#{$.param(obj)}"


    QueryUtils.silently_update_querystring = (querystring_obj) ->
        """Updates the querystring without adding an entry to window.history.
        """
        current_url = window.location.pathname
        updated_url = current_url + QueryUtils.construct_querystring(querystring_obj)
        window.history.replaceState({}, '', updated_url)


    return QueryUtils
  