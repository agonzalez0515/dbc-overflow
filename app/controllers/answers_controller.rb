# index comments

# new comments
get 'answers/new' do
  erb :'/answers/new'
end

post '/questions/:id/answers' do
  @answer = Answer.new(params[:answer], question_id: params[:id], user_id: current_user.id)
  if @comment.save
    redirect "/questions/#{params[:id]}"
  else
    @error = "Something went wrong! Please, try again"
    redirect '/'
  end
end

get 'answers/:id/edit' do
  erb :'/answers/edit'
end

put 'answers/:id' do
  @answer = Answer.find(params[:id])
  @answer.update(params[:answer])
  redirect "/questions/#{@answer.question_id}"
end

delete 'comments/:id' do
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect '/'
end
