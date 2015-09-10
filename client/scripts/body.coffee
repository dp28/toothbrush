Template.body.helpers
  questions: ->
    share.Questions.find {}, createdAt: 1

  topics: ->
    topics = _.uniq share.Questions.find({}).map (q) -> q.topic ?= ''
    topics.map (topic) -> value: topic

Template.body.events
  'submit .new-question': (event) ->
    console.log 'submit'
    event.preventDefault()
    Meteor.call 'addQuestion', buildQuestion event.target
    resetForm event.target

buildQuestion = (form) ->
  text:  form.text.value
  topic: form.newTopic.value or form.topic.value

resetForm = (form) ->
  form.text.value     = ''
  form.topic.value    = ''
  form.newTopic.value = ''