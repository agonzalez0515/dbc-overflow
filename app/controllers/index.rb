get '/' do
  @questions = Question.all
  # find top 10 questions with biggest total value of votes
  # @user = current_user
  erb :'index'
end
