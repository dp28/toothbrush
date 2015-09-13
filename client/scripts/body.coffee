Template.body.helpers
  responseCount: ->
    share.Responses.find({}).count()