require './config/environment'
require 'rack-flash'
class ApplicationController < Sinatra::Base
  use Rack::Flash
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'variousrandomletters' 
  end

  get "/" do 
    erb :welcome
  end

  get '/signup' do
    erb :"users/index"
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

  not_found do 
    status 400
    erb :error
  end

  helpers do 
    def logged_in?
        !!current_user
    end

    def current_user 
        @current_user ||=  User.find(session[:user_id]) if session[:user_id]
    end

    # def if_not_current_user?(user)
    #     current_user == user
    # end
    
    def protect?
       @book.user.id == current_user.id 
    end


  end

end
