class User < ActiveRecord::Base
  include BCrypt

  has_many :questions
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password_hash

  validates :username, :password_hash, presence: true

  validates :username, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    @user = User.find_by(username: username)
    if @user && @user.password == password
      @user
    else
      nil
    end
  end
end
