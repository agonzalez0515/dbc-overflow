get '/sessions/login' do
  erb :'/sessions/new'
end

post '/sessions'do
  @user = User.authenticate(params[:username],params[:password])
  if @user
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @error = "Username or password is not correct"
    erb :'/sessions/new'
  end
end

delete '/sessions' do
  session[:id] = nil
  redirect '/users'
end