"""Utils having to do with good old arrays.
"""


define [

], () =>


    utils = {}


    utils.is_array = (array) ->
        if array instanceof Array
            return true
        else
            return false


    utils.random_pluck = (array) ->
        return array[Math.floor(Math.random()*array.length)]


    utils.last = (array) ->
        """Retrieve the last element of the array.
        """
        return array[array.length - 1]


    return utils
