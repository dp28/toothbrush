Template.askTopicQuestions.helpers
  topicName: ->
    @topic or 'No topic'

  questions: ->
    console.log @topic
    share.Questions.find { topic: @topic }, createdAt: 1