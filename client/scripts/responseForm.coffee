Template.responseForm.onRendered ->
  Template.instance().questions = share.Questions.find {}, createdAt: 1

Template.responseForm.helpers
  topics: ->
    share.distinctValues share.Questions, 'topic'

Template.responseForm.events
  'submit .new-response': (event) ->
    event.preventDefault()
    Meteor.call 'addResponse', buildResponse event.target

buildResponse = (form) ->
  response = {}
  for question in Template.instance().questions.fetch()
    if form[question._id]?
      response[question._id]   = form[question._id].value
      form[question._id].value = ''
  response