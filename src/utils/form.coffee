"""Utils that help validate, serialize, process forms.
"""


define [

], () =>


    utils = {}


    utils.is_email = (str) ->
        email_regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/
        return email_regex.test(str)


    utils.scrape_form_data = (form) ->
        """Scrapes the given form for the value of each named input field.
        """
        form_data = {}
        $(form).find('input, textarea').each (index, input) ->
            input = $(input)

            if input.attr('name')
                if input.attr('type') is 'radio'
                    if input.prop('checked') is true
                        form_data[input.attr('name')] = input.val()
                else if input.attr('type') is 'checkbox'
                    form_data[input.attr('name')] = input.prop('checked')
                else
                    form_data[input.attr('name')] = input.val()
            # Stops Jquery from being a big weirdo
            return true

        $(form).find('select').each (index, select) ->
            select = $(select)
            if select.attr('name')
                form_data[select.attr('name')] = select.find('option:selected').attr('value')

        return form_data


    utils.clear_form = (form) ->
        $(form).find('input, textarea').each (index, input) ->
            input = $(input)
            if input.attr('type') == 'text'
                input.val('')


    return utils
