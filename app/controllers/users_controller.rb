class UsersController < ApplicationController

post "/signup" do
  user = User.new(params) 
  if !user.save
    flash[:message] = "Wrong email or password."
    redirect "/signup"
  else
      user.save
      flash[:message] = "Signup successful. Please continue below."
      session[:user_id] = user.id 
      redirect "/books"
  end
end

get '/users/all' do
  if logged_in?     
    @books = current_user.books
    erb :"/users/all"
    else 
    redirect '/'
    end
  end
end

