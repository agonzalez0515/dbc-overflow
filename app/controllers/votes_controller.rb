# create new vote
# post '/votes' do
#   @vote = Vote.new(user_id: current_user.id)
#   @vote.increment!(:value)
#   redirect '/'
# end

# update, increment votes
put '/questions/:id/votes' do
  @vote = Vote.find(question_id: params[:id])
  @vote.increment!(:value)
  redirect "/questions/#{params[:id]}"
end
