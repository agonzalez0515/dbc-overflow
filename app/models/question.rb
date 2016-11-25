class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :answers

  validates_presence_of :body
  validates_presence_of :title
end
