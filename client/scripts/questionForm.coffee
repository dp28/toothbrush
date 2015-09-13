Template.questionForm.helpers
  questions: ->
    share.Questions.find {}, createdAt: 1

  questionIsRange: ->
    Session.get('questionType') is 'range'

  questionTypes: ->
    ['text', 'number', 'range', 'date', 'time', 'email', 'url'].map (type) ->
      type: type

  topics: ->
    share.distinctValues share.Questions, 'topic'

Template.questionForm.events
  'submit .new-question': (event) ->
    event.preventDefault()
    Meteor.call 'addQuestion', buildQuestion event.target
    resetForm event.target

  'change .question-type': (event) ->
    Session.set 'questionType', event.target.value

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