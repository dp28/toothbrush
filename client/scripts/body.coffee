Template.body.helpers
  questions: ->
    Template.instance().questions = share.Questions.find {}, createdAt: 1

  responses: ->
    share.Responses.find {}, createdAt: 1

  topics: ->
    topics = _.uniq share.Questions.find({}).map (q) -> q.topic ?= ''
    topics.map (topic) -> topic: topic

Template.body.events
  'submit .new-question': (event) ->
    event.preventDefault()
    Meteor.call 'addQuestion', buildQuestion event.target
    resetForm event.target

  'submit .new-response': (event) ->
    event.preventDefault()
    response = {}
    for question in Template.instance().questions.fetch()
      response[question._id] = event.target[question._id].value
      event.target[question._id].value = ''
    Meteor.call 'addResponse', response

buildQuestion = (form) ->
  text:  form.text.value
  topic: form.newTopic.value or form.topic.value

resetForm = (form) ->
  form.text.value     = ''
  form.topic.value    = ''
  form.newTopic.value = ''