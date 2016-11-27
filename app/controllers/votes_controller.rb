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
    redirect "/questions/#{params[:id]}"
  else
    redirect "/questions/#{params[:id]}"
  end
end
