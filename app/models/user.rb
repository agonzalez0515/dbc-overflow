class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :questions
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password_hash
end
