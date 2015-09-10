Questions = new Mongo.Collection 'questions'
share.Questions = Questions

Meteor.methods
  addQuestion: (question) ->
    throw new Meteor.Error('not-authorized') unless Meteor.userId()
    Questions.insert merge question,
      createdAt: new Date()
      owner:     Meteor.userId()

merge = (first, second) ->
  second[k] = v for k, v of first
  second

