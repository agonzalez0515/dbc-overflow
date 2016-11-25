class Vote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :votable, polymorphic: true

  belongs_to :user
  belongs_to :question
  belongs_to :answer

 # method that counts total value of votes given for a particular question
  def votes_value(votes)
    @votes_value = 0
    @votes.each do |vote|
    @votes_value += vote.value
    end
  end
end
