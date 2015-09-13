share.merge = (first, second) ->
  second[k] = v for k, v of first
  second

share.validateUser = ->
  throw new Meteor.Error('not-authorized') unless Meteor.userId()

share.distinctValues = (model, valueName, defaultValue = '') ->
  values = _.uniq model.find({}).map (m) ->
    if !!m[valueName] then m[valueName] else defaultValue

  values.map (value) ->
    result = {}
    result[valueName] = value
    result