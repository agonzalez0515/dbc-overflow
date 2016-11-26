class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :answers

  validates_presence_of :body
  validates_presence_of :title

  # method that counts total value of votes given for a particular question
   def count_votes
     count = 0
     self.votes.each do |vote|
     count += vote.value
     end
     count
   end
end
