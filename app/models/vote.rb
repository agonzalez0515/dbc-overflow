class Vote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :votable, polymorphic: true

  belongs_to :user
  belongs_to :question
  belongs_to :answer

 # method that counts total value of votes given for a particular question
  def count_votes
    count = 0
    self.votes.each do |vote|
    count += vote.value
    end
    count
  end
end
