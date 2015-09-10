Questions = new Mongo.Collection 'questions'
share.Questions = Questions

Meteor.methods
  addQuestion: (question) ->
    share.validateUser()
    Questions.insert share.merge question,
      createdAt: new Date()
      owner:     Meteor.userId()


