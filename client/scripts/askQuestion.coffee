Template.askQuestion.helpers
  previousResponse: ->
    previous = share.Responses.findOne({}, sort:  { createdAt: -1 })
    previous[@_id] if previous?

  questionType: ->
    @type ? 'text'

  isText: ->
    !@type? or @type is 'text'