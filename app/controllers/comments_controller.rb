# index comments

# new comments
get 'comments/new' do
  erb :'/comments/new'
end

post '/comments' do
  @comment = Comment.new(params[:comment], user_id: current_user.id)
  if @comment.save
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
