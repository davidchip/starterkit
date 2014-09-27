"""
"""


define [
    'utils/array'
], (ArrayUtils) =>

    
    utils = {}


    utils.capitalize = (s) ->
        return s.charAt(0).toUpperCase() + s.slice(1)


    utils.strip_whitespace_padding = (str) ->
        stripped = str.replace(/^\s+|\s+$/g,'')
        return stripped


    utils.is_string = (str) ->
        if typeof str == 'string' or typeof str == "object" and str.constructor is String
            return true
        else
            return false


    utils.contains_string = (input_string, contains_string) ->
        """Test if a string contains another string
        """
        if ArrayUtils.is_array(contains_string)
            contains = false
            for string in contains_string
                if input_string.indexOf(string) > -1
                    contains = true

            return contains
        
        return input_string.indexOf(contains_string) > -1


    utils.generate_hash = (str) ->
        str = "#{str}"
        hash = 0
        i = undefined
        chr = undefined
        len = undefined

        if str.length is 0
            return hash  
        
        i = 0
        len = str.length
        while i < len
            chr = str.charCodeAt(i)
            hash = ((hash << 5) - hash) + chr
            hash |= 0  # Convert to 32bit integer
            i++
        hash


    return utils
