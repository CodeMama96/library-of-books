class UsersController < ApplicationController

get '/signup' do
  @books =Book.all 
  erb :"users/index"
end

post "/signup" do 
  user = User.new(email: params["email"], password: params["password"])

  if user.email.blank? || user.password.blank? || User.find_by_email(params["email"])
      redirect '/signup'
  else
      user.save 
      session[:user_id] = user.id# "log them in"
      redirect '/books'
  end
end

get '/login' do
  erb :"users/index"
end
post '/login' do
  @user = User.find_by(email: params["email"])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect to '/books'
  else
    redirect '/'
  end
end

get '/logout' do 
    session.delete(:user_id)  # delete just the user_id 
    # session.clear 
    redirect '/signup'
end


# get 'books/index' do
#   @books =Book.all 
#   @users = User.all
#   @user_book = []
#   @books.each do |u|
#     @user_book << u.user_id
#   end
#   erb :"/users/index"
# end
private


end
