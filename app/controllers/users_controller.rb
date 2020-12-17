class UsersController < ApplicationController

get '/signup' do
  erb :"users/index"
end


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



get '/login' do
  erb :"users/index"
end

post '/login' do
  @user = User.find_by(email: params["email"])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect to '/books'
  else
    flash[:error] = "Please use correct email or password!"
    redirect to '/signup'
  end
end

get '/logout' do 
    session.delete(:user_id)
    redirect to '/signup'
end

end
