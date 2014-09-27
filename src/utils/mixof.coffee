"""How to get mixins in coffeescript.
"""


define [

], () =>
  

    mixOf = (base, mixins...) ->
        class Mixed extends base
            for mixin in mixins by -1
                for name, method of mixin::
                    Mixed::[name] = method

        return Mixed


    return mixOf
