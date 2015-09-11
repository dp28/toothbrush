Template.askQuestion.helpers
  previousResponse: ->
    previous = share.Responses.findOne({}, sort:  { createdAt: -1 })
    previous[@_id] if previous?