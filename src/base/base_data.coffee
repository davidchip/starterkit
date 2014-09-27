

define [

], () =>


    BaseData = {}


    class BaseData.APIFetcher

        fetch: (options={}) =>
            if not @endpoints.get? and not options.endpoint?
                console.log "You have to define a get URL or an option.endpoint in #{@.__proto__.constructor.name}"
                return

            clean_data = options.clean_data
            url = if options.endpoint? then options.endpoint else @endpoints.get

            data = {}
            $.extend(data, _.omit(options, ['success', 'endpoint', 'error', 'clean_data']))

            ## try and fetch a user uuid if not specified
            if not data.user_id?
                try
                    user_id = window.app.user.get('uuid')
                catch error
                    user_id = undefined

                if user_id?
                    data.user_id = user_id

            ## return mock data if available
            if @mock_data?
                if clean_data?
                    clean_data(@mock_data)
                else
                    @clean_data(@mock_data)

                if options.success? then options.success(@)
                return

            $.ajax
                type: 'GET'
                url: url
                data: data
                success: (json) =>
                    if json.status is 'ok'
                        if clean_data?
                            clean_data(json.data)
                        else
                            @clean_data(json.data)

                        if options.success? then options.success(@)

                    else if json.status is 'login_error'
                        @router.redirect_to_login()

                    else
                        if options.error?
                            options.error(json.msg)
                        else
                            console.log """
                                Fetch Error
                                Object: #{@.__proto__.constructor.name}
                                Data Sent: \n #{JSON.stringify(data)}
                                URL Hit: \n #{url}
                                Backend Response: \n #{JSON.stringify(json)}
                            """

        clean_data: (data) =>
            return


    class BaseData.APIPoster

        post: (options={}) =>
            if not @endpoints.post? and not options.endpoint?
                console.log "You have to define a post URL or an option.endpoint in #{@.__proto__.constructor.name}"
                return

            clean_data = options.clean_data
            url = if options.endpoint? then options.endpoint else @endpoints.post

            data = {}
            $.extend(data, _.omit(options, ['success', 'endpoint', 'error', 'clean_data']))
            ## try and fetch a user uuid if not specified
            if not data.user_id?
                try
                    user_id = window.app.user.get('uuid')
                catch error
                    user_id = undefined

                if user_id?
                    data.user_id = user_id

            $.ajax
                type: 'POST'
                url: url
                data: data
                success: (json) =>
                    if json.status is 'ok'
                        if clean_data?
                            clean_data(json.data)
                        else
                            @clean_data(json.data)

                        if options.success? then options.success(@)

                    else if json.status is 'login_error'
                        @router.redirect_to_login()

                    else
                        if options.error?
                            options.error(json.msg)
                        else
                            console.log """
                                Post Error
                                Object: \n #{@.__proto__.constructor.name}
                                Data Sent: \n #{JSON.stringify(data)}
                                URL Hit: \n #{url}
                                Backend Response: \n #{JSON.stringify(json)}
                            """

        clean_data: (data) =>
            return


    return BaseData
