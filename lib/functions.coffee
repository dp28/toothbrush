share.merge = (first, second) ->
  second[k] = v for k, v of first
  second

share.validateUser = ->
  throw new Meteor.Error('not-authorized') unless Meteor.userId()