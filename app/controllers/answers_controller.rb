# index comments

# new comments
get 'answers/new' do
  erb :'/answers/new'
end

# create answer to question
post '/questions/:id/answers' do
  @answer = Answer.new(params[:answer], question_id: params[:id], user_id: current_user.id)
  if @answer.save
    redirect "/questions/#{params[:id]}"
  else
    @error = "Something went wrong! Please, try again"
    redirect '/'
  end
end

# create comment to an answer
post '/questions/:id/answers/:answer_id/comments' do
  @comment = Comment.new(params[:comment], question_id: params[:id], user_id: current_user.id)
  if @comment.save
    redirect "/questions/#{params[:id]}"
  else
    @error = "Something went wrong! Please, try again"
    redirect '/'
  end
end

# edit
get 'answers/:id/edit' do
  erb :'/answers/edit'
end

# update
put 'answers/:id' do
  @answer = Answer.find(params[:id])
  @answer.update(params[:answer])
  redirect "/questions/#{@answer.question_id}"
end
# destroy
delete 'answers/:id' do
  @answer = Answer.find(params[:id])
  @answer.destroy
  redirect '/'
end
