class Comment < ActiveRecord::Base
  # Remember to create a migration!
	belongs_to :commentable, polymorphic: true

  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable

  validates_presence_of :body
end
