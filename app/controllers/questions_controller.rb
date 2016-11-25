get 'questions/:id' do
  @question = Question.find(params[:id])
  # gives back total votes given for a specific question
  @votes = @question.votes
  # we can use this method inside our question/show view or here
  @value_total = votes_value(@votes)
  erb :'/questions/show'
end

get 'questions/new' do
  erb :'/questions/new'
end

post '/questions' do
  @question = Question.new(params[:question], user_id: current_user.id)
  if @post.save
    redirect "/questions/#{@question.id}"
  else
    @error = "Something went wrong! Please, try again"
    redirect '/'
  end
end

get 'questions/:id/edit' do
  erb :'/questions/edit'
end

put 'questions/:id' do
  @question = Question.find(params[:id])
  @question.update(params[:question])
  erb :'/questions/show'
end

delete 'questions/:id' do
  @question = Question.find(params[:id])
  @question.destroy
  redirect '/'
end
