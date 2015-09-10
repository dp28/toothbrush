Meteor.publish 'questions', -> share.Questions.find owner: @userId
Meteor.publish 'responses', -> share.Responses.find owner: @userId
