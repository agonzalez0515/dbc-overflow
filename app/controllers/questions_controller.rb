get 'questions/:id' do
  @question = Question.find(params[:id])
  # gives back total votes given for a specific question
  @votes = @question.votes
  # we can use this method inside our question/show view or here
  @value_total = votes_value(@votes)
end

post '/questions' do
  @question = Question.new(params[:question], user_id: current_user.id)
  if @post.save
    erb :'/questions/show'
  else
    @error =
end
