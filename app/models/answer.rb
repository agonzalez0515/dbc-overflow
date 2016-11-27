class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates_presence_of :body

  def count_votes
    count = 0
    self.votes.each do |vote|
    count += vote.value
    end
    count
  end
end
