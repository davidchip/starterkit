

define [
    'base/base_model',
    'base/base_collection',
], (BaseModel, BaseCollection) =>


    UserModels = {}


    class UserModels.User extends BaseModel
        """
        """
        fetch: (options={}) ->
            if options.success? then options.success(@)


    return UserModels
