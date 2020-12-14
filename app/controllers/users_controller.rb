class UsersController < ApplicationController

get '/signup' do
  erb :"users/index"
end


post "/signup" do
  user = User.new(params) 
  if !user.save
    flash[:message] = "Wrong email or password." #user.errors.full_messages.join(" // ")
    redirect "/signup"
  else
      user.save
      flash[:message] = "Signup successful. Please login now."
      session[:user_id] = user.id 
      redirect "/books"
  end
end



get '/login' do
  erb :"users/index"
end

post '/login' do
  @user = User.find_by(email: params["email"])
  if @user && @user.authenticate(params[:password])
    #In the code below, we see how we can ensure that we have a User AND that that User
    #is authenticated. If the user authenticates, we'll set the session[:password] and
    # redirect to the /books route. Otherwise, we'll redirect to the '/'' route
    # so our user can try again.
    session[:user_id] = @user.id
    redirect to '/books'
  else
    flash[:error] = "Please use correct email or password!"
    redirect to '/signup'
  end
end

get '/logout' do 
    session.delete(:user_id)  # delete just the user_id 
    # session.clear 
    redirect to '/signup'
end

get "/users/:id" do # get info on each user #argument for a method
  if !logged_in?
    redirect "/login"
  end
  @user = User.find_by_id(params["id"]) 
  @books = Book.find_by(params["user_id"]) # added 
  #erb :"/users/edit"
end


end
