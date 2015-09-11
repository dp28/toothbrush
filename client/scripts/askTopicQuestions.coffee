Template.askTopicQuestions.helpers
  topicName: ->
    @topic or 'No topic'

  questions: ->
    share.Questions.find { topic: @topic }, createdAt: 1