Meteor.publish 'questions', -> share.Questions.find owner: @userId
