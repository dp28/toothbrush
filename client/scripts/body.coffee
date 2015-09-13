Template.body.helpers
  questions: ->
    Template.instance().questions = share.Questions.find {}, createdAt: 1

  responses: ->
    share.Responses.find {}, createdAt: 1

  topics: ->
    distinctValues share.Questions, 'topic'

  questionIsRange: ->
    Session.get('questionType') is 'range'

  questionTypes: ->
    ['text', 'number', 'range', 'date', 'time', 'email', 'url'].map (type) ->
      type: type

Template.body.events
  'submit .new-question': (event) ->
    event.preventDefault()
    Meteor.call 'addQuestion', buildQuestion event.target
    resetForm event.target

  'submit .new-response': (event) ->
    event.preventDefault()
    response = {}
    for question in Template.instance().questions.fetch()
      if event.target[question._id]?
        response[question._id] = event.target[question._id].value
        event.target[question._id].value = ''
    Meteor.call 'addResponse', response

  'change .question-type': (event) ->
    Session.set 'questionType', event.target.value

distinctValues = (model, valueName, defaultValue = '') ->
  values = _.uniq model.find({}).map (m) ->
    if !!m[valueName] then m[valueName] else defaultValue

  values.map (value) ->
    result = {}
    result[valueName] = value
    result

buildQuestion = (form) ->
  question =
    text:  form.text.value
    topic: form.newTopic.value or form.topic.value
    type:  form.type.value

  question.min = form.min.value if form.min?
  question.max = form.max.value if form.max?
  question

resetForm = (form) ->
  form.text.value     = ''
  form.topic.value    = ''
  form.newTopic.value = ''
  form.type.value     = ''