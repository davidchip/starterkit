

define [
    'backbone'
    'backbone_nested'
    'base/base_data', 
    'utils/mixof',
], (Backbone, BackboneNested, BaseData, mixOf) =>


    class BaseModel extends mixOf Backbone.NestedModel, BaseData.APIFetcher, BaseData.APIPoster

        endpoints:
            get: undefined
            post: undefined

        initialize: (options={}) =>
            super options
            
            @user = window.user
            @urls = window.urls

        clean_data: (data) =>
            for key, value of data
                @set(key, value)
    

    return BaseModel