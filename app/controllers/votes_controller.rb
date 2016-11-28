# create new vote
# post '/votes' do
#   @vote = Vote.new(user_id: current_user.id)
#   @vote.increment!(:value)
#   redirect '/'
# end

# update, increment votes
post '/questions/:id/votes' do
  @vote = Vote.new({user_id: params[:user_id],
                    value: params[:vote_val],
                    votable_id: params[:votable_id],
                    votable_type: params[:votable_type]})
  if @vote.save
    if request.xhr?
      question = Question.find_by(id: params[:votable_id])
        question.count_votes.to_s
    else
    redirect "/questions/#{params[:id]}"
    end
  else
    redirect "/questions/#{params[:id]}"
  end
end
