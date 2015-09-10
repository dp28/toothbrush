Template.body.helpers
  questions: ->
    share.Questions.find {}, createdAt: 1

Template.body.events
  'submit .new-question': (event) ->
    event.preventDefault()
    Meteor.call 'addQuestion', buildQuestion event.target
    resetForm event.target

buildQuestion = (form) ->
  text: form.text.value

resetForm = (form) ->
  form.text.value = ''