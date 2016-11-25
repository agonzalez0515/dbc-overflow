class Vote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :votable, polymorphic: true
  
  belongs_to :user
  belongs_to :question
  belongs_to :answer
end
