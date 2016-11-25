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

get 'comments/:id/edit' do
  erb :'/comments/edit'
end

put 'comments/:id' do
  @comment = Comment.find(params[:id])
  @comment.update(params[:comment])
  erb :'/questions/show'
end

delete 'comments/:id' do
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect '/'
end
