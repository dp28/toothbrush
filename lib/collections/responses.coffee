Responses = new Mongo.Collection 'responses'
share.Responses = Responses

Meteor.methods
  addResponse: (response) ->
    share.validateUser()
    Responses.insert share.merge response,
      createdAt: new Date()
      owner:     Meteor.userId()


