
module Utility
# helpers do
  def self.question_search(substring)
    @results = (Question.where("title like ?", "%#{substring}%") +
                Question.where("body like ?", "%#{substring}%"))
    @results.uniq
  end

  def self.user_search(substring)
    @user = User.where(username:substring)[0]
    if @user
      @results = Question.where(user_id:@user.id)
    end
    @results.uniq!
  end
end
