get '/questions/:id' do
  @question = Question.find(params[:id])
  # gives back total votes given for a specific question
  @votes = @question.votes
  @question_comments = @question.comments
  @question_answers = @question.answers

  # @answers_comments =
  # find answer's comments in a view
  # Instead of method for it in answer's model but maybe we have to set it in a view?
  erb :'/questions/show'
end

get 'questions/new' do
  erb :'/questions/new'
end

post '/questions' do
  @question = Question.new({body: params[:question],
                            title: params[:title],
                            user_id: params[:user_id]})
  if @question.save
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
