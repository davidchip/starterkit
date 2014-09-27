

define [
    'backbone',
    'base/base_data', 
    'utils/array',
    'utils/mixof'
], (Backbone, BaseData, ArrayUtils, mixOf) =>


    class BaseCollection extends mixOf Backbone.Collection, BaseData.APIFetcher, BaseData.APIPoster

        collection_model: undefined

        endpoints:
            get: undefined
            post: undefined

        initialize: (options={}) =>
            super options

            @user = window.user
            @urls = window.urls

        fetch: (options={}) =>
            if not @collection_model?
                console.log "Define a collection model for #{@.__proto__.constructor.name}"
                return

            super options

        clean_data: (data) =>
            if ArrayUtils.is_array(data)
                for model in data
                    _model = new @collection_model()
                    _model.clean_data(model)
                    @push(_model)
    

    return BaseCollection